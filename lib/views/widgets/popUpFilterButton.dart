import 'package:flutter/material.dart';
import '../../controllers/list.dart';
class PopUpFilterButton extends StatefulWidget {
  PopUpFilterButton({Key key}) : super(key: key);
  ListController controller;
  void Function(String value) onSelected;
  @override
  _PopUpFilterButtonState createState() => _PopUpFilterButtonState();
}

class _PopUpFilterButtonState extends State<PopUpFilterButton> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      icon: Icon(
        Icons.filter_alt_outlined,
        size: 27,
        color: Theme.of(context).primaryColor,
      ),
      padding: EdgeInsets.zero,
      onSelected: (value) => widget.onSelected(value)
      // (value) {
      //   if(value == "fv"){
      //     widget.controller.invertFavoritePriority();
      //   }else{
      //     widget.controller.order = value;
      //   }
      //   widget.controller.sort();
      //   setState(() {vinhos = widget.controller.vinhos;});
      // }
      ,
      itemBuilder: (context) => <PopupMenuEntry<String>>[
        PopupMenuItem<String>(
          enabled: false,
          child: Text(
            "Ordenar por:",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        PopupMenuItem<String>(
          value: "nm",
          child: ListTile(
            leading: Icon(Icons.wine_bar_outlined, color: widget.controller.order == "nm" ? Theme.of(context).accentColor : Colors.grey[700]),
            title: Text(
              "Nome",
              style: TextStyle(fontWeight: widget.controller.order == "nm" ? FontWeight.bold : null),
            ),
          ),
        ),
        PopupMenuItem<String>(
          value: "tp",
          child: ListTile(
            leading: Icon(Icons.wine_bar, color: widget.controller.order == "tp" ? Theme.of(context).accentColor : Colors.grey[700]),
            title: Text(
              "Tipo",
              style: TextStyle(fontWeight: widget.controller.order == "tp" ? FontWeight.bold : null),
            ),
          ),
        ),
        PopupMenuItem<String>(
          value: "pa",
          child: ListTile(
            leading: Icon(Icons.place_outlined, color: widget.controller.order == "pa" ? Theme.of(context).accentColor : Colors.grey[700]),
            title: Text(
              "Pais",
              style: TextStyle(fontWeight: widget.controller.order == "pa" ? FontWeight.bold : null),
            ),
          ),
        ),
        const PopupMenuDivider(),
        PopupMenuItem<String>(
          value: "fv",
          child: ListTile(
            leading: Icon(Icons.favorite, color: widget.controller.favoritePriority ? Theme.of(context).accentColor : Colors.grey[700]),
            title: Text(
              "Favoritos",
              style: TextStyle(fontWeight: widget.controller.favoritePriority ? FontWeight.bold : null),
            ),
          ),
        ),
      ],
    );
  }
}