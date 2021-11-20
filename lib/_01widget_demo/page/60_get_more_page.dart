import 'package:flutter/material.dart';
import 'package:get/get.dart';

class JumpOneLogic extends GetxController {
  var count = 0.obs;

  ///跳转到跨页面
  void toJumpTwo() {
    // Get.toNamed(RouteConfig.jumpTwo);
    Get.to(JumpTwoPage());
  }

  ///跳转到跨页面
  void increase() => count.value++;
}

class P60JumpOnePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /// 使用Get.put()实例化你的类，使其对当下的所有子路由可用。
    JumpOneLogic logic = Get.put(JumpOneLogic());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text('跨页面-One')),
      floatingActionButton: FloatingActionButton(
        onPressed: () => logic.toJumpTwo(),
        child: const Icon(Icons.arrow_forward_outlined),
      ),
      body: Center(
        child: Obx(
          () => Text('跨页面-Two点击了 ${logic.count.value} 次', style: TextStyle(fontSize: 30.0)),
        ),
      ),
    );
  }
}

class JumpTwoPage extends StatelessWidget {
  final JumpOneLogic oneLogic = Get.find();
  final JumpOneLogic twoLogic = Get.put<JumpOneLogic>(JumpOneLogic());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text('跨页面-Two')),
      body: Column(
        children: [
          TextButton(
              onPressed: () {
                oneLogic.increase();
              },
              child: Text('父 ++')),
          TextButton(
              onPressed: () {
                twoLogic.increase();
              },
              child: Text('子 ++')),
          Obx(
            () => Text('跨页面-Two点击了 ${oneLogic.count.value} 次', style: TextStyle(fontSize: 30.0)),
          ),
          Obx(
            () => Text('跨页面-Two点击了 ${twoLogic.count.value} 次', style: TextStyle(fontSize: 30.0)),
          )
        ],
      ),
    );
  }
}
