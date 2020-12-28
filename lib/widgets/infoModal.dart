import 'package:flutter/material.dart';
import '../models/vinho.dart';
class InfoModal extends StatelessWidget {
  Vinho vinho;
  InfoModal(this.vinho);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: Column(
        children: [
          Container(
            height: 70,
            padding: EdgeInsets.all(15),
            child: Row(
              children: [
                Column(
                  children: [
                    Text(vinho.nome),
                    Text("${vinho.pais} | ${vinho.tipo}"),
                  ],
                )
              ],
            )
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