import 'package:get/get.dart';

class OrderDetailModel {
  OrderDetailModel() {}

  OrderDetailModel.fromJson(dynamic json) {
    price = json['price'];
    name = json['name'];
    age = (json['age'] as int).obs;
  }

  double price = 0.0;
  String name = '';
  RxInt age = 0.obs;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['price'] = price;
    map['name'] = name;
    map['age'] = age.value;
    return map;
  }
}

class OrderDetailController extends GetxController {
  late var model = OrderDetailModel().obs;

  get price => model().price.obs;

  @override
  void onInit() {
    super.onInit();

    ever(model().age, (_) => print("$_ has been changed"));

    /// 每次更改都会回调
    ever(model().price.obs, (_) => print("$_ has been changed"));

    /// 第一次更改回调
    once(model().price.obs, (_) => print("$_ was changed once"));

    /// 更改后3秒回调
    debounce(model().price.obs, (_) => print("debouce$_"), time: Duration(seconds: 3));

    ///3秒内更新回调一次
    interval(model().price.obs, (_) => print("interval $_"), time: Duration(seconds: 3));

    String id = Get.arguments['id'];

    orderDetailData(id: id);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void orderDetailData({required String id}) {
    Future.delayed(Duration(seconds: 1));
    Map<String, dynamic> map = {'price': 0.1, 'name': 'apple', 'age': -1};
    model = OrderDetailModel.fromJson(map).obs;
  }

  void addPrice() {
    model.value.price++;
    print('model().price = ${model().price}');
    update();
  }

  void addPrice2() {
    model().price++;
    print('model().price = ${model().price}');
    update(['price']);
  }

  void addAge() {
    // model().age!.value++;
    model().age++;
  }
}
