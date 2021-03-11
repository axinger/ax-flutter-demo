import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ax_flutter_util/ax_flutter_util.dart';

class CounterController1 extends GetxController {
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

// @override
// void onInit() {
//   super.onInit();
//   print('SimpleController--onInit');
// }
//
// @override
// void onReady() {
//   super.onReady();
//   print('SimpleController--onReady');
// }
//
// @override
// void onClose() {
//   super.onClose();
//   print('SimpleController--onClose');
// }
}

class CounterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CounterController1>(() => CounterController1());
  }
}

/// 自己取值
// class P59CounterGetPage extends StatelessWidget {
//   // late final CounterController1 logic;
//
//   // @override
//   // void dependencies() {
//   //   // logic = Get.put<CounterController1>(CounterController1())!;
//   //   Get.lazyPut(() => CounterController1());
//   // }
//   CounterController1 get controller {
//     return Get.find<CounterController1>();
//   }
class P59CounterGetPage extends StatelessWidget {
  /// 这个方式
//   final CounterController1 controller = Get.put<CounterController1>(CounterController1())!;

  CounterController1 get controller =>
      Get.put<CounterController1>(CounterController1())!;

  // late final CounterController1 logic;

  // @override
  // void dependencies() {
  //   // logic = Get.put<CounterController1>(CounterController1())!;
  //   Get.lazyPut(() => CounterController1());
  // }

  @override
  Widget build(BuildContext context) {
    /// stl是无状态组件，说明了他就不会被二次重组,
    // CounterController1 controller = Get.put<CounterController1>(CounterController1())!;

    // var logic = Get.find<CounterController1>();

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
                child: Text('count ${controller.count.value}',
                    style: TextStyle(
                        backgroundColor: Colors.orange, fontSize: 30.0)),
              );
            }),
            Obx(() {
              print('count2更新');
              return Text('count2 ${controller.count2.value}',
                  style: TextStyle(fontSize: 30.0));
            }),
            Obx(() {
              print('count 和 count2');
              return Text(
                  'count 和 count2 ${controller.count.value} ${controller.count2.value}',
                  style: TextStyle(fontSize: 30.0));
            }),
          ],
        ),
      ),
    );
  }
}

class CounterController2 extends GetxController {
  var count = 0.obs;

  ///自增
  void increase() => ++count;

  var count2 = 0.obs;

  ///自增
  void increase2() => ++count2;
}

class P59CounterGetPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('GetBuilder')),
      body: GetBuilder<CounterController2>(
        init: CounterController2(),
        builder: (controller) {
          return Center(
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
                    child: Text('count ${controller.count.value}',
                        style: TextStyle(
                            backgroundColor: Colors.orange, fontSize: 30.0)),
                  );
                }),
                Obx(() {
                  print('count2更新');
                  return Text('count2 ${controller.count2.value}',
                      style: TextStyle(fontSize: 30.0));
                }),
                Obx(() {
                  print('count 和 count2');
                  return Text(
                      'count 和 count2 ${controller.count.value} ${controller.count2.value}',
                      style: TextStyle(fontSize: 30.0));
                }),
              ],
            ),
          );
        },
      ),
    );
  }
}

class SimpleAdvancedController extends GetxController {
  int _counter = 0;

  int get counter => _counter;

  String _name = "Lili";

  String get firstName => _name;

  void increment() {
    _counter++;
    _name = 10.random.toString();
    update(['counter']);
  }

  void changeName() {
    _counter++;
    _name = (10.random + 10).toString();
    ;
    update(['name']);
  }
}

class P59CounterGetPage3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(SimpleAdvancedController());

    return Scaffold(
      appBar: AppBar(title: const Text('GetBuilder,同一个数据')),
      body: Center(
        child: Column(
          children: [
            TextButton(
              onPressed: () => Get.find<SimpleAdvancedController>().increment(),
              child: const Text('count更新'),
            ),
            TextButton(
              onPressed: () =>
                  Get.find<SimpleAdvancedController>().changeName(),
              child: const Text('count更新'),
            ),
            GetBuilder<SimpleAdvancedController>(
              // init: SimpleAdvancedController(),
              id: 'counter',
              builder: (ctl) => Text(ctl.counter.toString()),
            ),
            SizedBox(
              height: 50,
            ),
            GetBuilder<SimpleAdvancedController>(
              id: 'name',
              builder: (ctl) => Text(ctl.counter.toString()),
            ),
          ],
        ),
      ),
    );
  }
}
