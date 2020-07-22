import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MaterialPageI18n extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MaterialPage1();
  }
}

class _MaterialPage1 extends State<MaterialPageI18n> {
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
          ],
        ),
      ),
    );
  }
}
