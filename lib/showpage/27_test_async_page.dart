import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class P27AsyncPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MaterialPage();
  }
}

class _MaterialPage extends State<P27AsyncPage> {
  Future<String> test1() {
//    return Future<String>.delayed(Duration(seconds: 1)).then((value) => "jack");
//    return Future<String>.delayed(Duration(seconds: 1),(){
//      return "jak2";
//    }).then((value){
//      print("test1 = $value");
//    });
    return Future<String>.delayed(Duration(seconds: 1), () {
      return "jak2";
    });
  }

  Future<String> test2() async {
    await Future.delayed(new Duration(seconds: 1));

    ///下面这2个返回值 方法效果一样的
//   return Future.value("tom2");
    return "tom3";
  }

  ///上面的代码大概的意思就是每隔 interval = 2 秒发射一次数据, 数据从 0 开始累加,
  ///直到数据等于 maxCount=5 时停止发射. 需要注意的是只有调用了 listen 异步函数体才会被执行, 该函数返回的是一个 Subscription
  ///可以通过 pause 函数来暂停一个 Subscription 发射数据:
  Stream<int> timedCounter(Duration interval, [int maxCount]) async* {
    int i = 0;
    while (true) {
      await Future.delayed(interval);
      yield i++;
      if (i == maxCount) break;
    }
  }

  Future<String> getNetWorkData() {
    return Future<String>(() {
      sleep(Duration(seconds: 3));

      /// 返回成功结果
      return 'newWorkData';
    });
  }

  Stream syncIterator2;

  Stream<int> getData() async* {
    for (int i = 1; i < 4; i++) {
//      await Future.delayed(Duration(seconds: 1));
      sleep(Duration(seconds: 1));
      yield i * 2;
    }
  }

  Stream<String> stream2;

  /// async* 异步返回  Stream
  Stream<String> getData2() async* {
    await Future.delayed(Duration(seconds: 2)); //模拟耗时
    yield 'jim';

    await Future.delayed(Duration(seconds: 1)); //模拟耗时
    yield 'tom';
  }

  Stream<String> stream4;

  /// async* 异步返回  Stream
  Future<String> getData4() {
    return Future.any([
      Future.delayed(Duration(seconds: 2), () {}).then((v) {
        print('jim>>>>>>');
        return 'jim2';
      }),
      Future.delayed(Duration(seconds: 3), () {}).then((v) {
        print('tom>>>>>>');
        return 'tom';
      }),
    ]);
  }

  ///多元素同步
  ///sync* 同步返回集合
  Iterable<String> getData3() sync* {
    /// sleep 会影响主线程
    Future.delayed(Duration(seconds: 2)); //模拟耗时
    yield 'jim';

    Future.delayed(Duration(seconds: 2)); //模拟耗时
    yield 'tom';
  }

//  Iterable<int> getData2() async* {
//    for (int i = 0; i < 3; i++) {
//      await Future.delayed(Duration(seconds: 1));
//      print('getData = $i');
//      yield i;
//    }
//  }

  Iterator syncIterator1;

  Iterable<int> syncTest1() sync* {
    for (int i = 0; i < 3; i++) {
      yield i;
    }
  }

  @override
  void initState() {
    super.initState();
    stream2 = getData2();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("async和async*"),
      ),
      body: ListView(
        children: <Widget>[
          Text('FutureBuilder,多次回调'),
          Container(
            color: Colors.orange,
            child: FutureBuilder<String>(
              future: getData4(),
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                print('snapshot.hasData>>>>>>>>>');
                if (snapshot.hasData) {
                  print('hasData22222 ${snapshot.data}');
                  return Column(
                    children: <Widget>[
                      Text('snapshot = ${snapshot.data}'),
                    ],
                  );
                } else {
                  print('hasData22222');
                  return Text('无内容');
                }
              },
            ),
          ),
          Container(
            color: Colors.blue,
            child: StreamBuilder<String>(
              stream: stream2,
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: <Widget>[
                      Text('snapshot = ${snapshot.data}'),
                      FlatButton(
                        child: Text("async* 主动调用一次,完成返回值"),
                        onPressed: () {},
                      ),
                    ],
                  );
                } else {
                  return Text('无内容');
                }
              },
            ),
          ),
          Container(
            color: Colors.greenAccent,
            child: Column(
              children: <Widget>[
                FlatButton(
                  child: Text("async* 主动调用一次,完成返回值"),
                  onPressed: () {
                    syncIterator1 = syncTest1().iterator;
                  },
                ),
                FlatButton(
                  child: Text("调用 async* moveNext,然后才有值"),
                  onPressed: () {
                    syncIterator1.moveNext();
                  },
                ),
                FlatButton(
                  child: Text("调用 async* current,无moveNext,值不变"),
                  onPressed: () {
                    print(syncIterator1.current);
                  },
                ),
              ],
            ),
          ),
          Container(
            color: Colors.grey,
            child: Column(
              children: <Widget>[
                FlatButton(
                  child: Text("2 Streamasync* 主动调用一次,完成返回值"),
                  onPressed: () {
                    print('main function start');
                    syncIterator2 = getData();
                    print('main function end');
                  },
                ),
                FlatButton(
                  child: Text("2 Stream调用 async* listen,然后才有值"),
                  onPressed: () {
                    syncIterator2.listen((event) {
                      print("event=2= $event");
                    });
                  },
                ),
              ],
            ),
          ),
          Container(
            color: Colors.orange,
            child: Column(
              children: <Widget>[
                FlatButton(
                  child: Text("Future- 值,定义方法不不用async,调用方法不用async"),
                  onPressed: () {
                    test1().then((value) => print(value));
                  },
                ),
                FlatButton(
                  child: Text("Future- 值,定义方法不不用async,调用方法用async"),
                  onPressed: () async {
                    print(await test2());
                  },
                ),
                FlatButton(
                  child: Text("Future- 值,定义方法用async,调用方法用async"),
                  onPressed: () async {
                    print(await test2());
                  },
                ),
                FlatButton(
                  child: Text("Future- 值,定义方法用async,调用方法不用async"),
                  onPressed: () {
                    test2().then((value) => print(value));
                  },
                ),
              ],
            ),
          ),
          Container(
            color: Colors.blue,
            child: Column(
              children: <Widget>[
                ///https://blog.csdn.net/qizewei123/article/details/89190415
                Text('Dart 中事件的执行顺序：Main > MicroTask > EventQueue。'),
                FlatButton(
                  child: Text("async* 主动调用一次,完成返回值"),
                  onPressed: () {
                    /* I/flutter (32415): s_3
                    I/flutter (32415): s_2
                    I/flutter (32415): s_1*/

                    Future(() => print('s_1'));
                    scheduleMicrotask(() => print('s_2'));
                    print('s_3');
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
