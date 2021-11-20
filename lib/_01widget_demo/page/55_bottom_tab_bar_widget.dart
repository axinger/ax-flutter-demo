import 'package:flutter/material.dart';

class P55BottomTabBarWidget extends StatefulWidget {
  @override
  _BottomTabBarWidgetState createState() => _BottomTabBarWidgetState();
}

class _BottomTabBarWidgetState extends State<P55BottomTabBarWidget> {
  // 默认选中
  int selectedIndex = 0;

  // 页面数组

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floating按钮位置设置 .centerDocked
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // 设置floating按钮
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add, color: Colors.white),
          onPressed: () {
            print("中间按钮事件");
          }),
      bottomNavigationBar: BottomAppBar(
        //悬浮按钮 与其他菜单栏的结合方式
        shape: CircularNotchedRectangle(),
        // FloatingActionButton和BottomAppBar 之间的差距
        notchMargin: 6.0,
        color: Colors.orange,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            buildTabBarItem(selectedIndex, 0, selectedIcon: Icon(Icons.home, color: Colors.blue), icon: Icon(Icons.home, color: Colors.grey), title: "首页"),
            //
            buildTabBarItem(selectedIndex, 1,
                selectedIcon: Icon(Icons.library_music, color: Colors.blue), icon: Icon(Icons.library_music, color: Colors.grey), title: "发现"),
            //
            // buildTabBarItem(selectedIndex, 2, selectedIcon: Icon(Icons.email, color: Colors.blue), icon: Icon(Icons.email, color: Colors.grey), title: "消息"),
            //
            // buildTabBarItem(selectedIndex, 3, selectedIcon: Icon(Icons.person, color: Colors.blue), icon: Icon(Icons.person, color: Colors.grey), title: "我的"),
            //
            // buildTabBarItem(selectedIndex, -1),
          ],
        ),
      ),
    );
  }

  buildTabBarItem(
    int currentIndex,
    int flagIndex, {
    Widget? selectedIcon,
    Widget? icon,
    String? title,
  }) {
    // 文本状态
    TextStyle textStyle = TextStyle(color: Colors.grey, fontSize: 13);

    Widget tabBarItem = SizedBox();
    if (icon != null) {
      Widget rsIcon = icon;

      if (currentIndex == flagIndex) {
        textStyle = TextStyle(color: Colors.blue);
        rsIcon = selectedIcon!;
      }

      tabBarItem = GestureDetector(
        child: SizedBox(
          height: 52,
          child: Container(
              color: Colors.orange,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [rsIcon, Text("$title", style: textStyle)],
              )),
        ),
        onTap: () {
          if (flagIndex != currentIndex) {
            setState(() {
              selectedIndex = flagIndex;
            });
          }
        },
      );
    }

    return Expanded(flex: 1, child: tabBarItem);
  }
}
