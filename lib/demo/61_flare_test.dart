// import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class PFlareTestPage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<PFlareTestPage> {
  @override
  Widget build(BuildContext context) {
    //
    return Scaffold(
      appBar: AppBar(
        title: Text('动画'),
      ),
    body: Text(''),
    //   body: FlareActor("assets/flare/Filip.flr",
    //       alignment: Alignment.center, fit: BoxFit.contain, animation: "idle"),
    );
  }
}
