import 'package:ax_flutter_demo/controller/history_page.dart';
import 'package:ax_flutter_demo/controller/home_page.dart';
import 'package:ax_flutter_demo/controller/mine_page.dart';
import 'package:ax_flutter_demo/global_const.dart';
import 'package:ax_flutter_demo/showpage/00-test_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyBottomItem {
  MyBottomItem({
    String title,
    Icon icon,
    Widget activeIcon,
    Widget content,
  })  : this.content = content,
        this.barItem = BottomNavigationBarItem(
          icon: icon,
          title: Text(
            title,
//            style: TextStyle(fontSize: 14),
          ),
//          title: Padding(child: Text(title,style: TextStyle(fontSize: 16),),padding: EdgeInsets.only(top: 20),),
//          backgroundColor: Colors.white,
        );
  final BottomNavigationBarItem barItem;
  final Widget content;
}

/// 需要配合使用 iOS风格push
//Navigator.of(context,rootNavigator: true).push(
//CupertinoPageRoute(
//builder: (BuildContext context) {
//return widget;
//}
//)
//);

// ignore: must_be_immutable
class RootTabBar extends StatelessWidget {
  List<MyBottomItem> _bottomItemList = <MyBottomItem>[
    MyBottomItem(
      title: localString.honeTitle,
      icon: Icon(Icons.home),
      activeIcon: Icon(Icons.home),
      content: HomePage(),
    ),
    MyBottomItem(
      title: "记录",
      icon: Icon(Icons.history),
      content: HistoryPage(),
    ),
    MyBottomItem(
      title: "我的",
      icon: Icon(Icons.person),
      activeIcon: Icon(Icons.person),
      content: MinePage(),
    ),
    MyBottomItem(
      title: "测试",
      icon: Icon(Icons.desktop_mac),
      content: ShowTestPage(),
    ),
  ];

  CupertinoTabController tabController =
      CupertinoTabController(initialIndex: 3);

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
        controller: tabController,
        tabBar: CupertinoTabBar(
          ///活动颜色
          activeColor: Colors.redAccent,

          /// 不活动颜色
          inactiveColor: Colors.white,

          /// 背景色
          backgroundColor: Colors.lightBlue,
//          iconSize:40,

          items: _bottomItemList.map((value) {
            return value.barItem;
          }).toList(),
        ),
        tabBuilder: (context, index) {
          return CupertinoTabView(
            builder: (context) {
              return _bottomItemList[index].content;
            },
          );
        });
  }
}
