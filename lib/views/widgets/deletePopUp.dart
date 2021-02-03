import 'package:flutter/material.dart';

class DeletePopUp extends StatelessWidget {
  void Function() onDelete;
  DeletePopUp({this.onDelete});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Deseja mesmo excluir este(s) vinho(s)?",),
      actions: [
        Container(
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 130,
                child: FlatButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text("Cancelar", style: TextStyle(color: Theme.of(context).accentColor, fontWeight: FontWeight.bold),),
                ),
              ),
              Container(
                width: 130,
                child: FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    onDelete();
                  },
                  child: Text("Excluir", style: TextStyle(color: Theme.of(context).errorColor, fontWeight: FontWeight.bold),),
                ),
              ),
            ],
          )
        )
      ],
    );
  }
}
