import 'package:ax_flutter_demo/_02get_demo/page/01father_son_controller.dart';
import 'package:get/get.dart';

class FatherSonBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FatherSonController>(() => FatherSonController());
  }
}
