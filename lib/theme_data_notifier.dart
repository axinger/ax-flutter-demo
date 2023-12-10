import 'package:flutter/material.dart';

class ThemeDataNotifier extends ChangeNotifier {
  ThemeData _themeData = ThemeData(
    /**
     * primarySwatch不是Color.这是MaterialColor.
        这意味着它是材质应用程序将使用的颜色的不同色调.
        primaryColor是其中一种阴影.确切地说,primaryColor通常等于primarySwatch [500].
        通常最好定义primarySwatch而不是primaryColor.因为某些材质组件可能会使用不同的primaryColor阴影来处理阴影,边框等
     */
    primaryColor: Colors.lightBlue,

    textTheme: TextTheme(),

    /// 主要样品颜色 是 MaterialColor
//        primarySwatch: Colors.lightBlue,
    highlightColor: Colors.grey,
//bottomAppBarColor: Colors.orange,
//        splashColor: Colors.orange,

    appBarTheme: AppBarTheme(
      ///导航按钮颜色
      iconTheme: IconThemeData(color: Colors.white),
    ),

    /// 容器默认背景色
//        scaffoldBackgroundColor: ColorScheme().background,
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.orange,
    ),
  );

  ThemeData get themeData {
    return _themeData;
  }

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }
}
