import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class MaterialPageRxDart extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MaterialPage1();
  }
}

class _MaterialPage1 extends State<MaterialPageRxDart> {
  String textData = "";

  @override
  void initState() {
    super.initState();

//    Observable<String> _observable = Observable(Stream.fromIterable(['hello','你好']));
//
//
//    _observable.listen((data){
//
//    });
  }

//  Observable Observable_periodic;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("dispose = ");

//    Observable_periodic = null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("rxdart-Reactive Extensions"),
      ),
      body: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              Text("Observable 把以前的 Stream放入"),
              Text(textData),
              FlatButton(
                child: Text("Stream按钮"),
                onPressed: () async {
                  List<String> list = [
                    "Stream 返回结果 ${Random().nextInt(100)}",
                    "Stream 返回结果 ${Random().nextInt(100)}"
                  ];

                  /// 应该就是异步
                  /* Stream<List> _stream = Stream.fromFuture(
                    /// 定义 Future
                    Future.delayed(Duration(seconds: 1), () {
                      return ["Stream 返回结果 ${Random().nextInt(100)}","Stream 返回结果 ${Random().nextInt(100)}"];
                    }),
                  );

                  Observable<List> _observable = Observable(_stream);*/

                  /// fromIterable 放入一个list,listen 会根据list长度 多次订阅
//                  Observable<String> _observable = Observable(Stream.fromIterable(['hello','你好']));

                  /// fromFuture
                  /*    Observable _observable = Observable.fromFuture(
                    /// 定义 Future
                    Future.delayed(Duration(seconds: 1), () {
                      return "Stream 返回结果 ${Random().nextInt(100)}";
                    }),
                  );*/

                  /// 可迭代的类 list Set

                  /*Observable _observable = Observable.fromIterable([
                    "Stream 返回结果 ${Random().nextInt(100)}",
                    "Stream 返回结果 ${Random().nextInt(100)}"
                  ]);
*/

                  /// 只有一个数据 T
//                  Observable _observable = Observable.just(list);
//
//                  _observable.listen((data) {
//                    debugPrint("StreamData = $data");
//                  });

//                  _observable = Observable.just("jim");
//                  _observable.listen((data) {
//                    debugPrint("StreamData2 = $data");
//                  });
                },
              ),
              Divider(
                color: Colors.red,
              ),
              FlatButton(
                child: Text("重复触发,根据内容关闭,不可以关闭"),
                onPressed: () {
                  /// 重复触发
                  ///
//                  Observable_periodic =
//                      Observable.periodic(Duration(seconds: 1), (count) {
//                    return "返回给: $count";
//                  }).listen((data) {
//                    debugPrint("StreamData = $data");
//                  }) as Observable;

                  /// 这个也是间隔,但
//                  var obs = Observable(Stream.fromIterable([1, 2, 3, 4, 5]))
//                      .interval(Duration(seconds: 1));
//
//                  obs.listen((data){
//                    print("data = ${data}");
//                  });
                },
              ),
              Divider(
                color: Colors.red,
              ),
              FlatButton(
                child: Text("吐出数据”后间隔一段时间再吐下一个数据。"),
                onPressed: () {
//                  Stream stream  = Stream.fromIterable([1, 2, 3, 4, 5]);
                  Stream stream = Stream.fromFuture(Future.value("jim"));

//                  Stream stream  = Stream.fromFuture( Future.delayed(Duration(seconds: 1), () {
//                    return "tom";
//                  }));

//                  var obs = Observable(stream).interval(Duration(seconds: 1));
//
//                  obs.listen((data) {
//                    print("data = ${data}");
//                  });
                },
              ),
              Divider(
                color: Colors.red,
              ),
              FlatButton(
                child: Text("PublishSubject重复,且可关闭"),
                onPressed: () async {
//                  PublishSubject _subject = PublishSubject<String>().listen((data) {
//                    debugPrint("StreamData2 = $data");
//
//                  }) as PublishSubject
//                    ..interval(Duration(seconds: 1));

//                  Observable observable = Observable(Stream.fromIterable([1, 2, 3, 4, 5]));
//                  observable.startWith(9).listen(print);

//                  Observable ob =PublishSubject().interval(Duration(seconds: 1));

                  PublishSubject _subject = PublishSubject();

                  _subject.listen((data) {
                    debugPrint("StreamData1 = $data");
                  });

//                  _subject.listen((data) {
//                    debugPrint("StreamData2 = $data");
//                  });

                  /// 放中间,后面的监听不到
                  _subject.add("jim");

                  Future.delayed(Duration(seconds: 4), () {
                    print("aaaaa");

                    _subject.close();
                  });
                },
              ),
              Divider(
                color: Colors.red,
              ),
              FlatButton(
                child: Text("PublishSubject"),
                onPressed: () {
                  PublishSubject _subject = PublishSubject();

                  _subject.listen((data) {
                    debugPrint("StreamData = $data");
                  });

                  /// 放中间,后面的监听不到
                  _subject.add("jim");

                  _subject.listen((data) {
                    debugPrint("StreamData2 = $data");
                  });

                  _subject.close();
                },
              ),
              Divider(
                color: Colors.red,
              ),
              FlatButton(
                child:
                    Text("5--BehaviorSubjec,add后listen 也可以监听,2个add,不同位置不同效果"),
                onPressed: () {
                  BehaviorSubject _subject = BehaviorSubject(onListen: () {
                    print("被监听");
                  });

                  _subject.listen((data) {
                    debugPrint("StreamData1 = $data");
                  });

                  /// 这个放中间,不同位置不同效果
                  ///  BehaviorSubject add 后面的listen 只能被监听最后add的
                  ///
                  _subject.add("jim");
                  _subject.add("tom");

                  _subject.listen((data) {
                    debugPrint("StreamData2 = $data");
                  });

                  _subject.listen((data) {
                    debugPrint("StreamData3 = $data");
                  });

                  _subject.close();
                },
              ),
              Divider(
                color: Colors.red,
              ),
              FlatButton(
                child: Text("ReplaySubject,2个add后listen 也可以监听"),
                onPressed: () {
                  ///maxSize 直接接收最后的2个
                  ReplaySubject _subject = ReplaySubject<String>(maxSize: 2);

                  /// 这个放中间,不同位置不同效果
                  _subject.add("jim");
                  _subject.add("tom");
                  _subject.add("jack");

                  _subject.listen((data) {
                    debugPrint("StreamData = $data");
                  });

                  _subject.listen((data) {
                    debugPrint("StreamData2 = $data");
                  });

                  _subject.close();
                },
              ),
              Divider(
                color: Colors.red,
              ),
              FlatButton(
                child: Text("转map-拦截一下"),
                onPressed: () {
//                  PublishSubject _subject = PublishSubject() ;
//
//                  _subject.map((item){
//                  return "拦截一下 $item";
//                  }).listen((data) {
//                    debugPrint("StreamData = $data");
//                  });

                  /// 语法
                  /* PublishSubject _subject1 = PublishSubject().map((item){
                    return "拦截一下 $item";
                  }).listen((data) {
                    debugPrint("StreamData = $data");
                  }) as PublishSubject;
                  _subject1.close();*/
/*

                  PublishSubject _subject = PublishSubject()
                    ..map((item) {

                      return "拦截一下 $item";
                    }).where((item){
                      print("where $item");

                      return true;
                    }).listen((data) {
                      debugPrint("StreamData = $data");
                    });
*/

                  /* PublishSubject _subject = PublishSubject<String>()
                    ..where(( item){

                      print("where ${item=="jim"}");
                      return item=="jim";

                    }).map((item) {
                      print("map $item");
                      return "拦截一下 $item";
                    }).listen((data) {
                      debugPrint("StreamData = $data");
                    });*/

                  PublishSubject _subject = PublishSubject<String>()
                    ..debounceTime(Duration(seconds: 5)).listen((data) {
                      debugPrint("${DateTime.now()} StreamData = $data");
                    });

                  /// 这个放中间,不同位置不同效果
                  _subject.add("jim");
//                  _subject.add("jim1");
//                  _subject.(["jim1","jim1"]);
                  /// 需要关闭,不然有警告
                  _subject.close();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
