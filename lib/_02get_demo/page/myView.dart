import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyView extends StatelessWidget {
  const MyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("我的"),
      ),
      body: ListTile(
        title: Text("进入这里表示已经登录过了"),
        subtitle: Text('ListTile 样式的有主副标题'),
        onTap: () => Get.back(),
      ),
    );
  }
}
