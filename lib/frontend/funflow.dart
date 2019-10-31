import 'package:flutter/material.dart';

class Flowe extends StatefulWidget {
  @override
  _FloweState createState() => _FloweState();
}

class _FloweState extends State<Flowe> {
  Future<bool> _onBackPressed() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return  WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        body: Center(
          child: InkWell(child: Text('From the other side')),
        ),
      ),
    );
  }
}