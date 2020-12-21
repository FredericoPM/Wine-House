import 'package:flutter/material.dart';
import '../models/vinho.dart';
class ListCard extends StatelessWidget {
  final Vinho vinho;
  void Function() onFavorite;
  ListCard({this.vinho, this.onFavorite});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: (){},
        child: Padding(
          padding: EdgeInsets.fromLTRB(10, 5, 0, 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.wine_bar_outlined,
                    size: 45,
                    color: Color(0xFF942641),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(vinho.nome, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                      SizedBox(
                        height: 3,
                      ),
                      Text(vinho.tipo, style: TextStyle(color: Colors.grey, fontSize: 15)),
                    ],
                  ),
                ],
              ),
              IconButton(
                icon: Icon(
                  vinho.favorito ? Icons.favorite: Icons.favorite_outline,
                  size: 30,
                  color: Color(0xFF942641),
                ),
                onPressed: () => onFavorite(),
              )
            ],
          ),
        ),
      )
    );
  }
}
