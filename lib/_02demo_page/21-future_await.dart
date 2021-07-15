import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FutureAndAwaitTest extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<FutureAndAwaitTest> {
  // Future<void> test() {
  //   Future.sync(() {
  //     return Future.value("a");
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("按钮组件"),
      ),
      body: Column(
        children: <Widget>[
          FlatButton(
            child: Text("future-异步,后面的执行"),
//      child : Icon(Icons.add),
            onPressed: () {
              Future.delayed(Duration(seconds: 1), () {
                print("内部====1");
                return "jim";
              }).then((onValue) {
                print("内部====2  ${onValue}");
              });
              print("外部====3");
            },
          ),
          FlatButton(
            child: Text("await-阻塞,后面的不执行"),
            onPressed: () async {
              await Future.delayed(Duration(seconds: 1), () {
                print("await内部====1");
                return "tom";
              }).then((onValue) {
                print("await内部====2  ${onValue}");
              });
              print("await内部====3");
            },
          ),
          FlatButton(
            child: Text("开启-异步"),
            onPressed: () async {
              Future.sync(() async {
                await Future.delayed(Duration(seconds: 1));
                print("开启====1");
              });

              Future.sync(() {
                print("开启====3");
              });

              Future.sync(() {
                print("开启====2");
              });
            },
          ),
          FlatButton(
            child: Text("开启-多个执行后,再执行别的"),
            onPressed: () async {
              /// Iterable<Future<T>> 集合中Future
              Future.wait([
                Future.sync(() async {
                  await Future.delayed(Duration(seconds: 1));
                  print("开启====1");
                  return "结果-1";
                }),
                Future.sync(() {
                  print("开启====3");

                  return "结果-3";
                }),
                Future.sync(() {
                  print("开启====2");
                  return "结果-2";
                }),
                Future.sync(() {
                  print("开启====4");
                }),
              ]).then((onValue) {
                print("onValue == ${onValue}");
              });
            },
          ),
        ],
      ),
    );
  }
}
