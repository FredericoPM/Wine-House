import 'package:flutter/material.dart';
class InfoRow extends StatelessWidget {
  List<Widget> informations;
  var _size = 5.0;
  InfoRow({this.informations}){
    if(informations.length > 2)
      informations = informations.sublist(0,2);
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
      child: LayoutBuilder(
        builder: (ctx, constraints){
          return Row(
            children: [
              Container(
                width: (constraints.maxWidth*9)/20,
                child: informations[0]
              ),

              if(informations.length > 1)
                SizedBox(width: (constraints.maxWidth*2)/20, height: 1,),

              if(informations.length > 1)
                Container(
                  width:(constraints.maxWidth*9)/20,
                  child: informations[1]
                ),
            ],
          );
        },
      )
    );
  }
}