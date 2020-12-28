import 'package:flutter/material.dart';
import '../models/vinho.dart';
class ListCard extends StatelessWidget {
  final Vinho vinho;
  void Function() onFavorite;
  ListCard({this.vinho, this.onFavorite});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: ListTile(
        contentPadding: EdgeInsets.fromLTRB(10, 5, 10, 5),
        onTap: (){},
        leading: CircleAvatar(
          backgroundColor: Theme.of(context).primaryColor,
          child: FittedBox(
            child: Icon(
              Icons.place_outlined,
              color: Colors.white,
            ),
          )
        ),
        title: vinho.nome.length * 16 < MediaQuery.of(context).size.width
        ? Text(
            vinho.nome, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)
        ): FittedBox(
              child: Text(vinho.nome, style: TextStyle(fontWeight: FontWeight.bold))
        ),
        subtitle: Text(vinho.tipo),
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
