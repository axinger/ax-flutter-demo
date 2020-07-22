import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MaterialPageMoreText extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MaterialPage1();
  }
}

class _MaterialPage1 extends State<MaterialPageMoreText> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("多行文本"),
      ),

//      Flexible和 Expanded
      body: Column(
        children: <Widget>[
          Text("Flexible"),
          Row(
            children: <Widget>[
              Flexible(
//                flex: 300,
                fit: FlexFit.loose,
                child: Text(
                  "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAssssssssssss",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(backgroundColor: Colors.red),
                  maxLines: 1,
                ),
              ),

//          SizedBox.fromSize(size: Size.fromWidth(10),),
              Flexible(
//                flex: 2,
                fit: FlexFit.tight,
                child: Text(
                  "BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(backgroundColor: Colors.orange),
                ),
              ),

              Flexible(
//                flex: 1,
                child: Text(
                  "CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC",
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          SizedBox.fromSize(
            size: Size.fromHeight(50),
          ),
          Text("Expanded"),
          Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  "AAAAAAA",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(backgroundColor: Colors.red),
                ),
              ),

//          SizedBox.fromSize(size: Size.fromWidth(10),),
              Expanded(
                flex: 1,
                child: Text(
                  "BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(backgroundColor: Colors.orange),
                ),
              ),

              Expanded(
                child: Text(
                  "CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC",
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          Row(children: <Widget>[
            new RaisedButton(
              onPressed: () {
                print('点击红色按钮事件');
              },
              color: const Color(0xffcc0000),
              child: new Text('红色按钮'),
            ),
            new Expanded(
              flex: 1,
              child: new RaisedButton(
                onPressed: () {
                  print('点击黄色按钮事件');
                },
                color: const Color(0xfff1c232),
                child: new Text('黄色按钮'),
              ),
            ),
            new RaisedButton(
              onPressed: () {
                print('点击粉色按钮事件');
              },
              color: const Color(0xffea9999),
              child: new Text('粉色按钮'),
            ),
          ]),
          Row(children: <Widget>[
            new RaisedButton(
              onPressed: () {
                print('点击红色按钮事件');
              },
              color: const Color(0xffcc0000),
              child: new Text('红色按钮'),
            ),
            new Flexible(
              flex: 1,
              child: new RaisedButton(
                onPressed: () {
                  print('点击黄色按钮事件');
                },
                color: const Color(0xfff1c232),
                child: new Text('黄色按钮'),
              ),
            ),
            new RaisedButton(
              onPressed: () {
                print('点击粉色按钮事件');
              },
              color: const Color(0xffea9999),
              child: new Text('粉色按钮'),
            ),
          ]),
        ],
      ),
    );
  }
}
