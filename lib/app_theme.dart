import 'package:flutter/material.dart';

class AppTheme {
  // 1.抽取相同的样式
  static const double _titleFontSize = 20;

  static Color _foregroundColor(Set<MaterialState> states) {
//      const Set<MaterialState> interactiveStates = <MaterialState>{
//        ///按下
//        MaterialState.pressed,
//        ///徘徊 应该是长按
//        MaterialState.hovered,
//        /// 集中
//        MaterialState.focused,
//        MaterialState.selected,
//      };
//
//      if (states == MaterialState.pressed) {
//        return Colors.orange;
//      }
//      if (states == MaterialState.hovered) {
//        return Colors.orange;
//      }
//      if (states == MaterialState.selected) {
//        return Colors.purple;
//      }
//      if (states.any(interactiveStates.contains)) {
//        return Colors.blue;
//      }
//      return Colors.red;
    if (states.contains(MaterialState.focused) && !states.contains(MaterialState.pressed)) {
      ///获取焦点时的颜色
      return Colors.blue;
    } else if (states.contains(MaterialState.pressed)) {
      ///按下时的颜色
      return Colors.lightBlueAccent;
    } else if (states.contains(MaterialState.disabled)) {
      return Colors.grey;
    } else if (states.contains(MaterialState.selected)) {
      return Colors.purple;
    } else {
      return Colors.red;
    }
  }

  /// 2.亮色主题
  static ThemeData lightTheme({ThemeData? themeData}) {
    // return ThemeData.dark();
    return ThemeData().copyWith(
      primaryColor: themeData?.primaryColor ?? Colors.red,
//        backgroundColor: Colors.lightBlue,
//        scaffoldBackgroundColor: Colors.lightBlueAccent,
      buttonTheme: ButtonThemeData(
        buttonColor: Colors.orange,
      ),

      /// TextButton 主题
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          /// foregroundColor 文字颜色
//                  foregroundColor: MaterialStateColor.resolveWith(getColor),
          /// 这里可以控制不同状态颜色
          foregroundColor: MaterialStateColor.resolveWith(_foregroundColor),

          /// all 所有状态颜色
          // foregroundColor:MaterialStateProperty.all(Colors.red),
          /// 这里设置文字颜色无效
          textStyle: MaterialStateProperty.all(TextStyle(color: Colors.white, fontSize: 16)),
          // minimumSize: MaterialStateProperty.all(Size(100, 30)),
          /// 如何去掉边距(padding)
          // minimumSize: MaterialStateProperty.all(Size(0, 0)),
          // padding: MaterialStateProperty.all(EdgeInsets.zero),
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            //设置按下时的背景颜色
            if (states.contains(MaterialState.pressed)) {
              return Colors.blue[200];
            } else if (states.contains(MaterialState.disabled)) {
              return Colors.greenAccent;
            } else {
              ///默认背景颜色
              return Colors.orange;
            }
          }),
        ),
      ),
    );
  }

  // 3.暗黑主题
  static final ThemeData darkTheme = ThemeData.dark().copyWith();
}
