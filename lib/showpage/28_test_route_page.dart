import 'package:ax_flutter_util/ax_flutter_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boost/flutter_boost.dart';

class P28RoutePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MaterialPage();
  }
}

class _MaterialPage extends State<P28RoutePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void deactivate() {
    super.deactivate();
    print('deactivate');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("路由"),
      ),
      body: ListView(
        children: <Widget>[
          FlatButton(
            child: Text("pushName-sub1,普通"),
            onPressed: () {
              Navigator.of(context).pushNamed('/P28RoutePageSub1', arguments: {
                "title": "透传title",
                "name": 'postbird',
                'passw': '123456'
              });
            },
          ),
          FlatButton(
            child: Text("FlutterBoost 路由"),
            onPressed: () {
              FlutterBoost.singleton.open('/P28RoutePageSub1', urlParams: <String, dynamic>{
                'present': true
              }).then((Map<dynamic, dynamic> value) {
                print('FlutterBoost =  $value');
              });
            },
          ),
          FlatButton(
            child: Text("pushReplacement"),
            onPressed: () {
              pushReplacement(context: context, widget: P28RoutePageSub1());
            },
          ),
          FlatButton(
            child: Text("pushAndRemoveUntil"),
            onPressed: () {
              pushAndRemoveUntil(context: context, widget: P28RoutePageSub1());

              Future.delayed(Duration(seconds: 2), () {
                pop(context);
              });
            },
          ),
        ],
      ),
    );
  }
}

class P28RoutePageSub1 extends StatelessWidget {
  final Map sub1Map;

  P28RoutePageSub1({Key key, this.sub1Map}) : super(key: key) {
    print(this.sub1Map);
  }

  @override
  Widget build(BuildContext context) {
    String tmp = ModalRoute.of(context).settings.arguments.toString();
    String tmp2 = this.sub1Map.toString();

    print("tmp== $tmp");
    print("tmp2== $tmp2");

    return Scaffold(
      appBar: AppBar(
        title: Text("P28RoutePageSub1"),
      ),
      body: ListView(
        children: <Widget>[
          FlatButton(
            child: Text("pushName-sub1,普通"),
            onPressed: () {
              Navigator.of(context).pushNamed('/P28RoutePageSub2', arguments: {
                "title": "透传title",
                "name": 'postbird',
                'passw': '123456'
              });
            },
          ),
        ],
      ),
    );
  }
}

class P28RoutePageSub2 extends StatelessWidget {
  final Map sub2Map;

  P28RoutePageSub2({Key key, this.sub2Map}) : super(key: key) {
    print(this.sub2Map);
  }

  @override
  Widget build(BuildContext context) {
    /// 上下文获得参数
    String tmp = ModalRoute.of(context).settings.arguments.toString();
    String tmp2 = this.sub2Map.toString();

    print("tmp== $tmp");
    print("tmp2== $tmp2");

    return Scaffold(
      appBar: AppBar(
        title: Text("P28RoutePageSub2"),
      ),
      body: ListView(
        children: <Widget>[
          FlatButton(
            child: Text("to P28RoutePageSub3"),
            onPressed: () {
//              Navigator.of(context).popUntil(ModalRoute.withName('/P28RoutePage'));

//              Navigator.popUntil(context, ModalRoute.withName('/P28RoutePageSub1'));
//              Navigator.of(context).popUntil((route) => route.settings.name.startsWith('/P28RoutePage'));

              Navigator.of(context).pushNamed('/P28RoutePageSub3');
            },
          ),
          Container(
            color: Colors.red,
//            width: double.infinity-100,
//            height: double.infinity,
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.all(20),
            child: Text(
              '内容1',
              style: TextStyle(backgroundColor: Colors.greenAccent),
            ),
          ),
          Container(
            color: Colors.red,
//            width: double.infinity-100,
//            height: double.infinity,
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.all(20),
            child: Text(
              '内容2',
              style: TextStyle(backgroundColor: Colors.greenAccent),
            ),
          ),
        ],
      ),
    );
  }
}

class P28RoutePageSub3 extends StatelessWidget {
  final Map sub2Map;

  P28RoutePageSub3({Key key, this.sub2Map}) : super(key: key) {
    print(this.sub2Map);
  }

  @override
  Widget build(BuildContext context) {
    /// 上下文获得参数
    String tmp = ModalRoute.of(context).settings.arguments.toString();
    String tmp2 = this.sub2Map.toString();

    print("tmp== $tmp");
    print("tmp2== $tmp2");

    return Scaffold(
      appBar: AppBar(
        title: Text("P28RoutePageSub3"),
      ),
      body: ListView(
        children: <Widget>[
          FlatButton(
            child: Text("返回P28RoutePageSub1"),
            onPressed: () {
//              Navigator.of(context).popUntil(ModalRoute.withName('/P28RoutePage'));

              Navigator.popUntil(
                  context, ModalRoute.withName('/P28RoutePageSub1'));
//              Navigator.of(context).popUntil((route) => route.settings.name.startsWith('/P28RoutePage'));
            },
          ),
          Container(
            color: Colors.red,
//            width: double.infinity-100,
//            height: double.infinity,
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.all(20),
            child: Text(
              '内容1',
              style: TextStyle(backgroundColor: Colors.greenAccent),
            ),
          ),
          Container(
            color: Colors.red,
//            width: double.infinity-100,
//            height: double.infinity,
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.all(20),
            child: Text(
              '内容2',
              style: TextStyle(backgroundColor: Colors.greenAccent),
            ),
          ),
        ],
      ),
    );
  }
}
