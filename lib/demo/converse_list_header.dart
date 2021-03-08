import 'package:flutter/material.dart';

class ConverseListHeader extends StatelessWidget {
  ConverseListHeader({this.onPressed});

  final VoidCallback? onPressed;

  ///get 方法, 不需要() 格式
  String get showText => "当前登录";

  @override
  Widget build(BuildContext context) {
    return InkResponse(
        onTap: onPressed,
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.grey,
            border: Border(
              bottom: BorderSide(
                width: 2,
                color: Colors.green,
              ),
            ),
          ),
          child: Row(
            children: <Widget>[
              Image.asset(
                "assets/image/Icon_Mac.png",
                width: 40,
                height: 40,
                color: Colors.white,
              ),
              Container(
                width: 10,
              ),
              Text(
                this.showText,
                style: TextStyle(fontSize: 17, color: Colors.white),
              )
            ],
          ),
        ));
  }
}
