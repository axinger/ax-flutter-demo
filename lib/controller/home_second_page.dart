import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SecondPage();
  }
}

class _SecondPage extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    /// 富文本
    return RichText(
      text: TextSpan(
        text: "        首先",
        style: TextStyle(
          fontSize: 30,
          color: Colors.red,
//        fontWeight: FontWeight.w100,
          /// 斜体
          fontStyle: FontStyle.italic,
        ),
        children: [
          TextSpan(
            text:
                "，使用Image.network命名构造函数创建Image对象时，会同时初始化实例变量image，image是一个ImageProvider对象，该ImageProvider就是我们所需要的图片的提供者，它本身是一个抽象类，子类包括NetworkImage、FileImage、ExactAssetImage、AssetImage、MemoryImage等，网络加载图片使用的就是NetworkImage。Image作为一个StatefulWidget其状态由_ImageState控制，_ImageState继承自State类，其生命周期方法包括initState()、didChangeDependencies()、build()、deactivate()、dispose()、didUpdateWidget()等。我们重点来_ImageState中函数的执行。由于插入渲染树时会先调用initState()函数，然后调用didChangeDependencies()函数，_ImageState中并没有重写initState()函数，所以didChangeDependencies()函数会执行，看下didChangeDependencies()里的内容",
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
            ),
          ),
        ],

        /*   /// 多行文字,最多行数
        maxLines: 4,

        /// 多余文字显示样式 省略...
        overflow: TextOverflow.ellipsis,*/
      ),
    );
  }
}
