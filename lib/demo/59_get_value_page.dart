import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CounterController2 {
  /** obs; 就是 这样格式
   * var count = 0;

      void increase() {
      ++count;
      update();
      // 需要 extends GetxController
      }
   */

  var count = 0.obs;

  ///自增
  void increase() => ++count;

  var count2 = 0.obs;

  ///自增
  void increase2() => ++count2;
}

class P59CounterGetPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var logic = Get.put<CounterController2>(CounterController2());
    return Scaffold(
      appBar: AppBar(title: const Text('多个分别更新值')),
      body: Center(
        child: Column(
          children: [
            Text('Obx 中有一个就对应的更新一个,有多个就更新多个'),
            TextButton(
              onPressed: () => logic?.increase(),
              child: const Text('count更新'),
            ),
            TextButton(
              onPressed: () => logic?.increase2(),
              child: const Text('count2更新'),
            ),
            Obx(() {
              print('count更新');
            // int height = () %2 ? 40 : 80;;
              // %2 ? 40 : 80;
              double padding =(logic?.count.value ?? 0 %2)==0 ? 10 : 40;
              return Container(
                color: Colors.red,
                padding: EdgeInsets.all(padding),
                child: Text('count ${logic?.count.value}',
                    style: TextStyle(backgroundColor: Colors.orange,fontSize: 30.0)),
              );
            }),
            Obx(() {
              print('count2更新');
              return Text('count2 ${logic?.count2.value}',
                  style: TextStyle(fontSize: 30.0));
            }),

            Obx(() {
              print('count 和 count2');
              return Text('count 和 count2 ${logic?.count.value} ${logic?.count2.value}',
                  style: TextStyle(fontSize: 30.0));
            }),
          ],
        ),
      ),
    );
  }
}

