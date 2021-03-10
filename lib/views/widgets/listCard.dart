import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import '../../models/vinho.dart';
import '../../controllers/paises.dart';
import 'flagDisplay.dart';
class ListCard extends StatelessWidget {
  final Vinho vinho;
  void Function(bool selected) onLongPress;
  void Function(BuildContext context, bool selected) onTap;
  bool selected;
  ListCard({this.vinho, this.onTap, this.onLongPress, this.selected});
  int index = 0;
  PaisesController paisesController = PaisesController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress:() => onLongPress(selected),
      child: Card(
          elevation: 4,
          color: selected ? Color(0xFFe2fec9) : Colors.white,
          child: ListTile(
            contentPadding: EdgeInsets.fromLTRB(10, 5, 10, 5),
            onTap: () => onTap(context, selected),
            leading: selected 
            ? CircleAvatar(
              backgroundColor: selected ? Theme.of(context).accentColor : Theme.of(context).primaryColor,
              child: FittedBox(
                child: Icon(
                  Icons.check,
                  color: Colors.white,
                ),
              )
            )
            : FlagDisplay(
              imagePath: paisesController.imageExist(vinho) ? paisesController.iconPath(vinho) : null,
            ),
            title: AutoSizeText(
              vinho.nome, style:
              TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              maxLines: 1,
            ),
            subtitle: AutoSizeText("${vinho.regiao != "" ? "${vinho.regiao} | " : ""}${vinho.tipo} | ${vinho.safra}", maxLines: 1,),
          )
      ),
    );
  }
}

