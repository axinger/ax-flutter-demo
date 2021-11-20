import 'package:ax_flutter_demo/_02get_demo/route/route_pages.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  late var model;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    print('Get.arguments = ${Get.arguments}');
  }

  @override
  void onClose() {}

  void to() {
    Get.toNamed(AppRoutes.orderDetail, arguments: {'id': '1'});
  }
}
