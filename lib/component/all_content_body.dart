import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AllContentBody extends StatefulWidget {
  final List<AllContentBox> children;

  ///初始化并执行方法
  AllContentBody({List<AllContentBox> children = const <AllContentBox>[]}) : this.children = children {
//    debugPrint(children.toString());
  }

  @override
  _AllContentBodyState createState() => _AllContentBodyState();
}

class _AllContentBodyState extends State<AllContentBody> {
  @override
  Widget build(BuildContext context) {
    /// 滚动条
    return CupertinoScrollbar(
      child: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 100),
        child: Column(
          children: widget.children,
        ),
      ),
    );
  }
}

class AllContentBox extends StatefulWidget {
  final String title;
  final Color bgColors;
  final Widget child;

  AllContentBox({this.title = '', this.bgColors = Colors.green, required this.child});

  @override
  _AllContentBoxState createState() => _AllContentBoxState();
}

class _AllContentBoxState extends State<AllContentBox> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 20,
        ),
        Text(widget.title),
        Container(
          color: widget.bgColors,

          /// Container 满屏宽
          alignment: Alignment.center,
          child: widget.child,
        ),
      ],
    );
  }
}
