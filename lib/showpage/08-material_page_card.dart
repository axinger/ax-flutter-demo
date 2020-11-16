import 'package:ax_flutter_demo/model/post_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MaterialPageCard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MaterialPage1();
  }
}

class _MaterialPage1 extends State<MaterialPageCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("卡片"),
      ),
      body: ListView(
        children: PostEntity.dataList.map((post) {
          /// Card 会自动圆角
          return Card(
            child: Column(
              children: <Widget>[
                /// 按比例显示
                AspectRatio(
                  aspectRatio: 16 / 9,

                  /// 圆角
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5),
                    ),
                    child: Image.network(
                      post.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(post.imageUrl),
                  ),
                  title: Text(post.title),
                  subtitle: Text(post.author),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Text(post.title),
                ),

                /// 统一设置button ,也可以单独写子内容
                ButtonBarTheme(
                  data: ButtonBarThemeData(
                    buttonMinWidth: 100,
                  ),
                  child: ButtonBar(
                    children: <Widget>[
                      FlatButton(
                        child: Text("评论"),
                        color: Colors.red,
                        onPressed: () {},
                      ),
                      FlatButton(
                        child: Text("赞"),
                        color: Colors.red,
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
