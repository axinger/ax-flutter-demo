import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../controller/detail_page.dart';
import '../model/post_entity.dart';

class ContentPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ContentPage();
  }
}

class _ContentPage extends State<ContentPage> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  List<PostEntity> dataList = [];

  @override
  void initState() {
    super.initState();
    this.dataList = PostEntity.dataList;
    print("首页第一个===========");
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ListView.builder(
      itemCount: this.dataList.length,
      itemBuilder: (BuildContext context, int index) {
        PostEntity entity = this.dataList[index];

        return InkResponse(
//            onTap: (){
//              print("aaaaa");
//            },
          child: Container(
            color: Colors.white,
            margin: EdgeInsets.all(10),
            child: Stack(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Image.network(entity.imageUrl),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      entity.title,
//                        style: Theme.of(context).textTheme.title,

                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                    Text(
                      entity.author,
                      // style: Theme.of(context).textTheme.subhead,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),

                /// 点击波纹效果
                /// Positioned 充满空间的组件
                Positioned.fill(
                    child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    splashColor: Colors.orange.withOpacity(0.3),
                    highlightColor: Colors.white.withOpacity(0.1),
                    onTap: () {
                      print("bbbb");

                      /// CupertinoPageRoute 和 MaterialPageRoute
                      Navigator.of(context).push(CupertinoPageRoute<bool>(builder: (context) {
                        return DetailPage(
                          postEntity: entity,
                        );
                      }));
                    },
                  ),
                )),
              ],
            ),
          ),
        );
      },
    );
  }
}
