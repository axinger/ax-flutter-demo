import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '03order_detail_controller.dart';

class OrderDetailView extends GetView<OrderDetailController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text('订单详情')),
      body: Center(
        child: Column(
          children: [
            Obx(
              () => Text('名称 ${controller.model().name} ', style: TextStyle(fontSize: 20.0)),
            ),
            Obx(
              () => Text('价格 ${controller.model().price} ', style: TextStyle(fontSize: 20.0)),
            ),
            Obx(
                  () => Text('age: ${controller.model().age} ', style: TextStyle(fontSize: 20.0)),
            ),
            Obx(
                  () => Text('controller = 价格 ${controller.price} ', style: TextStyle(fontSize: 20.0)),
            ),

            Divider(color: Colors.red,),
            GetBuilder<OrderDetailController>(builder: (_) {
              print('名称 GetBuilder 更新========');
              return Center(child: Text('GetBuilder名称: ${controller.model().name}'));
            }),

            GetBuilder<OrderDetailController>(id:'price',builder: (_) {
              print('价格 GetBuilder 更新========');
              return Center(child: Text('GetBuilder价格: ${controller.model().price}'));
            }),

            Divider(color: Colors.red,),
            ElevatedButton(onPressed: controller.addPrice, child: Text('addPrice')),
            ElevatedButton(
              onPressed: () {
                controller.addPrice2();
              },
              child: Text('addPrice2'),
            ),

            ElevatedButton(onPressed: controller.addAge, child: Text('addAge')),
          ],
        ),
      ),
    );
  }
}
