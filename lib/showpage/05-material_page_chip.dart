import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MaterialPageChip extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MaterialPage1();
  }
}

class _MaterialPage1 extends State<MaterialPageChip> {
  List _list = ["1", "2", "3", "4", "5"];

  Set _listSet = Set();

  var selectIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chip"),
      ),
      body: Column(
        children: <Widget>[
          Wrap(
            spacing: 20,
            runSpacing: 10,
            children: <Widget>[
              Chip(
                label: Text("aaa"),
              ),

              Chip(
                label: Text("aaaaaaaaaaaaaaaaaaaaaaa"),

                /// 删除icon
//                deleteIcon: Icon(Icons.delete),
                deleteIconColor: Colors.red,
                onDeleted: () {},
              ),
              Chip(
                label: Text("aaaaaaaaaaaaaaaaaaaaaa"),

                /// 可移动图标
                avatar: CircleAvatar(
                  backgroundColor: Colors.red,

//                  child: Text("头"),
                  backgroundImage: AssetImage("assets/image/headIcon.png"),
                ),

                /// 删除icon
                deleteIcon: Icon(Icons.delete),
                deleteIconColor: Colors.red,

                onDeleted: () {},
              ),

              /// 可以控制左对齐
              Container()
            ],
          ),
          Divider(
            indent: 20,
            endIndent: 20,
            color: Colors.red,
          ),
          Text("删除"),
          Wrap(
//            crossAxisAlignment: WrapCrossAlignment.end,
            spacing: 10,
            runSpacing: 10,
            children: _list.map((text) {
              return Chip(
                label: Text(text),
                avatar: CircleAvatar(
//                  backgroundColor: Colors.red,
//                  child: Text("A"),
                  backgroundImage: AssetImage("assets/image/headIcon.png"),
                ),

                /// 删除icon
//                deleteIcon: Icon(Icons.delete),
                deleteIconColor: Colors.red,
                onDeleted: () {
                  setState(() {
                    _list.remove(text);
                  });
                },
              );
            }).toList(),
          ),
          Divider(
            indent: 20,
            endIndent: 20,
            color: Colors.red,
          ),
          Text("点击"),
          Wrap(
//            crossAxisAlignment: WrapCrossAlignment.end,
            spacing: 10,
            runSpacing: 10,
            children: _list.map((text) {
              return ActionChip(
                label: Text(text),
                avatar: CircleAvatar(
//                  backgroundColor: Colors.red,
//                  child: Text("A"),
                  backgroundImage: AssetImage("assets/image/headIcon.png"),
                ),
                onPressed: () {},
              );
            }).toList(),
          ),
          Divider(
            indent: 20,
            endIndent: 20,
            color: Colors.red,
          ),
          Text("多选"),
          Wrap(
//            crossAxisAlignment: WrapCrossAlignment.end,
            spacing: 10,
            runSpacing: 10,
            children: _list.map((text) {
              return FilterChip(
                selected: _listSet.contains(text),
                onSelected: (value) {
                  debugPrint("value = $value");
                  setState(() {
                    if (_listSet.contains(text)) {
                      _listSet.remove(text);
                    } else {
                      _listSet.add(text);
                    }
                  });
                },
                label: Text(text),
              );
            }).toList(),
          ),
          Text("多选方式2"),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: _list.map((text) {
              return ChoiceChip(
                selected: _listSet.contains(text),
                onSelected: (value) {
                  debugPrint("value = $value");
                  setState(() {
                    if (_listSet.contains(text)) {
                      _listSet.remove(text);
                    } else {
                      _listSet.add(text);
                    }
                  });
                },
                label: Text(text),
              );
            }).toList(),
          ),
          Text("单选"),
          Wrap(
            spacing: 10,
            runSpacing: 10,

            /// 遍历下标 _list.asMap().keys.map 变量方式二
            children: _list.asMap().keys.map((index) {
              var text = _list[index];
              return ChoiceChip(
                selected: selectIndex == index,
                onSelected: (value) {
                  debugPrint("value = $value");
                  setState(() {
                    selectIndex = index;
                  });
                },
                label: Text(text),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
