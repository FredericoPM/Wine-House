import 'package:flutter/material.dart';
import '../widgets/textField.dart';
class WineForm extends StatefulWidget {
  @override
  _WineFormState createState() => _WineFormState();
}

class _WineFormState extends State<WineForm> {
  TextEditingController _nomeController = TextEditingController();
  TextEditingController _anoController = TextEditingController();
  TextEditingController _paisController = TextEditingController();
  TextEditingController _tipoController = TextEditingController();
  TextEditingController _teorController = TextEditingController();
  List<Widget> campos = [];
  @override
  Widget build(BuildContext context) {
    campos.addAll([
      TextFild(
        controller: _nomeController,
        hintText: "Nome",
        errorText: "Por favor preencha o nome",
        icon: Icon(Icons.wine_bar_outlined, color: Colors.grey[700]),
      ),
      TextFild(
        controller: _tipoController,
        hintText: "Tipo",
        errorText: "Por favor preencha o tipo",
        icon: Icon(Icons.wine_bar, color: Colors.grey[700]),
      ),
      TextFild(
        controller: _anoController,
        hintText: "Idade",
        errorText: "Por favor preencha a idade",
        icon: Icon(Icons.date_range_outlined, color: Colors.grey[700]),
      ),
      TextFild(
        controller: _paisController,
        hintText: "Pais de origem",
        errorText: "Por favor preencha pais de origem",
        icon: Icon(Icons.place_outlined, color: Colors.grey[700]),
      ),
      /*
      TextFild(
          controller: _teorController,
          hintText: "Teor alcolico",
          errorText: "Por favor preencha o teor alcolico",
          icon: CircleAvatar(
            backgroundColor: Colors.transparent,
            child: Text("%", style: TextStyle(color: Colors.grey[700], fontSize: 25),),
          )
      ),
       */
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          RaisedButton(
              color: Color(0xFFf88a29),
              child: Container(
                width: 100,
                child: Center(
                  child: Text("Cancelar", style: TextStyle(color: Colors.white)),
                ),
              ),
              onPressed: (){}
          ),
          RaisedButton(
              color: Color(0xFF7fbb4a),
              child: Container(
                width: 100,
                child: Center(
                  child: Text("Salvar", style: TextStyle(color: Colors.white)),
                ),
              ),
              onPressed: (){}
          ),
        ],
      )
    ]);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Container(
        height: 450,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Novo vinho",
              style: TextStyle(
                color: Color(0xFF942641),
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: campos.length,
                    itemBuilder: (ctx, index) {
                      return Column(
                        children: [
                          campos[index],
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      );
                    }
                ),
            )
          ],
        ),
      )
    );
  }
}
