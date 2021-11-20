import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DemoLocalPage extends StatelessWidget {
  const DemoLocalPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('国际化'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('hello'.tr, style: TextStyle(color: Colors.pink, fontSize: 30)),
            Text('ElevatedButton ,TextButton 区别 '),
            ElevatedButton(
                onPressed: () {
                  var locale = Locale('zh', 'CN');
                  Get.updateLocale(locale);
                },
                child: Text("切换到中文")),
            SizedBox(
              height: 20,
            ),
            TextButton(
              onPressed: () {
                var locale = Locale('en', 'US');
                Get.updateLocale(locale);
              },
              child: Text("切换到英文"),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.orange),

                /// 这个设置字体颜色无效
                textStyle: MaterialStateProperty.all(TextStyle(fontSize: 30)),
                foregroundColor: MaterialStateProperty.all(Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
