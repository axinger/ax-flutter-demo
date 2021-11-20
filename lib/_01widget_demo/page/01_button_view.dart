import 'package:flutter/material.dart';

class DemoButton extends StatefulWidget {
  const DemoButton({Key? key}) : super(key: key);

  @override
  _DemoButtonState createState() => _DemoButtonState();
}

class _DemoButtonState extends State<DemoButton> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Button,初始化上有点区别,本质没有区别'),
      ),
      body: SingleChildScrollView(
          child: Container(
        color: Colors.greenAccent,
        alignment: Alignment.center,
        child: Column(
          // mainAxisSize: MainAxisSize.max,
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Container alignment:Alignment.center 内容居中'),
            TextButton(
              onPressed: () {},
              child: Text(
                'TextButton',
                style: TextStyle(fontSize: 14.0, color: Colors.white),
              ),
              // style: ButtonStyle(
              //
              // ),

              /// 去除内置padding
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.orange),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                minimumSize: MaterialStateProperty.all(Size(0, 0)),
                padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 10, horizontal: 40)),
              ),

              // style: ButtonStyle(
              //   backgroundColor: MaterialStateProperty.resolveWith((states) {
              //     //设置按下时的背景颜色
              //     if (states.contains(MaterialState.pressed)) {
              //       return Colors.blue;
              //     } else if (states.contains(MaterialState.disabled)) {
              //       return Colors.greenAccent;
              //     } else {
              //       ///默认背景颜色
              //       return Colors.orange;
              //     }
              //   }),
              // ),
            ),
            Divider(color: Colors.red),
            Text('ElevatedButton 含有阴影'),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.orange),
              ),
              onPressed: () {},
              child: Text('ElevatedButton'),
            ),
            Divider(color: Colors.red),
            Text('MaterialButton'),
            MaterialButton(
              child: Text(
                'MaterialButton',
                style: TextStyle(fontSize: 14.0, color: Colors.red),
              ),
              onPressed: () {},
            ),
            Divider(color: Colors.red),
            Text('IconButton,自动剪切正方形'),
            IconButton(
              onPressed: () {},
              icon: Text('IconButton'),
              iconSize: 40,
            ),
            Divider(color: Colors.red),
            OutlinedButton(onPressed: () {}, child: Text('OutlinedButton')),
          ],
        ),
      )),
    );
  }
}
