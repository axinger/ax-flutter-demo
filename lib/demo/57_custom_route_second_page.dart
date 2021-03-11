import 'package:flutter/material.dart';

class P57CustomRouteSecondPage extends StatelessWidget {
  P57CustomRouteSecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.pinkAccent,
      appBar: AppBar(
        title: Text(
          "Sencondpage",
          style: TextStyle(fontSize: 36.0),
        ),
        elevation: 4,
      ),
      body: Center(
        child: MaterialButton(
          child: Icon(
            Icons.navigate_before,
            color: Colors.white,
            size: 64.0,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }
}
