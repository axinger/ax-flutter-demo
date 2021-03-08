import 'package:flutter/cupertino.dart';

/// 点击空白键盘消失
class DismissContainer extends StatelessWidget {
  final Widget child;

  DismissContainer({required this.child});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      child: child,
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
    );
  }
}
