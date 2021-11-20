//思路：
import 'package:ax_flutter_demo/config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/**
 * 1 创建animationlogo的widget类 实现其构造函数和build方法（用于指明动画样式和具体动作）
 * 2 创建state类 其中initstate函数中通过实例化controller对象和animation类对象指明animation的动画
 * 3 在state的build函数中返回实例的animationlogo对象
 */
class P31TestAnimation extends StatefulWidget {
  @override
  _TestAnimationState createState() {
    return _TestAnimationState();
  }
}

class _TestAnimationState extends State<P31TestAnimation> with SingleTickerProviderStateMixin {
  //实例animation对象  和必要的控制和状态对象
  Animation<double>? animation;
  AnimationController? controller;
  AnimationStatus? animationStatus;

  @override
  void initState() {
    super.initState();
    //初始化一个动画控制器 定义好动画的执行时长
    controller = AnimationController(duration: const Duration(seconds: 3), vsync: this);
    //初始化一个补间动画 实例化一个补间类动画的实例，明确需要变换的区间大小和作用的controller对象
    animation = Tween<double>(begin: 0, end: 300).animate(controller!);
    //提供方法 为动画添加监听
    controller?.forward();
  }

  //重写生命周期的dispose函数  将controller资源回收
  @override
  void dispose() {
    //回收资源
    controller?.dispose();
    super.dispose();
  }

  //build方法  返回页面的布局widget
  @override
  Widget build(BuildContext context) {
    return AnimationLogo(
      animation: animation!,
    );
  }
}

//创建一个动画类继承自animatedwidget（其中可以通过构造函数传入必要的动画）
class AnimationLogo extends AnimatedWidget {
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    // final Animation<double> animation = this.listenable;

    return Center(
      child: Container(
        margin: new EdgeInsets.symmetric(vertical: 10),
        height: animation.value,
        width: animation.value,
        child: Image.asset(assetsOfImagePath('A171.jpg')),
      ),
    );
  }

  AnimationLogo({
    Key? key,
    required this.animation,
  }) : super(key: key, listenable: animation);
}
