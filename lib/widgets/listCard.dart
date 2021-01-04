import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import '../models/vinho.dart';
import '../controls/paises.dart';
class ListCard extends StatelessWidget {
  final Vinho vinho;
  void Function() onFavorite;
  void Function(bool selected) onLongPress;
  void Function(BuildContext context, bool selected) onTap;
  bool selected;
  ListCard({this.vinho, this.onFavorite, this.onTap, this.onLongPress, this.selected});
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
            leading: paisesController.imageExist(vinho)
                ? Stack(
              alignment: Alignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: selected ? Theme.of(context).accentColor : Theme.of(context).primaryColor,
                ),
                selected
                ? Icon(
                  Icons.check,
                  color: Colors.white,
                )
                : Container(
                  height:35,
                  child: Image.asset(
                    paisesController.imagePath(vinho),
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ) : CircleAvatar(
                backgroundColor: selected ? Theme.of(context).accentColor : Theme.of(context).primaryColor,
                child: FittedBox(
                  child: Icon(
                    selected ?Icons.check: Icons.place_outlined,
                    color: Colors.white,
                  ),
                )
            ),
            title: AutoSizeText(
              vinho.nome, style:
            TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              maxLines: 1,
            ),
            subtitle: AutoSizeText("${vinho.pais} | ${vinho.tipo}", maxLines: 1,),
            trailing: IconButton(
              icon: Icon(
                vinho.favorito ? Icons.favorite: Icons.favorite_outline,
                size: 30,
                color: Color(0xFFf88a29),
              ),
              onPressed: () => onFavorite(),
            ),
          )
      ),
    );
  }
}

