import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class P39CirclePage extends StatefulWidget {
  @override
  _P39CirclePageState createState() => _P39CirclePageState();
}

class _P39CirclePageState extends State<P39CirclePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('圆形'),
      ),
      body: Column(
        children: <Widget>[
          ///图片裁剪
          new ClipOval(
            child: Image.asset(
              'assets/image/headIcon.png',
              width: 300,
              fit: BoxFit.fill,
            ),
          ),

          /// 圆化身
          new CircleAvatar(
            ///半径
            radius: 100.0,
            child: Text('jim'),
            backgroundImage: AssetImage('assets/image/headIcon.png'),
          ),
          new Container(
            width: 72.0,
            height: 72.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('assets/image/headIcon.png'),
              ),
            ),
          ),

          ///圆角
          new ClipRRect(
            borderRadius: BorderRadius.circular(6.0),
            child: new Image.asset('assets/image/headIcon.png'),
          ),
          new Container(
            width: 88.0,
            height: 88.0,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(6.0),
              image: DecorationImage(
                image: AssetImage(
                  'assets/image/headIcon.png',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
