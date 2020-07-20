import 'package:flutter/material.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold (
      body: Stack(
        children: <Widget>[
          Container (
            height: double.infinity,
            width: double.infinity,
            color: Colors.black45,
          ),
        ],
      ),
    );
  }
}