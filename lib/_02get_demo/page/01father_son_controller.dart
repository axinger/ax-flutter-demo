import 'package:ax_flutter_demo/_02get_demo/page/01father_son_binding.dart';
import 'package:ax_flutter_demo/_02get_demo/page/01son_page.dart';
import 'package:get/get.dart';

// model
// 我们将使整个类成为可观察的，而不是每个属性。
class User {
  User({this.name = '', this.age = 0});

  String name;
  int age;
}

class FatherSonController extends GetxController {
  var count = 0.obs;

  @override
  void onInit() {
    super.onInit();

    /// 每次更改都会回调
    ever(count, (_) => print("$_ has been changed 1"));
  }

  ///跳转到跨页面
  void toJumpTwo() {
    // Get.toNamed(RouteConfig.jumpTwo);
    Get.to(() => SonPage(), binding: FatherSonBinding());
    // Get.to(() => SonPage());
  }

  ///跳转到跨页面
  void increase() {
    // count.value++;
    count++;
  }

  void increase2() {
    ++count;
    update();
  }

  // controller
  final user = User(name: 'jim').obs;

  void set updateUserAge(age) {
    //当你需要更新user变量时。
    user.update((user) {
      // 这个参数是你要更新的类本身。
      user!.age++;
    });

    // 更新user变量的另一种方式。
    // user(User(age: 35));
  }

// view
//   Obx(()=> Text("Name ${user.value.name}: Age: ${user.value.age}"));
// // 你也可以不使用.value来访问模型值。
//   user().name; // 注意是user变量，而不是类变量（首字母是小写的）。

}
