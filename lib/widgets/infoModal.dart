import 'package:flutter/material.dart';
import '../models/vinho.dart';
import '../controls/paises.dart';
class InfoModal extends StatelessWidget {
  Vinho vinho;
  PaisesController paisesController = PaisesController();
  InfoModal(this.vinho);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: Column(
        children: [
          ListTile(
            title: Text(vinho.nome),
            subtitle: Row(
              children: [
                Stack(
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
                ),
                Text("${vinho.pais} | ${vinho.tipo}"),
              ],
            ),
          ),
          const Divider(thickness: 1),
          Expanded(
            child: ListView.builder(
              itemCount: 21,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text("asdasd"),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}