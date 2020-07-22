import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MaterialPage0 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<MaterialPage0> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("按钮组件"),
      ),
    );
  }
}
