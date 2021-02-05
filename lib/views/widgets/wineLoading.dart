import 'package:flutter/material.dart';
class WineLoading extends StatelessWidget {
  String text;
  WineLoading({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.6,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/gifs/loading.gif",
            width: 125.0,
          ),
          SizedBox(height: 30),
          Text(
            text,
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}