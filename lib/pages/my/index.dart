import 'package:flutter/material.dart';

class My extends StatefulWidget {

  @override
  _MYState createState() => new _MYState();
}

class _MYState extends State<My> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('MY'),
      ),
      body: new Text(
        'My name is MY'
      ),
    );
  }
}