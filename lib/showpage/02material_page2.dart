import 'package:ax_flutter_util/ax_flutter_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MaterialPage2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
//    return _MaterialPage22();
    return _MaterialPage23();
  }
}

class _MaterialPage23 extends State<MaterialPage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      backgroundColor: Colors.green,
      appBar: AppBar(
        title: Text('中间list适应大小'),
      ),
      body: ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child: Column(
          children: <Widget>[
            Container(
              height: 50,
              color: Colors.red,
            ),
            Expanded(
//              child: Container(
//                height: 50,
//                color: Colors.greenAccent,
//              ),

              child: ListView(
                children: <Widget>[
                  Text('11'),
                ],
              ),
            ),
            Container(
              height: 50,
              color: Colors.orange,
            ),
          ],
        ),
      ),
    );
  }
}

class _MaterialPage22 extends State<MaterialPage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      backgroundColor: Colors.green,
      appBar: AppBar(
        title: Text('各种按钮'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          FlatButton(
            color: Colors.orange,
            child: Text('FlatButton'),
            onPressed: () {},
          ),
          SizedBox(
            height: 10,
          ),
          FlatButton(
            color: Colors.red,
            child: Container(
              child: Text('FlatButton'),
            ),
            onPressed: () {},
          ),
          OutlineButton(
            color: Colors.red,
            child: Container(
              child: Text('OutlineButton'),
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

class _MaterialPage1 extends State<MaterialPage2>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => false;

  @override
  void updateKeepAlive() {
    // TODO: implement updateKeepAlive
    super.updateKeepAlive();
    print('MaterialPage2 == updateKeepAlive');
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('MaterialPage2 == initState');

    WidgetsBinding.instance.addPostFrameCallback((callback) {
      print("addPostFrameCallback be invoke");
    });
  }

  @override
  Widget build(BuildContext context) {
    print('MaterialPage2 == build');

    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        title: Text("从下向上排布"),
        actions: <Widget>[
          FlatButton(
            child: Text('点1'),
            onPressed: () {
//              showAlert(context: context, title: "标题", message: "内容");
//              showAlert(context: context, title: "标题2", message: "内容");
//              showAlert(context: context, title: "标题3", message: "内容");
//              showAlert(context: context, title: "标题4", message: "内容");
              showCupertinoAlert(context: context);
            },
          ),
          FlatButton(
            child: Text('点2'),
            onPressed: () {
              showCupertinoAlert(context: context, title: "标题", message: "内容");
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
//          verticalDirection: VerticalDirection.up,
          children: <Widget>[
            Container(
              width: 100,
              height: 100,
              color: Colors.orange,
            ),
            Container(
              width: 100,
              height: 100,
              color: Colors.red,
            ),
            Text('这是个Stack'),
            Container(
              width: double.infinity,
              height: 300,
              color: Colors.white,
              child: Stack(
//              alignment:Alignment.center ,
//              alignment:Alignment.topLeft ,
//              fit: StackFit.expand, //未定位widget占满Stack整个空间
                children: <Widget>[
                  Container(
                    width: 200,
                    height: 200,
                    color: Colors.deepPurple,
                  ),

                  Container(
                    width: 100,
                    height: 100,
                    color: Colors.orange,
                  ),

                  Container(
                    width: 50,
                    height: 50,
                    color: Colors.red,
                  ),

//                  Align(
//                    child: Container(
//                      width: 25,
//                      height: 25,
//                      color: Colors.red,
//                    ),
//                    alignment: Alignment.topRight,
//                  ),

                  Positioned(
                    right: 10,
                    top: 10,
                    child: Container(
                      width: 20,
                      height: 20,
                      color: Colors.indigoAccent,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              width: 100,
              height: 100,
              color: Colors.lightBlueAccent,
            ),
          ],
        ),
      ),
    );
  }
}
