import 'dart:async';

import 'package:ax_flutter_demo/_02get_demo/page/01father_page.dart';
import 'package:ax_flutter_demo/_02get_demo/page/02demo_local_page.dart';
import 'package:ax_flutter_demo/_02get_demo/page/02route_view.dart';
import 'package:ax_flutter_demo/_02get_demo/route/route_pages.dart';
import 'package:ax_flutter_demo/model/user_info.dart';
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
  var _string = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        title: 'Get.snackbar 通知栏样式',
        onTap: () {
          Get.snackbar('Hi', 'i am a modern snackbar');
        },
      ),
      CellItem(
        title: 'Get.context',
        onTap: () {
          Get.log('context = ${Get.context}', isError: true);
          Get.log('currentRoute = ${Get.currentRoute}');
          Get.log('overlayContext = ${Get.overlayContext}');
        },
      ),

      CellItem(
        title: 'Get.rawSnackbar 安卓样式的底部通知栏',
        onTap: () {
          // Get.rawSnackbar(title: 'title', message: 'message', icon: Icon(Icons.check_box));
          Get.rawSnackbar(titleText: Text('安卓样式的底部通知栏', style: TextStyle(color: Colors.red)), messageText: Container());
        },
      ),

      CellItem(
        title: 'Get.defaultDialog',
        onTap: () {
          Get.defaultDialog(
              title: 'title',
              middleText: 'middleText',
              content: Text('AAA'),
              textConfirm: '知道了',
              backgroundColor: Colors.green,
              onConfirm: () {
                Get.back();
              },
              buttonColor: Colors.green,
              confirmTextColor: Colors.black);
        },
      ),
      CellItem(
        title: '打开自定义的Dialog：',
        onTap: () {
          Get.dialog(Center(
            child: Container(
              width: 400,
              height: 400,

              /// 内容自适应,很重要
              alignment: Alignment.center,
              color: Colors.red,
              child: ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                child: Text('知道了'),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.orange),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  // maximumSize: MaterialStateProperty.all(Size(100, 50)),
                  padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 10, horizontal: 40)),
                ),
              ),
            ),
          ));
        },
      ),

      CellItem(
        title: 'Get.bottomSheet类似于showModalBottomSheet',
        onTap: () {
          Get.bottomSheet(Container(
            color: Colors.green,

            /// Wrap 类似最小的column
            child: Wrap(
              children: <Widget>[
                ListTile(leading: Icon(Icons.music_note), title: Text('Music'), onTap: () => {}),
                ListTile(
                  leading: Icon(Icons.videocam),
                  title: Text('Video'),
                  onTap: () => {},
                ),
              ],
            ),
          ));
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

      /// https://www.jianshu.com/p/920db9e968f0
      CellItem(
        title: '路由-方式1,最好用 arguments 方式传参',
        onTap: () {
          Get.to(() => RouteDemo(), arguments: {'name': 'jim'});
        },
      ),
      CellItem(
        title: '路由-方式2 parameters 只能是Map<String, String>? ',
        onTap: () {
          Get.toNamed(AppRoutes.route_pages, arguments: {'name': 'jack'}, parameters: {'age': 'tom'});
        },
      ),
      CellItem(
        title: '路由-路径,可以解析出非string类型数据',
        onTap: () {
          Get.toNamed("/route_pages?device=phone&id=354&name=Enzo");
        },
      ),

      CellItem(
        title: '登录',
        onTap: () {
          UserInfo.instance.isLogin = true;
          Get.defaultDialog(title: '登录成功', middleText: '');
        },
      ),

      CellItem(
        title: '登出',
        onTap: () {
          UserInfo.instance.isLogin = false;
          Get.rawSnackbar(title: '登出成功', message: '2');
        },
      ),

      CellItem(
        title: '导航-中间件-认证Auth',
        onTap: () {
          Get.toNamed(AppRoutes.My);
        },
      ),
      CellItem(
        title: '模拟订单和订单详情',
        onTap: () {
          Get.toNamed(AppRoutes.order);
        },
      ),

      // CellItem(
      //   title: '多线程',
      //   onTap: () {
      //
      //     print('开始：$_string');
      //     Future future = Future(() {
      //       for (int i = 0; i < 1000; i++) {
      //         _string = '$i';
      //       }
      //     });
      //     future.then((value) {
      //       print('then方法: $_string, value: $value');
      //     });
      //     print('结束：$_string');
      //   },
      // ),
      CellItem(
        title: '多线程-2',
        onTap: () async {
          _string = 1000;

          print('开始：$_string');

          for (int i = 1; i <= 1000; i++) {
            Future(() {
              _string--;
              print('_string = $_string');
            });
          }
          print('结束：$_string');
        },
      ),
    ];
  }
}
