import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class P32TestAnimation extends StatefulWidget {
  _P32TestAnimationState createState() => _P32TestAnimationState();
}

class _P32TestAnimationState extends State<P32TestAnimation> with TickerProviderStateMixin {
  Animation<double>? animation;
  AnimationController? controller;

  initState() {
    super.initState();
    controller = AnimationController(duration: const Duration(milliseconds: 2000), vsync: this);
    final CurvedAnimation curve = CurvedAnimation(parent: controller!, curve: Curves.easeIn);
    animation = Tween(begin: 0.0, end: 300.0).animate(curve);
    controller?.forward();
  }

  Widget build(BuildContext context) {
    return GrowTransition(child: LogoWidget(), animation: animation!);
  }

  dispose() {
    controller?.dispose();
    super.dispose();
  }
}

class GrowTransition extends StatelessWidget {
  GrowTransition({
    required this.child,
    required this.animation,
  });

  final Widget child;
  final Animation<double> animation;

  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
          animation: animation,
          builder: (BuildContext context, Widget? child) {
            return Container(height: animation.value, width: animation.value, child: child);
          },
          child: child),
    );
  }
}

class LogoWidget extends StatelessWidget {
  // Leave out the height and width so it fills the animating parent
  build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: FlutterLogo(),
    );
  }
}
