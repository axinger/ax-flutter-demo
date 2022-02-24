import 'package:flutter/material.dart';

class MyBottomNavigationBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _BottomNavigationBar();
  }
}

class _BottomNavigationBar extends State<MyBottomNavigationBar> {
  int _currentIndex = 0;

  void _onTabHandler(int index) {
    debugPrint(index.toString());
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,

      /// 选中颜色
      fixedColor: Colors.blue,
      backgroundColor: Colors.yellow,

      currentIndex: _currentIndex,
      onTap: _onTabHandler,
      items: [
        BottomNavigationBarItem(
          label: 'Home',
          icon: Icon(Icons.home),
        ),
        BottomNavigationBarItem(
          label:'List',
          icon: Icon(Icons.list),
        ),
        BottomNavigationBarItem(
          label: 'Message',
          icon: Icon(Icons.message),
        ),
        BottomNavigationBarItem(
          label: 'Message',
          icon: Icon(Icons.message),
        ),
      ],
    );
  }
}
