import 'package:flutter/material.dart';

class P63BottomUpPage extends StatefulWidget {
  const P63BottomUpPage({Key? key}) : super(key: key);

  @override
  _P63BottomUpPageState createState() => _P63BottomUpPageState();
}

extension ColorExtension on Color {
  static Color? fromHex(String? hexString) {
    if (hexString == null) {
      return null;
    }

    hexString = hexString.trim();
    if (hexString.length == 4) {
      // convert for example #f00 to #ff0000
      hexString = "#" + (hexString[1] * 2) + (hexString[2] * 2) + (hexString[3] * 2);
    }
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}

class _P63BottomUpPageState extends State<P63BottomUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('底部跟随键盘弹起')),
      // resizeToAvoidBottomInset: true,
      body: Column(
        children: [
          Text('文本框'),
          TextField(),
        ],
      ),
      bottomSheet: Container(
        color: Colors.red,
        child: Text('3333333'),
        height: 60,
        width: double.infinity,
      ),
    );
  }
}
