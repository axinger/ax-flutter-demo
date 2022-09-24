//
//  47_route_widget
//
//  ax_flutter_demo
//
//  Created by axinger on 2020/8/27 11:53 下午 .
//  Copyright ©2020/8/27 ax_flutter_demo. All rights reserved.
//
import 'package:flutter/material.dart';

class P47RouteWidget extends StatefulWidget {
  final Map? map;

  P47RouteWidget({
    this.map,
  });

  @override
  _P47RouteWidgetState createState() => _P47RouteWidgetState();
}

class _P47RouteWidgetState extends State<P47RouteWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: TextButton(
          child: Text('下一页'),
          onPressed: () {
//            FlutterBoost.singleton.open('P47RouteWidget2',
//                urlParams: <String, dynamic>{
//                  'present': true
//                }).then((Map<dynamic, dynamic> value) {
//              print(
//                  'FlutterBoost =  $value');
//            });
          },
        ),
      ),
    );
  }
}

class P47RouteWidget2 extends StatefulWidget {
  @override
  _P47RouteWidget2State createState() => _P47RouteWidget2State();
}

class _P47RouteWidget2State extends State<P47RouteWidget2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: TextButton(
          child: Text('返回上上一个'),
          onPressed: () {
//            FlutterBoost.singleton.close('P00ShowTestPage');
          },
        ),
      ),
    );
  }
}
