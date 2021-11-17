import 'dart:async';

import 'package:ax_flutter_util/ax_flutter_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'root_cell.dart';

class DemoGetXPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DemoGetXPageState();
  }
}

class _DemoGetXPageState extends State<DemoGetXPage> {
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
          title: Text('getX 示例'),
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
        title: ' Get.defaultDialog',
        onTap: () {
          // Get.defaultDialog(custom: Text('222'),title: 'SSS',middleText:'');
          Get.dialog(Center(child: Container(child: Text('222'),color: Colors.red,)),barrierColor:Colors.red,);
          // Get.showOverlay(asyncFunction: () {
          //
          //   return Future.value('aaa');
          // },loadingWidget: Container(color: Colors.red,child: Text('AAA'),));
          //
          // print('''object''');
        })
  ];
}}
