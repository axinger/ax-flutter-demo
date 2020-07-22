import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///InheritedWidget是Flutter的一个功能型的Widget基类，它能有效地将数据在当前Widget树中向它的子widget树传递
class MaterialPageBloc extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MaterialPage1();
  }
}

class _MaterialPage1 extends State<MaterialPageBloc> {
  @override
  Widget build(BuildContext context) {
    return MyInheritedWidget(
      child: Scaffold(
        appBar: AppBar(
          title: Text("BLoC - Business Logic Component"),
        ),
        body: ConterHome(),
        floatingActionButton: ButtomHome(),
      ),
      bloc: ConterBloc(),
    );
  }
}

class ConterHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ConterHome();
  }
}

class _ConterHome extends State<ConterHome> {
  @override
  Widget build(BuildContext context) {
    ConterBloc _conterBloc = MyInheritedWidget.of(context).bloc;

    return Center(
      child: StreamBuilder(
        initialData: 0,
        stream: _conterBloc.stream,

        /// 获得输出流
        builder: (context, snapshot) {
          return ActionChip(
            label: Text("${snapshot.data}"),
            onPressed: () {
              _conterBloc.sink.add(1);
            },
          );
        },
      ),
    );
  }
}

class ButtomHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ButtomHome();
  }
}

class _ButtomHome extends State<ButtomHome> {
  @override
  Widget build(BuildContext context) {
    ConterBloc bloc = MyInheritedWidget.of(context).bloc;

    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () {
//        bloc.log();
        bloc.sink.add(1);
      },
    );
  }
}

class MyInheritedWidget extends InheritedWidget {
  final Widget child;
  final ConterBloc bloc;

  MyInheritedWidget({
    Key key,
    @required this.child,
    @required this.bloc,
  }) : super(key: key, child: child);

  static MyInheritedWidget of(BuildContext context) {
//    return context.inheritFromWidgetOfExactType(MyInheritedWidget);

    return context.dependOnInheritedWidgetOfExactType<MyInheritedWidget>();
  }

  //是否重建widget就取决于数据是否相同
  @override
  bool updateShouldNotify(MyInheritedWidget oldWidget) {
//    return inheritedTestModel != oldWidget.inheritedTestModel;
    return true;
  }
}

///简而言之， Business Logic需要：
//
//        转移到一个或几个BLoC，
//        尽可能从表示层(Presentation Layer)中删除。换句话说，UI组件应该只关心UI事物而不关心业务
//        依赖 Streams 独家使用输入（Sink）和输出（stream）
//        保持平台独立
//        保持环境独立

class ConterBloc {
  int _count = 0;

  /// 这个为了传出 值 输出（stream）
  final StreamController _countStreamController = StreamController<int>();

  Stream<int> get stream => _countStreamController.stream;

  ///这个是为了接收值 输入（Sink）
  final StreamController _streamController = StreamController<int>();

  StreamSink<int> get sink => _streamController.sink;

  ConterBloc() {
    _streamController.stream.listen((data) {
      print("data = $data");
      _count = data + _count;
      _countStreamController.add(_count);
    });
  }

  void dispose() {
    _streamController.close();
    _countStreamController.close();
  }

  void log() {
    debugPrint("BLoC");
  }
}
