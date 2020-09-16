import 'dart:ui';

import 'package:ax_flutter_util/ax_flutter_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../global_const.dart';
import '../theme_data_notifier.dart';

class P01MaterialPage2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyPage();
  }
}

class _MyPage extends State<P01MaterialPage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('形状'),
        actions: <Widget>[
          FlatButton(
            color: Colors.orange,
            child: Text('改变主题色'),
            onPressed: () {
              showCupertinoSheet(
                context: context,
                actions: <CupertinoActionSheetAction>[
                  CupertinoActionSheetAction(
                    child: Text('蓝色'),
                    onPressed: () {

                      Navigator.pop(context);
//                      mainConfigModel.themeData = Theme.of(context).copyWith(
//                        primaryColor: Colors.lightBlue,
//                      );
                      Provider.of<ThemeDataNotifier>(context,listen: false).themeData =
                          Theme.of(context).copyWith(
                            primaryColor: Colors.lightBlue,
                          );
                    },
                  ),
                  CupertinoActionSheetAction(
                    child: Text('红色'),
                    onPressed: () {
                      Navigator.pop(context);
//                      mainConfigModel.themeData = Theme.of(context).copyWith(
//                        primaryColor: Colors.red,
//                      );

                      Provider.of<ThemeDataNotifier>(context,listen: false).themeData =
                          Theme.of(context).copyWith(
                        primaryColor: Colors.red,
                      );
                    },
                  ),
                ],
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            RaisedButton(
              shape: BeveledRectangleBorder(
                  side: BorderSide(width: 1, color: Colors.red),
                  borderRadius: BorderRadius.circular(10)),
              child: Text('BeveledRectangleBorder'),
              onPressed: () {},
            ),

            RaisedButton(
              shape: BeveledRectangleBorder(
                  side: BorderSide(width: 1, color: Colors.red),
                  borderRadius: BorderRadius.circular(100)),
              child: Text('BeveledRectangleBorder'),
              onPressed: () {},
            ),

            RaisedButton(
              shape: BeveledRectangleBorder(
                  side: BorderSide(width: 1, color: Colors.red),
                  borderRadius: BorderRadius.circular(0)),
              child: Text('BeveledRectangleBorder'),
              onPressed: () {},
            ),

            RaisedButton(
              shape: Border(top: BorderSide(color: Colors.red, width: 2)),
              child: Text('Border'),
              onPressed: () {},
            ),

            RaisedButton(
              shape: Border(
                top: BorderSide(color: Colors.red, width: 10),
                right: BorderSide(color: Colors.blue, width: 10),
                bottom: BorderSide(color: Colors.yellow, width: 10),
                left: BorderSide(color: Colors.green, width: 10),
              ),
              child: Text('Border'),
              onPressed: () {},
            ),

            RaisedButton(
              shape: BorderDirectional(
                start: BorderSide(color: Colors.red, width: 2),
                end: BorderSide(color: Colors.blue, width: 2),
              ),
              child: Text('BorderDirectional'),
              onPressed: () {},
            ),
            Container(
              height: 100.0,
              width: 100.0,

              /// 前台装修
              ///将BoxDecoration设置为foregroundDecoration，它绘制在Container的子项之上（而装饰是在子项后面绘制的）。
              foregroundDecoration: BoxDecoration(
                backgroundBlendMode: BlendMode.exclusion,
                gradient: LinearGradient(
                  colors: const [
                    Colors.red,
                    Colors.blue,
                  ],
                ),
              ),
              decoration: BoxDecoration(
                backgroundBlendMode: BlendMode.exclusion,
                gradient: LinearGradient(
                  colors: const [
                    Colors.red,
                    Colors.blue,
                  ],
                ),
              ),
              child: Text('foregroundDecoration'),
            ),

            Container(
              width: 100,
              height: 100,
              color: Colors.red,
              child: RaisedButton(
                shape: CircleBorder(side: BorderSide(color: Colors.red)),
                child: Text('圆边'),
                onPressed: () {},
              ),
            ),
            RaisedButton(
              shape: ContinuousRectangleBorder(
                  side: BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.circular(20)),
              child: Text('ContinuousRectangleBorder'),
              onPressed: () {},
            ),
            Container(
              width: 200,
              height: 100,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.red),
                    borderRadius: BorderRadius.circular(20)),
                child: Text('RoundedRectangleBorder'),
                onPressed: () {},
              ),
            ),
            Container(
              width: 200,
              height: 100,
              child: RaisedButton(
                shape: StadiumBorder(
                  side: BorderSide(color: Colors.red),
                ),
                child: Container(
                  color: Colors.red,
                  child: Text(
                    '圆边',
                    textAlign: TextAlign.center,
                  ),
                ),
                onPressed: () {},
              ),
            ),

            RaisedButton(
              shape: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text('OutlineInputBorder'),
              onPressed: () {},
            ),

            RaisedButton(
              shape: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
              ),
              child: Text('UnderlineInputBorder'),
              onPressed: () {},
            ),
            /**
             * ClipRect组件使用矩形裁剪子组件，通常情况下，
             * ClipRect作用于CustomPaint 、 CustomSingleChildLayout 、 CustomMultiChildLayout 、
             * Align 、 Center 、 OverflowBox 、 SizedOverflowBox组件，
             * 例如ClipRect作用于Align，可以仅显示上半部分
             *
             * clipper参数定义裁剪规则，下面具体介绍。

                clipBehavior参数定义了裁剪的方式，只有子控件超出父控件的范围才有裁剪的说法，各个方式说明如下：

                none：不裁剪，系统默认值，如果子组件不超出边界，此值没有任何性能消耗。
                hardEdge：裁剪但不应用抗锯齿，速度比none慢一点，但比其他方式快。
                antiAlias：裁剪而且抗锯齿，此方式看起来更平滑，比antiAliasWithSaveLayer快，比hardEdge慢，通常用于处理圆形和弧形裁剪。
                antiAliasWithSaveLayer：裁剪、抗锯齿而且有一个缓冲区，此方式很慢，用到的情况比较少。

             * */
            ClipRect(
              child: Align(
                alignment: Alignment.topCenter,
                heightFactor: 0.5,
                child: Container(
                  height: 150,
                  width: 150,
                  child: Image.asset('assets/image/1000x1000.png',
                      fit: BoxFit.cover),
                ),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                height: 150,
                width: 150,
                child: Image.asset(
                  'assets/image/1000x1000.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),

            /// ClipPath组件根据路径进行裁剪，我们自定义裁剪路径也可以使用系统提供的，
            ClipPath.shape(
              shape: StadiumBorder(),
              child: Container(
                height: 150,
                width: 250,
                child: Image.asset(
                  'assets/image/1000x1000.png',
                  fit: BoxFit.cover,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}