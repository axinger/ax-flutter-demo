import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyIcons {
  static const String fontFamily = 'myIcon';

  /// 指纹
  static const IconData touchID = const IconData(0xe64c,
      fontFamily: fontFamily,

      ///匹配文本的方向
      matchTextDirection: true);

  /// ！
  static const IconData notice = const IconData(0xe605, fontFamily: fontFamily, matchTextDirection: false);

  /// 日历
  static const IconData calendar = const IconData(0xe613,
      fontFamily: fontFamily,

      ///匹配文本的方向
      matchTextDirection: true);
}
