import 'package:flutter/material.dart';
import 'Screens/HomePage.dart';

void main() => runApp(XO());

class XO extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.orange),
      home: Homepage(),
    );
  }
}
