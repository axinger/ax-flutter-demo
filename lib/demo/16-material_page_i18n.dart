import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MaterialPageI18n extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MaterialPage1();
  }
}

class _MaterialPage1 extends State<MaterialPageI18n> {
  String _name = '-1';
  String _name2 = '-1';
  @override
  Widget build(BuildContext context) {
    Locale _locale = Localizations.localeOf(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("国际化,多语言"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text(_locale.toString()),
            FlatButton(
              child: Icon(
                Icons.add,
                color: Colors.red,
              ),
              onPressed: () {
                setState(() {
                  _name = Random().nextInt(100).toString();
                  _name2 = Random().nextInt(100).toString();
                });
              },
            ),
            TextDemo(
              name: _name,
              name2: _name2,
            ),
          ],
        ),
      ),
    );
  }
}

class TextDemo extends StatefulWidget {
  final String name;
  final String name2;
  TextDemo({this.name, this.name2});

  @override
  _TextDemoState createState() => _TextDemoState();
}

class _TextDemoState extends State<TextDemo> {
  String _name;
  String _name2;
  @override
  void initState() {
    super.initState();
    _name = widget.name;
  }

  @override
  Widget build(BuildContext context) {
    _name2 = widget.name2;
    return Column(
      children: [
        Text(widget.name),
        Text(_name),
        Text(_name2),
      ],
    );
  }
}
