import 'package:ax_flutter_demo/_02get_demo/page/01son_page.dart';
import 'package:ax_flutter_demo/_02get_demo/page/father_son_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class FatherPage extends GetView<FatherSonController> {
  @override
  Widget build(BuildContext context) {
    /// 使用Get.put()实例化你的类，使其对当下的所有子路由可用。
    /// 定义在这里,为了 每次进入本页面都是新的,配合 StatelessWidget 使用
    // final FatherSonController controller = Get.put(FatherSonController());
    /// 注入 配合  GetView使用
    // Get.lazyPut(() => FatherSonController());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text('父页面,父子分别注入同一个类,为同一实例')),
      body: Center(
        child: Column(
          children: [
            Obx(
              () => Text('跨页面-Two点击了 ${controller.count.value} 次',
                  style: TextStyle(fontSize: 30.0)),
            ),
            TextButton(onPressed: controller.toJumpTwo, child: Text('进入子页面')),
          ],
        ),
      ),
    );
  }
}

class FatherBuilderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<FatherSonController>(
        init: FatherSonController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(title: Text('父页面,父子分别注入同一个类,为同一实例')),
            body: Center(
              child: Column(
                children: [
                  Obx(
                    () => Text('跨页面-Two点击了 ${controller.count.value} 次',
                        style: TextStyle(fontSize: 30.0)),
                  ),
                  Obx(
                    () => Column(children: [
                      Text('user age ${controller.user().age} ',
                          style: TextStyle(fontSize: 30.0)),
                      Text('user name ${controller.user().name} ',
                          style: TextStyle(fontSize: 30.0))
                    ],),
                  ),
                  TextButton(
                      onPressed: () {
                        Get.to(SonBuilderPage());
                      },
                      child: Text('进入子页面')),
                ],
              ),
            ),
          );
        });
  }
}

class FatherBuilderPage2 extends GetView<FatherSonController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<FatherSonController>(
        init: FatherSonController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(title: Text('父页面,父子分别注入同一个类,为同一实例')),
            body: Center(
              child: Column(
                children: [
                  Obx(
                    () => Text('跨页面-Two点击了 ${controller.count.value} 次',
                        style: TextStyle(fontSize: 30.0)),
                  ),
                  TextButton(
                      onPressed: () {
                        Get.to(SonBuilderPage());
                      },
                      child: Text('进入子页面')),
                ],
              ),
            ),
          );
        });
  }
}
