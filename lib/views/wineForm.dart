import 'package:flutter/material.dart';
import 'widgets/autoCompleteField.dart';
import 'widgets/formTextField.dart';
import '../models/vinho.dart';
import '../controllers/paises.dart';
import '../controllers/csv.dart';

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
  Csv csvController = Csv();


  final sizedBoxSpace = SizedBox(height: 16);
  Vinho vinho;
  _WineFormState(this.vinho){
    if(vinho != null){
      _nomeController.text = vinho.nome;
      _paisTextController.text = vinho.pais;
      _regiaoController.text = vinho.regiao;
      _tipoController.text = vinho.tipo;
      _safraController.text = vinho.safra.toString();
      _notaRPController.text = vinho.notaRP;
      _notaWSController.text = vinho.notaWS;
      _beberRPController.text = vinho.beberRP;
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
          actions: [
            IconButton(
              icon: Icon(
                Icons.upload_sharp,
                color: Theme.of(context).primaryColor,
                size: 30,
              ),
              onPressed: (){
              },
            ),
          ],
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
                        labelText: "Nome",
                        errorText: "* Por favor informe o nome",
                      ),
                      sizedBoxSpace,
                      AutoCompleteField(
                        controller: _paisTextController,
                        suggestions: (pattern) => paisController.getSuggestions(pattern),
                        errorText: "* Por favor informe o pais",
                      ),
                      sizedBoxSpace,
                      FormTextField(
                        controller: _regiaoController,
                        labelText: "Região de produção",
                        errorText: "* Por favor informe a região",
                      ),
                      sizedBoxSpace,
                      FormTextField(
                        controller: _tipoController,
                        labelText: "Tipo",
                        errorText: "* Por favor informe o tipo",
                      ),
                      sizedBoxSpace,
                      FormTextField(
                        controller: _safraController,
                        labelText: "Safra",
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
                              labelText: "Nota W.S.",
                              keyboardType: TextInputType.number,
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width/2 - 22.5,
                            child: FormTextField(
                              controller: _notaRPController,
                              labelText: "Nota R.P.",
                              keyboardType: TextInputType.number,
                            ),
                          ),
                        ],
                      ),
                      sizedBoxSpace,
                      FormTextField(
                        controller: _beberRPController,
                        labelText: "Beber R.P.",
                        keyboardType: TextInputType.number,
                      ),
                      sizedBoxSpace,
                      FormTextField(
                        controller: _quantidadeController,
                        labelText: "Quantidade",
                        keyboardType: TextInputType.number,
                        errorText: "* Por favor informe a quantidade",
                      ),
                      sizedBoxSpace,
                      FormTextField(
                        controller: _etiquetaController,
                        labelText: "Etiqueta(s)",
                        errorText: "* Por favor informe a(s) etiqueta(s)",
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
                                notaRP: _notaRPController.text,
                                notaWS: _notaWSController.text,
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
                                safra: int.parse(_safraController.text),
                                notaRP: _notaRPController.text,
                                notaWS: _notaWSController.text,
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
