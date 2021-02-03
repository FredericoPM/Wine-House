import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
class InfoField extends StatelessWidget {
  String label;
  String info;
  InfoField({Key key, this.label, this.info}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
              fontSize: 15,
              color: Colors.grey[600]
          ),
        ),
        AutoSizeText(
          info,
          style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold
          ),
          maxLines: 1,
        ),
      ],
    );
  }
}