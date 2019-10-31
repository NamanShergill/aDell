import 'package:flutter/material.dart';

class Bote extends StatefulWidget {
  @override
  _BoteState createState() => _BoteState();
}

class _BoteState extends State<Bote> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ADell'),
      ),
      body: Center(
        child: Text('Hellu'),
      ),
    );
  }
}