//
//  43_search_page
//  ax_flutter_demo
//
//  Created by axinger on 2020/8/18 9:14 下午 .
//  Copyright ©2020/8/18 ax_flutter_demo. All rights reserved.
//
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class P43SearchPage extends StatefulWidget {
  @override
  _P43SearchPageState createState() => _P43SearchPageState();
}

class _P43SearchPageState extends State<P43SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: InkWell(
          child: Icon(Icons.search),
          onTap: () {
            showSearch(context: context, delegate: SearchBarDelegate());
          },
        ),
        actions: [
          TextButton(
            child: Text('退出'),
            onPressed: () {
              if (Platform.isAndroid) {
                SystemNavigator.pop();
              } else {
                exit(0);
              }
            },
          )
        ],
      ),
    );
  }
}

typedef SearchItemCall = void Function(String item);

class SearchBarDelegate extends SearchDelegate<String> {
  @override
  String get searchFieldLabel => '请输入搜索内容';

  @override
  List<Widget> buildActions(BuildContext context) {
    //右侧显示内容 这里放清除按钮
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
          showSuggestions(context);
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    //左侧显示内容 这里放了返回按钮
    return IconButton(
      icon: AnimatedIcon(icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
      onPressed: () {
        if (query.isEmpty) {
          close(context, '');
        } else {
          /// 清空搜索文字
          query = "";

          ///显示的建议,就是现实默认展示页面,把键盘收起 ,看效果
          showSuggestions(context);
        }
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    //点击了搜索显示的页面
    return Center(
      child: Text('12312321'),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    //点击了搜索窗显示的页面
    return SearchContentView();
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      primaryColor: Colors.red,
    );
//    return super.appBarTheme(context);
  }
}

class SearchContentView extends StatefulWidget {
  @override
  _SearchContentViewState createState() => _SearchContentViewState();
}

class _SearchContentViewState extends State<SearchContentView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: ListView(
//        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Text(
              '大家都在搜',
              style: TextStyle(fontSize: 16),
            ),
          ),
          SearchItemView(),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Text(
              '历史记录',
              style: TextStyle(fontSize: 16),
            ),
          ),
          SearchItemView()
        ],
      ),
    );
  }
}

class SearchItemView extends StatefulWidget {
  @override
  _SearchItemViewState createState() => _SearchItemViewState();
}

class _SearchItemViewState extends State<SearchItemView> {
  List<String> items = ['面试', 'Studio3', '动画dfsfds', '自定义View', '性能优化', 'gradle', 'Camera', '代码混淆 安全', '逆向加固'];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Wrap(
        spacing: 10,
        // runSpacing: 0,
        children: items.map((item) {
          return SearchItem(title: item);
        }).toList(),
      ),
    );
  }
}

class SearchItem extends StatefulWidget {
  final String title;

  const SearchItem({Key? key, required this.title}) : super(key: key);

  @override
  _SearchItemState createState() => _SearchItemState();
}

class _SearchItemState extends State<SearchItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        child: Chip(
          label: Text(widget.title),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          deleteIconColor: Colors.red,
          onDeleted: () {},
        ),
        onTap: () {
          print(widget.title);
        },
      ),
      color: Colors.white,
    );
  }
}
