import 'package:flutter/material.dart';
import './views/list.dart';
void main() {
  runApp(
    MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xFF942641),
        errorColor: Color(0xFFf88a29),
        accentColor: Color(0xFF7fbb4a),
        fontFamily: 'Roboto',
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: Main_list(),
    )
  );
}
