import 'package:ax_flutter_demo/routes/gradual_change_route.dart';
import 'package:ax_flutter_demo/routes/rotateandzoom_route.dart';
import 'package:ax_flutter_demo/routes/sliding_around_route.dart';
import 'package:ax_flutter_demo/routes/zoom_route.dart';
import 'package:flutter/material.dart';

import '57_custom_route_second_page.dart';

class P57CustomRoute extends StatelessWidget {
  final TextStyle styles = TextStyle(fontSize: 20, color: Colors.white);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text(
          'Firstpage',
          style: TextStyle(fontSize: 36.0),
        ),
        elevation: 4,
      ),
      body: Center(
          child: Column(
        children: <Widget>[
          MaterialButton(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "渐变",
                  style: styles,
                ),
                Icon(
                  Icons.navigate_next,
                  color: Colors.white,
                  size: 64.0,
                ),
              ],
            ),
            onPressed: () {
              Navigator.of(context).push(GradualChangeRoute(P57CustomRouteSecondPage()));
            },
          ),
          MaterialButton(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "缩放",
                  style: styles,
                ),
                Icon(
                  Icons.navigate_next,
                  color: Colors.white,
                  size: 64.0,
                ),
              ],
            ),
            onPressed: () {
              Navigator.of(context).push(ZoomRoute(P57CustomRouteSecondPage()));
            },
          ),
          MaterialButton(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "缩放并旋转",
                  style: styles,
                ),
                Icon(
                  Icons.navigate_next,
                  color: Colors.white,
                  size: 64.0,
                ),
              ],
            ),
            onPressed: () {
              Navigator.of(context).push(RotateAndZoomRoute(P57CustomRouteSecondPage()));
            },
          ),
          MaterialButton(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "左右滑动",
                  style: styles,
                ),
                Icon(
                  Icons.navigate_next,
                  color: Colors.white,
                  size: 64.0,
                ),
              ],
            ),
            onPressed: () {
              Navigator.of(context).push(SlidingAroundRoute(P57CustomRouteSecondPage()));
            },
          ),
        ],
      )),
    );
  }
}
