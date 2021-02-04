import 'package:flutter/material.dart';
class FlagDisplay extends StatelessWidget {
  var imagePath;
  double radius;
  double _diameter;
  FlagDisplay({this.imagePath, this.radius = 20.0});
  @override
  Widget build(BuildContext context) {
    _diameter = 2 * radius;
    return Stack(
      alignment: Alignment.center,
      children: [
        CircleAvatar(
          // backgroundColor: Theme.of(context).primaryColor,
          backgroundColor: Color(0xff541625),
          radius: radius,
        ),
        imagePath == null 
        ? Icon(
          Icons.place_outlined,
          color: Colors.white,
          size: _diameter*0.8,
        )
        : Container(
          height: _diameter*0.9,
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
        )
      ],
    );
  }
}