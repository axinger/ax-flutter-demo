import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class P38CenterUpPage extends StatefulWidget {
  @override
  _BiometricHomePageState createState() => _BiometricHomePageState();
}

class _BiometricHomePageState extends State<P38CenterUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('水平向上对齐'),
      ),
      body: //通过ConstrainedBox来确保Stack占满屏幕
//          ConstrainedBox(
//        constraints: BoxConstraints.expand(),
//        child:Column(
//          children: <Widget>[
////            Text('111'),
//            Stack(
//              alignment: Alignment.center, //指定未定位或部分定位widget的对齐方式
//              children: <Widget>[
//
//
//                Positioned(
//                  top: 100.0,
//                  child: Text("Your friend"),
//                ),
////            Container(child: Text("Hello world",style: TextStyle(color: Colors.white)),
////              color: Colors.red,
////            ),
//
//                Align(
//                    alignment: Alignment.center,
//                    // FlutterLogo 是Flutter SDK提供的一个组件，内容就是Flutter的商标。
//                    child: Container(
//                      width: 400,
//                      height: 400,
//                      color: Colors.red,
//                    )),
//              ],
//            )
//          ],
//        ),
//      ),

//   Center(
//     child:  Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: <Widget>[
//         Text('111'),
//
////         Expanded(
////           flex: 1,
////           child: Text('222'),
////         ),
//       ],
//     ),
//   ),

//        Center(
//          child: Container(
////            width: 250,
////            height: 400,
//            color: Colors.blue,
//            child: Stack(
//              children: <Widget>[
//                Text('111'),
//                Text('222'),
//                Positioned(
//                  child: Text("Positioned"),
//                  left: 20,
//                  top: 20,
//                ),
//                Positioned(
//                  child:  Align(
//                    alignment: Alignment.center,
//                    child: Icon(Icons.clear),
//                  ),
//                  left: 100,
//                  top: 50,
//                ),
//                Align(
//                  alignment: Alignment.center,
//                  child: Icon(Icons.clear),
//                ),
//
//              ],
//            ),
//          ),
//        ),

//    Container(
//      color: Colors.orange,
//      child: Center(
//        child: Column(
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
////            Text('111'),
//            Align(
//              // 不显式指定宽高，通过同时指定widthFactor和heightFactor 为2也是可以达到同样的效果：2*60=120
////            widthFactor: 100,
////            heightFactor: 100,
//              alignment: Alignment.center,
//              // FlutterLogo 是Flutter SDK提供的一个组件，内容就是Flutter的商标。
//              child: FlutterLogo(
//                size: 60,
//              ),
//            ),
//          ],
//        ),
//      ),
//    ),

          Container(
        color: Colors.orange,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  color: Colors.red,
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      Positioned(
                        child: Column(
                          children: <Widget>[
                            Text('头像'),
                            Text('姓名'),
                          ],
                        ),
//                    left: 20,
                        bottom: 20,
                      )
                    ],
                  ),
                ),
              ),
              Container(
                color: Colors.green,
                padding: EdgeInsets.only(top: 10, bottom: 10),
//                width: 80,
//                height: 80,
                child: Column(
                  children: <Widget>[
                    Text('头像'),
                    Text('姓名'),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  color: Colors.teal,
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      Positioned(
                        child: Column(
                          children: <Widget>[
                            Text('头像'),
                          ],
                        ),
//                    left: 20,
                        top: 20,
                      )
                    ],
                  ),
//                  width: 80,
//                  height: 80,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
