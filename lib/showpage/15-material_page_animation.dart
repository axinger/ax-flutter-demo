import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MaterialPageAnimation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MaterialPage1();
  }
}

class _MaterialPage1 extends State<MaterialPageAnimation>
    with TickerProviderStateMixin {
  AnimationController _animationController;

  Animation _animation;

  Animation _animationColor;

  CurvedAnimation _curvedAnimation;

  /// 曲线动画 忽大忽小的感觉那种

  @override
  void initState() {
    // TODO: implement initState
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
    _animationController.addListener(() {
//      print("_animationController = ${_animationController.value}");
      setState(() {});
    });

    _animationController.addStatusListener((AnimationStatus status) {
      print("_animationController.status = ${status}");
//      setState(() {
//
//      });
    });

    /// 曲线动画
    _curvedAnimation = CurvedAnimation(
      parent: _animationController,
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
    ).animate(_curvedAnimation);

    _animationColor = ColorTween(
      begin: Colors.red[50],
//      end: Colors.red[900],
      end: Colors.red[900],
    ).animate(_curvedAnimation);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("动画"),
      ),
//      body: Center(
//        child: FlatButton(
//          child: Text(_animationController.value.toString()),
//          onPressed: (){
//            _animationController.forward();
//          },
//        ),
//      ),
/*

      body: Center(
        child: IconButton(
          icon: Icon(Icons.favorite),
          iconSize: _animationController.value,
          onPressed: (){
            /// 向前运行
//            _animationController.forward();
          /// 重复
//            _animationController.repeat();

          switch(_animationController.status){
            case AnimationStatus.completed:
              ///reverse 相反
              _animationController.reverse();
              break;

            default:
              _animationController.forward();
              break;
          }
          },
        ),
      ),
*/

      /*     body: Center(
        child: IconButton(
          icon: Icon(Icons.favorite),
          iconSize: _animation.value,
          onPressed: (){
            /// 向前运行
//            _animationController.forward();
            /// 重复
//            _animationController.repeat();

            switch(_animationController.status){
              case AnimationStatus.completed:
              ///reverse 相反
                _animationController.reverse();
                break;

              default:
                _animationController.forward();
                break;
            }
          },
        ),
      ),*/

      /*    body: Center(
        child: IconButton(
          icon: Icon(Icons.favorite),
          iconSize: _animation.value,
          color: _animationColor.value,
          onPressed: () {
            /// 向前运行
//            _animationController.forward();
            /// 重复
//            _animationController.repeat();

            switch (_animationController.status) {
              case AnimationStatus.completed:

                ///reverse 相反
                _animationController.reverse();
                break;

              default:
                _animationController.forward();
                break;
            }
          },
        ),
      ),*/
      body: Center(
        child: AnimationHeader(
          animatedList: [
            _animation,
            _animationColor,
          ],
          animationController: _animationController,
        ),
      ),
    );
  }
}

class AnimationHeader extends AnimatedWidget {
  final List<Animation> animatedList;
  final AnimationController animationController;

  AnimationHeader({this.animatedList, this.animationController})
      : super(listenable: animationController);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.favorite),
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
