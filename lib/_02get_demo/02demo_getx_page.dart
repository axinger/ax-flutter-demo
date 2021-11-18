import 'dart:async';

import 'package:ax_flutter_demo/_02get_demo/page/01father_page.dart';
import 'package:ax_flutter_demo/_02get_demo/page/02demo_local_page.dart';
import 'package:ax_flutter_demo/_02get_demo/page/father_son_binding.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../_01root/root_cell.dart';

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
        title: '查看 实例 类型',
        onTap: () {
          print('String runtimeType  = ${'jim'.runtimeType}');
        },
      ),
      CellItem(
        title: ' Get.defaultDialog',
        onTap: () {
          // Get.defaultDialog(custom: Text('222'),title: 'SSS',middleText:'');
          Get.dialog(
            Center(
                child: Container(
              child: Text('222'),
              color: Colors.red,
            )),
            barrierColor: Colors.red,
          );
          // Get.showOverlay(asyncFunction: () {
          //
          //   return Future.value('aaa');
          // },loadingWidget: Container(color: Colors.red,child: Text('AAA'),));
          //
          // print('''object''');
        },
      ),
      CellItem(
        title: '父子页面,更新值,FatherPage 继承GetView ',
        onTap: () {
          Get.to(() => FatherPage());

          /// 当前页面消失了,Controller也会消失,但是路由跳转有点耦合
          // Get.to(FatherPage(),binding: FatherSonBinding());
        },
      ),
      CellItem(
        title: '父子页面,使用 GetBuilder',
        onTap: () {
          Get.to(() => FatherBuilderPage());
        },
      ),
      CellItem(
        title: '父子页面,使用 GetBuilder',
        onTap: () {
          Get.to(() => FatherBuilderPage2());
        },
      ),
      CellItem(
        title: 'GetUtils - 打印区别',
        onTap: () {
          // printInfo(info: '是否数组',printFunction: (){
          // return  GetUtils.isNum('aaa');
          // });
          print('aaaa');
          Get.log('aaaa', isError: true);
        },
      ),
      CellItem(
        title: 'GetUtils - is',
        onTap: () {
          Get.log('是否数字 = ${GetUtils.isNum('aaa')}');
          Get.log('是否数字 = ${GetUtils.isNum('123.23')}');
          Get.log('isNumericOnly = ${GetUtils.isNumericOnly('123.23')}');

          /// 是否正整数
          Get.log('isNumericOnly = ${GetUtils.isNumericOnly('123')}');
          Get.log('isNumericOnly = ${GetUtils.isNumericOnly('-123')}');
          Get.log('isBool = ${GetUtils.isBool('2')}');
          Get.log('isBool = ${GetUtils.isBool('1')}');
          Get.log('isBool = ${GetUtils.isBool('false')}');
          Get.log('isBool = ${GetUtils.isBool('true')}');
          Get.log('isNull = ${GetUtils.isNull(null)}');
          Get.log('isNull = ${GetUtils.isNull('null')}');
          Get.log('isBlank = ${GetUtils.isBlank('')}');
          Get.log('isBlank = ${GetUtils.isBlank('1')}');
        },
      ),

      CellItem(
        title: '国际化',
        onTap: () {
          Get.to(DemoLocalPage());
        },
      ),
    ];
  }
}
