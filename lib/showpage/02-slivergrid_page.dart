import 'package:ax_flutter_demo/model/post_entity.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class P02SlivergridPage extends StatefulWidget {
  @override
  _P02SlivergridPageState createState() => _P02SlivergridPageState();
}

class _P02SlivergridPageState extends State<P02SlivergridPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text(
              "SliverAppBar,\nSliverList,\nSliverGrid",
              maxLines: 3,
              style: TextStyle(color: Colors.red),
            ),
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
          SliverList(
              delegate:
                  SliverChildBuilderDelegate((BuildContext context, int index) {
            return Container(
              height: 44,
              color: Colors.primaries[(index % 18)],
            );
          }, childCount: 10)),
          SliverPadding(
            padding: EdgeInsets.all(10),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Container(
                    color: Colors.transparent,
                    // child: Image.network(
                    //   PostEntity.dataList[index].imageUrl,
                    //   fit: BoxFit.cover,
                    // ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: CachedNetworkImage(
                        // width: 120,
                        fit: BoxFit.fill,
//                              placeholder: new CircularProgressIndicator(),
                        imageUrl: PostEntity.dataList[index].imageUrl,
                        // imageBuilder: (BuildContext context,
                        //     ImageProvider imageProvider,){
                        //    return Text('imageBuilder');
                        // },
                        // placeholder: (context, url) {
                        //   return Icon(
                        //     Icons.local_attraction,
                        //     color: Colors.orange,
                        //     size: 50,
                        //   );
                        // },
                        /// 和 placeholder 只能选一个
                        progressIndicatorBuilder:
                            (BuildContext context, String url, progress) {
                          return CircularProgressIndicator(
                            // value: progress?.progress??0,
                            value: 0.1,
                            // backgroundColor: Colors.pink,
                          );
                        },
                        // errorWidget:(context, url, error){
                        //  return Image.asset(KPlaceholderImageName);
                        // },

                        errorWidget: (context, url, error) {
                          return Icon(
                            Icons.error,
                            color: Colors.red,
                            size: 50,
                          );
                        },
                      ),
                    ),
                  );
                },
                // childCount: 20,
                childCount: PostEntity.dataList.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
