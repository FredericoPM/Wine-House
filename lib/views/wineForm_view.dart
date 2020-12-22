import 'package:flutter/material.dart';
import '../widgets/textField.dart';
import '../models/vinho.dart';
class WineForm extends StatefulWidget {
  void Function(Vinho v) onAdd;
  WineForm({this.onAdd});
  @override
  _WineFormState createState() => _WineFormState(onAdd);
}

class _WineFormState extends State<WineForm> {

  final _formKey = GlobalKey<FormState>();
  TextEditingController _nomeController = TextEditingController();
  TextEditingController _paisController = TextEditingController();
  TextEditingController _tipoController = TextEditingController();
  TextEditingController _idadeController = TextEditingController();
  TextEditingController _localizacaoController = TextEditingController();

  void Function(Vinho v) onAdd;

  final sizedBoxSpace = SizedBox(height: 12);

  _WineFormState(this.onAdd);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
              Icons.keyboard_backspace,
              color: Color(0xFF942641),
              size: 30,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          "Novo vinho",
          style: TextStyle(
            color: Color(0xFF942641),
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
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
                    controller: _idadeController,
                    hintText: "Idade",
                    errorText: "Por favor preencha a idade",
                    icon: Icon(Icons.date_range_outlined, color: Colors.grey[700]),
                    keyboardType: TextInputType.number,
                  ),
                  sizedBoxSpace,
                  TextFild(
                    controller: _paisController,
                    hintText: "Pais de origem",
                    errorText: "Por favor preencha pais de origem",
                    icon: Icon(Icons.place_outlined, color: Colors.grey[700]),
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
                    color: Color(0xFFf88a29),
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
                    color: Color(0xFF7fbb4a),
                    child: Container(
                      width: 110,
                      child: Center(
                        child: Text("Salvar", style: TextStyle(color: Colors.white)),
                      ),
                    ),
                    onPressed: (){
                      if (_formKey.currentState.validate()) {
                        onAdd(Vinho(
                          nome: _nomeController.text,
                          tipo: _tipoController.text,
                          idade: int.parse(_idadeController.text),
                          pais: _paisController.text,
                        ));
                        Navigator.of(context).pop();
                      }
                    }
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
