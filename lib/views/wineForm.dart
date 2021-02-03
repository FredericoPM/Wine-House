import 'package:flutter/material.dart';
import 'widgets/formTextField.dart';
import '../models/vinho.dart';
import '../controllers/paises.dart';
import '../controllers/pesquisaAproximada.dart';

class WineForm extends StatefulWidget {
  void Function(Vinho v) onAdd;
  void Function(Vinho v) onEddit;
  Vinho vinho;
  WineForm({this.onAdd, this.vinho, this.onEddit});
  @override
  _WineFormState createState() => _WineFormState(vinho);
}

class _WineFormState extends State<WineForm> {

  final _formKey = GlobalKey<FormState>();
  PesquisaAproximada pesquisa = PesquisaAproximada();
  PaisesController paisController = PaisesController();

  TextEditingController _nomeController = TextEditingController();
  TextEditingController _paisTextController = TextEditingController();
  TextEditingController _regiaoController = TextEditingController();
  TextEditingController _tipoController = TextEditingController();
  TextEditingController _safraController = TextEditingController();
  TextEditingController _notaRPController = TextEditingController();
  TextEditingController _notaWSController = TextEditingController();
  TextEditingController _beberRPController = TextEditingController();
  TextEditingController _quantidadeController = TextEditingController();
  TextEditingController _etiquetaController = TextEditingController();

  final sizedBoxSpace = SizedBox(height: 16);
  Vinho vinho;
  _WineFormState(this.vinho){
    if(vinho != null){
      _nomeController.text = vinho.nome;
      _paisTextController.text = vinho.pais;
      _regiaoController.text = vinho.regiao;
      _tipoController.text = vinho.tipo;
      _safraController.text = vinho.safra.toString();
      _notaRPController.text = vinho. notaRP.toString();
      _notaWSController.text = vinho.notaWS.toString();
      _quantidadeController.text = vinho.quantidade.toString();
      _etiquetaController.text = vinho.etiqueta;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.keyboard_backspace,
              color: Theme.of(context).primaryColor,
              size: 30,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(
            vinho == null ? "Novo vinho" : "Editar vinho",
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(15,5,15,15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      FormTextField(
                        controller: _nomeController,
                        hintText: "Nome",
                        errorText: "Por favor preencha o nome",
                      ),
                      sizedBoxSpace,
                      FormTextField(
                        controller: _paisTextController,
                        hintText: "Pais de origem",
                        errorText: "Por favor preencha o pais de origem",
                        //sera utilizado para fazer uma correção automatica da entrada para poder buscar a dados posteriormente
                        onFocusExit: () {
                          if(_paisTextController.text != "" && _paisTextController.text.length > 3){
                            int menorDistancia = 2;
                            String newText;
                            paisController.paisesDisponiveis.forEach((p) {
                              int distanciaAtual = pesquisa.distancia(_paisTextController.text.toUpperCase(), p['pais'].toUpperCase());
                              if(distanciaAtual < menorDistancia){
                                menorDistancia = distanciaAtual;
                                newText = p['pais'];
                              }
                              if(menorDistancia < 2)
                                _paisTextController.text = newText;
                            });
                          }
                        },
                      ),
                      sizedBoxSpace,
                      FormTextField(
                        controller: _regiaoController,
                        hintText: "Região de produção",
                        errorText: "Por favor preencha a região",
                      ),
                      sizedBoxSpace,
                      FormTextField(
                        controller: _tipoController,
                        hintText: "Tipo",
                        errorText: "Por favor preencha o tipo",
                      ),
                      sizedBoxSpace,
                      FormTextField(
                        controller: _safraController,
                        hintText: "Safra",
                        keyboardType: TextInputType.number,
                      ),
                      sizedBoxSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width/2 - 22.5,
                            child: FormTextField(
                              controller: _notaWSController,
                              hintText: "Nota W.S.",
                              keyboardType: TextInputType.number,
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width/2 - 22.5,
                            child: FormTextField(
                              controller: _notaRPController,
                              hintText: "Nota R.P.",
                              keyboardType: TextInputType.number,
                            ),
                          ),
                        ],
                      ),
                      sizedBoxSpace,
                      FormTextField(
                        controller: _beberRPController,
                        hintText: "Beber R.P.",
                        keyboardType: TextInputType.number,
                      ),
                      sizedBoxSpace,
                      FormTextField(
                        controller: _quantidadeController,
                        hintText: "Quantidade",
                        keyboardType: TextInputType.number,
                      ),
                      sizedBoxSpace,
                      FormTextField(
                        controller: _etiquetaController,
                        hintText: "Etiqueta(s)",
                      ),
                      sizedBoxSpace,
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    RaisedButton(
                        color: Theme.of(context).errorColor,
                        child: Container(
                          width: 110,
                          child: Center(
                            child: Text("Cancelar", style: TextStyle(color: Colors.white)),
                          ),
                        ),
                        onPressed: (){
                          Navigator.of(context).pop();
                        }
                    ),
                    RaisedButton(
                        color: Theme.of(context).accentColor,
                        child: Container(
                          width: 110,
                          child: Center(
                            child: Text("Salvar", style: TextStyle(color: Colors.white)),
                          ),
                        ),
                        onPressed: (){
                          if (_formKey.currentState.validate()) {
                            if(vinho == null){
                              widget.onAdd(Vinho(
                                nome: _nomeController.text,
                                pais: _paisTextController.text,
                                regiao: _regiaoController.text,
                                tipo: _tipoController.text,
                                safra: _safraController.text == "" ? -1 : int.parse(_safraController.text),
                                notaRP: int.parse(_notaRPController.text),
                                notaWS: int.parse(_notaWSController.text),
                                beberRP: _beberRPController.text,
                                quantidade: int.parse(_quantidadeController.text),
                                etiqueta: _etiquetaController.text,
                              ));
                            }else{
                              widget.onEddit(Vinho(
                                id: vinho.id,
                                nome: _nomeController.text,
                                pais: _paisTextController.text,
                                regiao: _regiaoController.text,
                                tipo: _tipoController.text,
                                safra: _safraController.text == "" ? -1 : int.parse(_safraController.text),
                                notaRP: int.parse(_notaRPController.text),
                                notaWS: int.parse(_notaWSController.text),
                                beberRP: _beberRPController.text,
                                quantidade: int.parse(_quantidadeController.text),
                                etiqueta: _etiquetaController.text,
                                favorito: vinho.favorito,
                              ));
                              Navigator.of(context).pop();
                            }
                          }
                        }
                    ),
                  ],
                )
              ],
            ),
          ),
        )
    );
  }
}
