import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import '../models/vinho.dart';
import '../controls/paises.dart';
class ListCard extends StatelessWidget {
  int index = 0;
  PaisesController paisesController = PaisesController();
  final Vinho vinho;
  void Function() onFavorite;
  void Function(BuildContext context) onTap;
  ListCard({this.vinho, this.onFavorite, this.onTap});


  @override
  Widget build(BuildContext context) {

    return Card(
      elevation: 4,
      child: ListTile(
        contentPadding: EdgeInsets.fromLTRB(10, 5, 10, 5),
        onTap: () => onTap(context),
        leading: paisesController.imageExist(vinho)
          ? Stack(
          alignment: Alignment.center,
            children: [
              CircleAvatar(
                backgroundColor: Theme.of(context).primaryColor,
              ),
              Container(
                height:35,
                child: Image.asset(
                  paisesController.imagePath(vinho),
                  fit: BoxFit.cover,
                ),
              )
            ],
          ) : CircleAvatar(
            backgroundColor: Theme.of(context).primaryColor,
            child: FittedBox(
              child: Icon(
                Icons.place_outlined,
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
    );
  }
}
