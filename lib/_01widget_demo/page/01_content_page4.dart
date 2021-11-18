import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class P01ContentPage4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        brightness: Brightness.light,
        title: Text('圆角设置组件'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              /// https://www.jianshu.com/p/2f4e70031670
              Text('1.ClipRRect：将 child 剪裁为宽高相等的圆角组件，可设置圆角度数'),
              ClipRRect(
                borderRadius: BorderRadius.circular(40), //圆角度数
                /// semanticLabel
                ///https://weilu.blog.csdn.net/article/details/103823259
                child: Image.asset('assets/image/headIcon.png',
                    width: 80,
                    height: 80,
                    semanticLabel: 'semanticLabel',
                    excludeFromSemantics: true),
              ),
              Divider(color: Colors.red),

              Text('2.ClipOval： 将child裁剪为宽高相等的圆角组件（只包括圆形和椭圆形），不可设置圆角度数'),
              ClipOval(
                child: Image.asset(
                  'assets/image/headIcon.png',
                  width: 80,
                  height: 100,
                ),
              ),
              Divider(color: Colors.red),

              Text('3.CircleAvatar：只能设置自身圆形，不能裁剪child,背景'),
              CircleAvatar(
                // child: Image.asset('assets/image/headIcon.png'),
                radius: 30,
                backgroundImage: AssetImage('assets/image/headIcon.png'),
              ),
              Divider(color: Colors.red),

              Text('4.BoxDecoration BorderRadius.circular 设置自身圆角,不能裁剪child'),
              Container(
                width: 80.0, //100或80
                height: 100.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    image: DecorationImage(
                      image: AssetImage('assets/image/headIcon.png'),
                    )),
              ),

              Divider(color: Colors.red),

              Text('5.BoxDecoration BoxShape.circle 只能设置自身为圆形，不能裁剪child'),
              Container(
                width: 80, //80或100
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('assets/image/headIcon.png'),
                  ),
                ),
              ),

              Divider(color: Colors.red),
            ],
          ),
        ),
      ),
    );
  }
}
