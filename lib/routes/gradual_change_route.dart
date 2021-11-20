import 'package:flutter/material.dart';

/**
 *
 *  创建人:xuqing
 *  创建时间：2020年10月5日19:06:43
 *  类说明：自定义路由动画效果 渐隐渐变效果
 *
 *
 */

class GradualChangeRoute extends PageRouteBuilder {
  final Widget widget;

  GradualChangeRoute(this.widget)
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
              //渐隐渐变效果
              return FadeTransition(
                opacity: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(parent: animation1, curve: Curves.fastOutSlowIn)),
                child: child,
              );
            });
}
