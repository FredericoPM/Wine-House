import 'package:flutter/material.dart';
import '../widgets/textField.dart';
import '../models/vinho.dart';
import '../controls/paises.dart';
import '../controls/pesquisaAproximada.dart';

class WineForm extends StatefulWidget {
  void Function(Vinho v) onAdd;
  WineForm({this.onAdd});
  @override
  _WineFormState createState() => _WineFormState();
}

class _WineFormState extends State<WineForm> {

  PesquisaAproximada pesquisa = PesquisaAproximada();
  PaisesController paisController = PaisesController();
  final _formKey = GlobalKey<FormState>();
  TextEditingController _paisTextController = TextEditingController();
  TextEditingController _nomeController = TextEditingController();
  TextEditingController _tipoController = TextEditingController();
  TextEditingController _idadeController = TextEditingController();
  TextEditingController _localizacaoController = TextEditingController();


  final sizedBoxSpace = SizedBox(height: 12);
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
          "Novo vinho",
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFild(
                      controller: _nomeController,
                      hintText: "Nome",
                      errorText: "Por favor preencha o nome",
                      icon: Icon(Icons.wine_bar_outlined, color: Colors.grey[700]),
                    ),
                    sizedBoxSpace,
                    TextFild(
                      controller: _tipoController,
                      hintText: "Tipo",
                      errorText: "Por favor preencha o tipo",
                      icon: Icon(Icons.wine_bar, color: Colors.grey[700]),
                    ),
                    sizedBoxSpace,
                    TextFild(
                      controller: _paisTextController,
                      hintText: "Pais de origem",
                      errorText: "Por favor preencha o pais de origem",
                      icon: Icon(Icons.place_outlined, color: Colors.grey[700]),
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
                    TextFild(
                      controller: _idadeController,
                      hintText: "Idade",
                      errorText: "Por favor preencha a idade",
                      icon: Icon(Icons.date_range_outlined, color: Colors.grey[700]),
                      keyboardType: TextInputType.number,
                    ),
                    sizedBoxSpace,
                    TextFild(
                      controller: _localizacaoController,
                      hintText: "Localização",
                      errorText: "Por favor preencha a localização",
                      icon: Icon(Icons.grid_on, color: Colors.grey[700]),
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
                          widget.onAdd(Vinho(
                            nome: _nomeController.text,
                            tipo: _tipoController.text,
                            idade: int.parse(_idadeController.text),
                            pais: _paisTextController.text,
                          ));
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
