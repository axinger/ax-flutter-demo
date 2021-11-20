import 'package:flutter/material.dart';

/**
 *
 *  创建人:xuqing
 *  创建时间：2020年10月5日19:06:43
 *  类说明：自定义路由动画效果 旋转加缩放
 *
 *
 */

class RotateAndZoomRoute extends PageRouteBuilder {
  final Widget widget;

  RotateAndZoomRoute(this.widget)
      : super(
            transitionDuration: Duration(seconds: 2),
            pageBuilder: (
              BuildContext context,
              Animation<double> animation1,
              Animation<double> animation2,
            ) {
              return widget;
            },
            transitionsBuilder: (BuildContext context, Animation<double> animation1, Animation<double> animation2, Widget child) {
              //旋转加缩放
              return RotationTransition(
                turns: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(parent: animation1, curve: Curves.fastOutSlowIn)),
                child: ScaleTransition(
                  scale: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(parent: animation1, curve: Curves.fastOutSlowIn)),
                  child: child,
                ),
              );
            });
}
