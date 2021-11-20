import 'package:flutter/material.dart';

class P58NavigationRailPage extends StatefulWidget {
  @override
  _P58NavigationRailPageState createState() => _P58NavigationRailPageState();
}

class _P58NavigationRailPageState extends State<P58NavigationRailPage> {
  int _selectedIndex = 0;

  /**
   * https://juejin.cn/post/6844904176028221453
   * 通常展示在应用程序的左边或者右边，通过这个组件来进行页面的导航，通常来说页面数量都是3个或者5个以内。
   */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('通常展示在应用程序的左边或者右边'),
      ),
      //row 做为 body 布局
      body: Row(
        children: <Widget>[
          NavigationRail(
            selectedIndex: _selectedIndex,
            onDestinationSelected: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            selectedLabelTextStyle: TextStyle(color: Colors.red, backgroundColor: Colors.orange),
            labelType: NavigationRailLabelType.selected,
            destinations: [
              NavigationRailDestination(
                ///icon 未被选中状态下的图标(通常都是轮廓)。
                icon: Icon(Icons.favorite),

                ///selectedIcon 可选的，选择状态下的图标。
                selectedIcon: Icon(Icons.favorite, color: Colors.red),

                ///label 必须要有的，图标下方的描述文字。
                label: Text('First'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.bookmark_border),
                selectedIcon: Icon(Icons.book),
                label: Text('Second'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.star_border),
                selectedIcon: Icon(Icons.star),
                label: Text('Third'),
              ),
            ],
          ),
          VerticalDivider(thickness: 1, width: 1),
          // This is the main content.
          //Expanded 占满剩下屏幕空间
          Expanded(
            child: Center(
              child: Text('selectedIndex: $_selectedIndex'),
            ),
          )
        ],
      ),
    );
    ;
  }
}
