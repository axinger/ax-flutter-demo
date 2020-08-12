import 'dart:async';
import 'dart:math';

import 'package:ax_flutter_demo/base/all_content_body.dart';
import 'package:ax_flutter_util/ax_flutter_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class P14AllBuilderPage extends StatefulWidget {
  @override
  _P14AllBuilderPageState createState() => _P14AllBuilderPageState();
}

class _P14AllBuilderPageState extends State<P14AllBuilderPage> {
  ValueNotifier<int> _counterValueNotifier = ValueNotifier<int>(0);

  StreamController<int> _streamController = StreamController<int>();
  int streamInt = 0;

  BehaviorSubject<String> _behaviorSubject;

  Future demo1() async {
    await Future.delayed(Duration(seconds: 1));
    return 'A';
  }

  Future demo2() async {
    await Future.delayed(Duration(seconds: 2));
    return 'B';
  }

  Future demo3() async {
    await Future.delayed(Duration(seconds: 1));
    return 'C';
  }

  List allData = [];

  var listNotifier = ValueNotifier<List<String>>([]);

//调用 //dynamic 类型自己定
  Future<List> _futureBuilderData() {
    return Future.wait<dynamic>([demo1(), demo2(), demo3()]).then((e) {
      print('e========== $e) '); //[true,true,false]

      return e;
    }).catchError((e) {});
  }

  @override
  void initState() {
    super.initState();
    listNotifier.addListener(() {
      print('listNotifier = ${listNotifier.value}');
    });
  }

  @override
  void dispose() {
    super.dispose();
    _streamController?.close();
  }

  int streamValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("各种BuilderWidget"),
        ),
        body: AllContentBody(
          children: [
            AllContentBox(
              title: 'list-ValueListenableBuilder',
              child: Column(
                children: <Widget>[
                  FlatButton(
                    color: Colors.grey,
                    child: Text('listNotifier'),
                    // 点击的时候用 ValueNotifier 来更新值
                    onPressed: () {
                      listNotifier.value.add(Random().nextInt(100).toString());
                      print(listNotifier.value.hashCode);

                      listNotifier.value = [...listNotifier.value];
                      print(listNotifier.value.hashCode);
                      
                    },
                  ),
                ],
              ),
            ),
            AllContentBox(
              title: '数据监听-ValueListenableBuilder',
              child: Column(
                children: <Widget>[
                  ValueListenableBuilder<int>(
                    builder: (BuildContext context, value, Widget child) {
                      // 只有在更新计数器时才会调用此生成器。
                      return Row(
                        ///  spaceEvenly 左右中分布
                        ///  spaceAround 左右分布
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(
                            '$value',
                            style: TextStyle(backgroundColor: Colors.red),
                          ),
                          child,
                        ],
                      );
                    },
                    valueListenable: _counterValueNotifier,
                    // 如果child 的构建成本很高，并且不依赖于通知程序的值，则child参数非常有用。
                    child: Text('并且不依赖于通知程序的值，则child参数非常有用。',
                        style: TextStyle(backgroundColor: Colors.orange)),
                  ),
                  FlatButton(
                    color: Colors.grey,
                    child: Text('加1'),
                    // 点击的时候用 ValueNotifier 来更新值
                    onPressed: () => _counterValueNotifier.value += 1,
                  ),
                ],
              ),
            ),
            AllContentBox(
              title: '数据监听-StreamBuilder',
              child: Column(
                children: <Widget>[
                  StreamBuilder<int>(
                      // 监听Stream，每次值改变的时候，更新Text中的内容
                      stream: _streamController.stream,

                      /// 第一次监听值
                      initialData: streamInt,
                      builder:
                          (BuildContext context, AsyncSnapshot<int> snapshot) {
                        print('snapshot.data = ${snapshot?.data}');
                        return Text(snapshot?.data.toString());
                      }),
                  FlatButton(
                    child: Text('加1'),
                    // 点击的时候用 ValueNotifier 来更新值
                    onPressed: () {
                      streamInt++;
                      _streamController.sink.add(streamInt);
                    },
                  ),
                ],
              ),
            ),
            AllContentBox(
              title: 'FutureBuilder',
              child: FutureBuilder(
                future: _futureBuilderData(),
                builder: (context, AsyncSnapshot<List> snapshot) {
                  if (snapshot.hasData) {
                    print('hasData = ${snapshot.data}');
                    return Center(
                      child: Text("成功 ${snapshot?.data} "),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text("错误..."),
                    );
                  } else {
                    return Center(
                      child: Text("等待..."),
                    );
                  }
                },
              ),
            ),
            AllContentBox(
              title: 'rxdart - BehaviorSubject,当前页面add,下个页面listen 同样可以收到数据',
              child: Column(
                children: <Widget>[
                  FlatButton(
                    child: Text('添加'),
                    onPressed: () {
                      _behaviorSubject = BehaviorSubject<String>(onListen: () {
                        print("被监听");
                      });

                      _behaviorSubject.listen((data) {
                        debugPrint("BehaviorSubject = $data");
                      });
                    },
                  ),
                  FlatButton(
                    child: Text('发送内容'),
                    onPressed: () {
                      _behaviorSubject.add('jim');
                    },
                  ),
                  FlatButton(
                    child: Text('下一页'),
                    onPressed: () {
                      push(
                          context: context,
                          widget: _TestPage(
                            behaviorSubject: _behaviorSubject,
                            callBack: (str) {
                              _behaviorSubject.add('$str >> ');
                            },
                          ));
                    },
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}

class _TestPage extends StatefulWidget {
  final BehaviorSubject<String> behaviorSubject;
  final Function(String str) callBack;

  _TestPage({this.behaviorSubject, this.callBack});

  @override
  __TestPageState createState() => __TestPageState();
}

class __TestPageState extends State<_TestPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    widget.behaviorSubject.listen((data) {
      debugPrint("StreamData3 = $data");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('下一页'),
      ),
      body: Column(
        children: <Widget>[
          StreamBuilder<String>(
              stream: widget.behaviorSubject.stream,

              /// 第一次监听值
//          initialData: streamInt,
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                print('snapshot.data = ${snapshot?.data}');
                return Text(snapshot?.data.toString());
              }),
          FlatButton(
            child: Text('callBack'),
            onPressed: () {
              widget.callBack('tom');
            },
          ),
        ],
      ),
    );
  }
}
