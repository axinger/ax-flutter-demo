import 'package:flutter/material.dart';

class P45HeroDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HeroDemo();
}

class _HeroDemo extends State<P45HeroDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, crossAxisSpacing: 5, mainAxisSpacing: 3),
        children: List.generate(10, (index) {
          if (index == 6) {
            return InkWell(
              onTap: () {
//                Navigator.push(
//                  context,
//                  new MaterialPageRoute(
//                    builder: (context) => new _Hero1Demo(),
//                  ),
//                );

//                Navigator.push(context, LeftToRightPageRoute(_Hero1Demo()));

                Navigator.push(context, CustomPageRoute(this.widget, _Hero1Demo()));
              },

              ///2个页面都有Hero控件，且tag参数一致。
              child: Hero(
                tag: 'hero',
                child: Container(
                  child: Image.asset(
                    'assets/image/headIcon.png',
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            );
          }
          return Container(
            color: Colors.red,
          );
        }),
      ),
    );
  }
}

class _Hero1Demo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
          alignment: Alignment.topCenter,
          child: Hero(
            tag: 'hero',
            child: Container(
              child: Image.asset(
                'assets/image/headIcon.png',
              ),
            ),
          )),
    );
  }
}

class LeftToRightPageRoute extends PageRouteBuilder {
  final Widget newPage;

  LeftToRightPageRoute(this.newPage)
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              newPage,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              SlideTransition(
            position: Tween(begin: Offset(-1, 0), end: Offset(0, 0)).animate(animation),
            child: child,
          ),
        );
}

class CustomPageRoute extends PageRouteBuilder {
  final Widget currentPage;
  final Widget newPage;

  CustomPageRoute(this.currentPage, this.newPage)
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              currentPage,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              Stack(
            children: <Widget>[
              SlideTransition(
                position: new Tween<Offset>(
                  begin: const Offset(0, 0),
                  end: const Offset(0, -1),
                ).animate(animation),
                child: currentPage,
              ),
              SlideTransition(
                position: new Tween<Offset>(
                  begin: const Offset(0, 1),
                  end: Offset(0, 0),
                ).animate(animation),
                child: newPage,
              )
            ],
          ),
        );
}
