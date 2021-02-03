import 'package:flutter/material.dart';
class TrasparentIconButton extends StatelessWidget {
  var icon;
  var color;
  void Function() onPressed;
  TrasparentIconButton({Key key, this.icon, this.onPressed, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    color = color == null ? color = Theme.of(context).primaryColor : color;
    return Stack(
      alignment: Alignment.center,
      children: [
        Opacity(
          opacity: 0.7,
          child: CircleAvatar(
            backgroundColor: Colors.white,
          ),
        ),
        IconButton(
            icon: Icon(icon, color: color, size: 30,),
            onPressed: onPressed,
        ),
      ],
    );
  }
}