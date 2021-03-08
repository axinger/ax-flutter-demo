import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class P15AnimationDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MaterialPage1();
  }
}

class _MaterialPage1 extends State<P15AnimationDemo>
    with TickerProviderStateMixin {
  AnimationController? _animationController;

  Animation? _animation;

  Animation? _animationColor;

  CurvedAnimation? _curvedAnimation;

  /// 曲线动画 忽大忽小的感觉那种

  @override
  void initState() {
    super.initState();

    /// 值只能是数,
    _animationController = AnimationController(
      duration: Duration(seconds: 3),

//      /// 初始值
//      value: 20,
//      ///最小范围
//      lowerBound: 20.0,
      ///最大 范围
//      upperBound: 100,

      /// 是否消耗其他资源
      vsync: this,
    );
    _animationController?.addListener(() {
//      print("_animationController = ${_animationController.value}");
      setState(() {});
    });

    _animationController?.addStatusListener((AnimationStatus status) {
      print("_animationController.status = ${status}");
//      setState(() {
//
//      });
    });

    /// 曲线动画
    _curvedAnimation = CurvedAnimation(
      parent: _animationController!,
      curve: Curves.bounceOut,
    );

    /*   /// 值可以任何值,比如颜色 ,放入 _animationController
    _animation = Tween<double>(
      begin: 20,
      end: 100,
    ).animate(_animationController);

    _animationColor = ColorTween(
      begin: Colors.red[50],
//      end: Colors.red[900],
      end: Colors.red[900],
    ).animate(_animationController);*/

    /// 值可以任何值,比如颜色 ,放入_curvedAnimation
    _animation = Tween<double>(
      begin: 20,
      end: 100,
    ).animate(_curvedAnimation!);

    _animationColor = ColorTween(
      begin: Colors.red[50],
//      end: Colors.red[900],
      end: Colors.red[900],
    ).animate(_curvedAnimation!);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _animationController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("动画"),
      ),
      body: ListView(
        children: [
          AnimationHeader(
            animatedList: [
              _animation!,
              _animationColor!,
            ],
            animationController: _animationController!,
          ),
          Divider(
            color: Colors.red,
          ),
          AnimationDemo(),
        ],
      ),
    );
  }
}

class AnimationHeader extends AnimatedWidget {
  final List<Animation> animatedList;
  final AnimationController animationController;

  AnimationHeader({required this.animatedList,required this.animationController})
      : super(listenable: animationController);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      // icon: Icon(Icons.favorite),
      icon: Text('点击大小,颜色变换动画'),
      iconSize: animatedList[0].value,
      color: animatedList[1].value,
      onPressed: () {
        /// 向前运行
//            _animationController.forward();
        /// 重复
//            _animationController.repeat();

        switch (animationController.status) {
          case AnimationStatus.completed:

            ///reverse 相反
            animationController.reverse();
            break;

          default:
            animationController.forward();
            break;
        }
      },
    );
  }
}

class AnimationDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AnimationDemo();
}

class _AnimationDemo extends State<AnimationDemo>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  Animation<Color?>? _animation;

  @override
  void initState() {
    _animationController =
        AnimationController(duration: Duration(seconds: 2), vsync: this);

    _animation = ColorTween(begin: Colors.red, end: Colors.blue)
        .animate(_animationController!);

    _animationController?.addListener(() {
      if (_animationController!.isCompleted) {
        print('动画完成');
        _animationController!.animateBack(0.0);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FlatButton(
            onPressed: () {
              //开始动画
              _animationController?.forward();
            },
            child: Text('点击变换颜色')),
        Container(
          height: 100,
          width: 100,

          /// 继承 AnimatedWidget
          child: AnimatedModalBarrier(
            color: _animation!,
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }
}
