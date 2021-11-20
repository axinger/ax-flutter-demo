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
  void increase() => ++count.value;

  var count2 = 0.obs;

  ///自增
  void increase2() => ++count2.value;
}

class CounterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CounterController2>(() => CounterController2());
  }
}

/// 自己取值
// class P59CounterGetPage extends StatelessWidget {
//   // late final CounterController2 logic;
//
//   // @override
//   // void dependencies() {
//   //   // logic = Get.put<CounterController2>(CounterController2())!;
//   //   Get.lazyPut(() => CounterController2());
//   // }
//   CounterController2 get controller {
//     return Get.find<CounterController2>();
//   }
class P59CounterGetPage extends StatelessWidget {
  /// 这个方式
//   final CounterController2 controller = Get.put<CounterController2>(CounterController2())!;

  CounterController2 get controller => Get.put<CounterController2>(CounterController2());

  // late final CounterController2 logic;

  // @override
  // void dependencies() {
  //   // logic = Get.put<CounterController2>(CounterController2())!;
  //   Get.lazyPut(() => CounterController2());
  // }

  @override
  Widget build(BuildContext context) {
    /// stl是无状态组件，说明了他就不会被二次重组,
    // CounterController2 controller = Get.put<CounterController2>(CounterController2())!;

    // var logic = Get.find<CounterController2>();

    return Scaffold(
      appBar: AppBar(title: const Text('多个分别更新值')),
      body: Center(
        child: Column(
          children: [
            Text('Obx 中有一个就对应的更新一个,有多个就更新多个'),
            TextButton(
              onPressed: () => Get.back<String>(result: '返回值'),
              child: const Text('返回'),
            ),
            TextButton(
              onPressed: () => controller.increase(),
              child: const Text('count更新'),
            ),
            TextButton(
              onPressed: () => controller.increase2(),
              child: const Text('count2更新'),
            ),
            Obx(() {
              print('count更新');
              // int height = () %2 ? 40 : 80;;
              // %2 ? 40 : 80;
              double padding = (controller.count.value % 2) == 0 ? 10 : 40;
              return Container(
                color: Colors.red,
                padding: EdgeInsets.all(padding),
                child: Text('count ${controller.count.value}', style: TextStyle(backgroundColor: Colors.orange, fontSize: 30.0)),
              );
            }),
            Obx(() {
              print('count2更新');
              return Text('count2 ${controller.count2.value}', style: TextStyle(fontSize: 30.0));
            }),
            Obx(() {
              print('count 和 count2');
              return Text('count 和 count2 ${controller.count.value} ${controller.count2.value}', style: TextStyle(fontSize: 30.0));
            }),
          ],
        ),
      ),
    );
  }
}
