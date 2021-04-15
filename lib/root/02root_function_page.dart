import 'dart:async';

import 'package:ax_flutter_util/ax_flutter_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'root_cell.dart';


class RootFunctionPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RootFunctionPageState();
  }
}

class _RootFunctionPageState extends State<RootFunctionPage> {
  ///Flutter&Dart Callback转同步 https://www.jianshu.com/p/e5cba8ca96bc
  Future<void> initFinish() async {
    Completer<void> completer = Completer();

    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      print('回调=============1');
      completer.complete();
    });

    print('回调=============2');
    return completer.future;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   print('回调=============1');
    // });
    //
    // print('回调=============2');

    // initFinish().then((value){
    //   print('回调=============3');
    // });
    // print('回调=============4');
  }

  @override
  Widget build(BuildContext context) {
    print('ShowTestPage = ${widget.runtimeType}');

    return Scaffold(

        /// 导航栏 加高,添加背景图片
        appBar: AppBar(
          title: Text('测试函数'),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Wrap(
                children: dataList.map((e) {
              e.index = dataList.indexOf(e);
              return Cell(e);
            }).toList()),
          ),
        ));
  }

  List<CellItem> get dataList {
    return [
      CellItem(
          title: 'DateTime',
          onTap: () {
            var format = DateFormat.E('zh');

            print('time = ${format.format(DateTime.now())}');
            print(
                'DateTime.now().format() = ${DateTime.now().format(locale: 'zh')}');

            var f = NumberFormat('###.00#', 'en_US');
            print(f.format(1234567.345678));

            print(NumberFormat('###.00#', 'zh_CN').format(1234567.345678));

            var aDateTime = DateTime.now();
            DateFormat.yMMMMEEEEd().format(aDateTime);

            print(DateFormat('yyyy-MM-ddEEEEE', 'en_US').format(aDateTime));
            print(DateFormat('yyyy-MM-ddEEEEE', 'zh_CN').format(aDateTime));
          }),
    ];
  }
}
