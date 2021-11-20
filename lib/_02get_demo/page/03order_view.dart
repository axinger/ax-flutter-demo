import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '03order_controller.dart';

class OrderView extends GetView<OrderController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text('订单页面')),
      body: Center(
        child: Column(
          children: [
            Divider(color: Colors.red),
            ElevatedButton(onPressed: controller.to, child: Text('进入订单详情')),
          ],
        ),
      ),
    );
  }
}
