import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/post_entity.dart';

class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _HistoryPage();
  }
}

class _HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _SliverListDemo(),
    );
  }
}

class _SliverListDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        /// 会随着滚动消失
        SliverAppBar(
          title: Text("记录"),
          floating: true,

          /// 导航栏加高
          expandedHeight: 200,
          flexibleSpace: FlexibleSpaceBar(
            title: Text(
              "副标题",
              style: TextStyle(
                color: Colors.red,

                /// 间距
                letterSpacing: 3.0,

                /// 粗细
                fontWeight: FontWeight.w900,
              ),
            ),
            background: Image.network(
              "https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=2641512116,3445406201&fm=26&gp=0.jpg",
              fit: BoxFit.cover,
            ),
          ),
        ),

        SliverPadding(
          padding: EdgeInsets.all(20),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.only(bottom: 32),

                  /// 圆角
                  child:
//                  Material(
//
//                    /// 圆角 本身,内容图片无法被圆角
//                    borderRadius: BorderRadius.circular(100) ,
//                      shadowColor: Colors.red,
//                      elevation: 20.0,
//
//                    child:
////                    ClipRRect(
////                      borderRadius: BorderRadius.circular(12),
////                      child:
//
//                    AspectRatio(
//                      /// 比例
//                      aspectRatio: 16 / 9,
//                      child: Image.network(
//                        PostEntity.dataList[index].imageUrl,
//                        fit: BoxFit.fill,
//                      ),
//                    ),
////                    )
//                  ),

                      Container(
                    decoration: BoxDecoration(
                      /// 阴影 可以多个 offset 值 逆序,不然看不见
                      boxShadow: [
                        BoxShadow(
                          color: Colors.red,
                          offset: Offset(10.0, 10.0),

                          /// 模糊圆角
                          blurRadius: 10.0,

                          /// 展开
//                            spreadRadius: 12.0,
                        ),
                      ],
                    ),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: AspectRatio(
                          /// 比例
                          aspectRatio: 16 / 9,
                          // child: FadeInImage.assetNetwork(
                          //   placeholder: KPlaceholderImageName,
                          //   image: PostEntity.dataList[index].imageUrl,
                          //   fit: BoxFit.cover,
                          // ),
                            child:Image.asset('assets/image/A171.jpg') ,
//                            CachedNetworkImage(
//                              width: 120,
//                              fit: BoxFit.fill,
////                              placeholder: new CircularProgressIndicator(),
//                              imageUrl: "http://1.png",
//                              errorWidget:(context, url, error) => Image.asset(KPlaceholderImageName),
//                            )

//                          /**网络缓存图片库*/
//                          CachedNetworkImage(
//                          width: 60,
//                          height: 60,
//                          imageUrl: "http://1.png",
//                          placeholder: (context, url) =>Image.asset(
//                            KPlaceholderImageName,
//                            width: 60,
//                            height: 60,
//                          ),
//                        ),

//                          Image.network(
////                            PostEntity.dataList[index].imageUrl,
//                "https://123.png",
//                            fit: BoxFit.cover,
//                          ),
                        )),
                  ),

//                        /// Container 只能是线宽圆角,内容不会被圆角
//                        Container(
//                      decoration: BoxDecoration(
//                        /// 圆角必须有线宽默认1
//                        border: Border.all(
//                            width: 12, color: Colors.deepPurpleAccent),
//
//                        ///圆角
//                        borderRadius: BorderRadius.circular(12.0),
//
//                        /// 阴影 可以多个 offset 值 逆序,不然看不见
//                        boxShadow: [
//                          BoxShadow(
//                            color: Colors.red,
//                            offset: Offset(10.0, 10.0),
////                            blurRadius: 10.0,
////                            spreadRadius: 12.0,
//                          ),
//                          BoxShadow(
//                            color: Colors.orange,
//                            offset: Offset(5, 5),
////                            blurRadius: 10.0,
////                            spreadRadius: 12.0,
//                          ),
//                        ],
//                      ),
//
//                      /// 比例 widget
//                      child: Image.network(
//                        PostEntity.dataList[index].imageUrl,
//                        fit: BoxFit.cover,
//                      ),
//                    )
                );
              },
              childCount: PostEntity.dataList.length,
            ),
          ),
        ),
      ],
    );
  }
}

