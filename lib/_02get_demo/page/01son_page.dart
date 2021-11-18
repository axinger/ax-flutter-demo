import 'package:ax_flutter_demo/_02get_demo/page/father_son_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class SonPage extends GetView<FatherSonController> {
  // final FatherSonController controller = Get.find<FatherSonController>();

  @override
  Widget build(BuildContext context) {
    /// 第二个,检查是否和第一个为统一实例
    final FatherSonController controller2 = Get.put(FatherSonController());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text('子页面')),
      body: Center(
        child: Column(
          children: [
            Obx(
              () => Text('父controller ${controller.count.value} ',
                  style: TextStyle(fontSize: 30.0)),
            ),
            Obx(
              () => Text('子controller2 ${controller2.count.value} ',
                  style: TextStyle(fontSize: 30.0)),
            ),
            TextButton(
                onPressed: controller.increase, child: Text('父controller ++ ')),
            TextButton(
                onPressed: () {
                  controller2.increase();
                },
                child: Text('子controller ++ '))
          ],
        ),
      ),
    );
  }
}

class SonBuilderPage extends StatelessWidget {
  /// 第二个,检查是否和第一个为统一实例
  final FatherSonController controller2 = Get.put(FatherSonController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FatherSonController>(
        init: FatherSonController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(title: Text('子页面')),
            body: Center(
              child: Column(
                children: [
                  Obx(
                    () => Text('父controller ${controller.count.value} ',
                        style: TextStyle(fontSize: 30.0)),
                  ),
                  Obx(
                    () => Text('子controller2 ${controller2.count.value} ',
                        style: TextStyle(fontSize: 30.0)),
                  ),
                  TextButton(
                      onPressed: controller.increase,
                      child: Text('父controller ++ ')),
                  TextButton(
                      onPressed: () {
                        controller2.increase();
                      },
                      child: Text('子controller ++ ')),
                  Obx(
                    () => Text('user ${controller.user().age} ',
                        style: TextStyle(fontSize: 30.0)),
                  ),
                  TextButton(
                      onPressed: () {
                        // controller.user().age++;

                        controller.updateUserAge = 10;
                      },
                      child: Text('子controller user ')),
                ],
              ),
            ),
          );
        });
  }
}
