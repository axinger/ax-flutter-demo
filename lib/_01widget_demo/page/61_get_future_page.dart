import 'package:ax_flutter_util/ax_flutter_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class _CounterController extends GetxController {
  var dataList = [].obs;

  ///自增
  Future increase() {
    return Future.delayed(Duration(seconds: 1)).then((value) {
      dataList.add(20.random);
    });
  }
}

class P61CounterGetPage extends StatelessWidget {
  _CounterController get controller =>
      Get.put<_CounterController>(_CounterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text('get Future和 长按拖动')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.increase();
        },
        child: const Icon(Icons.add),
      ),
      body: Obx(() {
        return ReorderableListView.builder(
            header: Text('头视图'),
            itemBuilder: (BuildContext context, int index) {
              return Container(
                key: ValueKey('custom key $index'),
                color: Colors.orange,
                height: 50, //高必须设置，否则长按排序页面会有错乱问题
                child: Text("内容 = ${controller.dataList[index]}"),
              );
            },
            itemCount: controller.dataList.length,
            onReorder: (int oldIndex, int newIndex) {
              if (oldIndex < newIndex) {
                newIndex -= 1;
              }
              var child = controller.dataList.removeAt(oldIndex);
              controller.dataList.insert(newIndex, child);
              print('controller.dataList = ${controller.dataList}');
            });
      }),
    );
  }
}
