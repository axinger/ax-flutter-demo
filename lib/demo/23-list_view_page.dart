import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// import 'package:flutter_easyrefresh/easy_refresh.dart';

import '../demo/converse_list_header.dart';
import '../model/converse_model.dart';

class ListViewPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyPage();
  }
}

class _MyPage extends State<ListViewPage> {
  List<ConverseModel> _converseModelList = [];
  ScrollController _scrollController = ScrollController();

  // EasyRefreshController _refreshController = EasyRefreshController();

  List<int> dataList = <int>[];

  /// 分页
  int pageIndex = 0;

//  refreshController.finishLoad(
//  success: true, noMore: (value.length == 0));
  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _scrollController.addListener(() {
      double offset = _scrollController.position.pixels;
//      print("滑动距离$offset");

      // 如果滑动到底部
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        // do something
      }
    });

    return Scaffold(
      backgroundColor: Colors.orange,
      appBar: AppBar(
        title: Text(
          "ListView",
          style: TextStyle(color: Colors.red),
        ),
      ),
      body: _listView(),
    );
  }

  _notificationListener() {
    return NotificationListener(
      onNotification: (ScrollNotification notification) {
        print(notification.runtimeType);

        switch (notification.runtimeType) {
          case ScrollStartNotification:
            {
              print("开始滚动");
            }
            break;
          case ScrollUpdateNotification:
            print("正在滚动");
            break;
          case ScrollEndNotification:
            {
              print("滚动停止");
              if (_scrollController.position.extentAfter == 0) {
                print('滚动到底部');
              }
              if (_scrollController.position.extentBefore == 0) {
                print('滚动到头部');
              }
            }
            break;
          case OverscrollNotification:
            print("滚动到边界");
            break;
        }

        return true;
      },
      child: _listView(),
    );
  }

  _loadData() {
    List<int> tempList = [];

    if (pageIndex == 1) {
      for (int i = 0; i < 2; i++) {
        tempList.add(i);
      }
    } else if (pageIndex >= 4) {
    } else {
      for (int i = dataList.last; i < (dataList.last + 2); i++) {
        tempList.add(i);
      }
    }

    setState(() {
      dataList.addAll(tempList);
      // _refreshController.finishLoad(
      //     success: true, noMore: (tempList.length == 0));
    });
  }

  Widget _listView() {
    return Column(
      children: <Widget>[
        ConverseListHeader(
          onPressed: () {},
        ),
        Container(
//              height: 200,
          child: ListView.separated(
            controller: _scrollController,

            /// 内容适配,无限尺寸,NeverScrollableScrollPhysics禁止滚动时候,需要自适应,不然不显示
            shrinkWrap: true,
//                  primary:true,
            ///滑动类型设置 NeverScrollableScrollPhysics 禁止滑动
//                physics: NeverScrollableScrollPhysics(),
//              physics: FixedExtentScrollPhysics(),
            //确定每一个item的高度 会让item加载更加高效
//            itemExtent: 200.0,

            //cacheExtent  设置预加载的区域
//            cacheExtent: 30.0,

            /// 分割线属性
            padding: EdgeInsets.all(10),
            separatorBuilder: (context, index) {
//                  return Divider(
//                    height: 5,
//                    color: Colors.red,
//                  );
              return Container(
                color: Colors.grey,
                height: 1,
              );
            },

            /**listView 个数*/
            itemCount: dataList.length,
            /**listView item*/
            itemBuilder: (BuildContext context, int index) {
//                  return GestureDetector(
//                    //单击事件响应
//                    onTap: () {
//                      print('点击了 $index');
//                    },
//                    child: Container(
//                      color: Colors.red,
//                      alignment: Alignment.centerLeft,
//                      height: 88,
////                    width: 120,
//                      child: Text('内容 - $index'),
//                    ),
//                  );

              return ListTile(
                leading: Text(
                  'leading - $index',
                  textAlign: TextAlign.start,
                ),
                title: Text(
                  'index - $index',
                  textAlign: TextAlign.left,
                ),
                subtitle: Text(
                  'subtitle - $index',
                  textAlign: TextAlign.start,
                ),
                isThreeLine: index.isOdd,
                dense: index.isOdd,
                trailing: Icon(
                  Icons.navigate_next,
                  size: 22.0,
                ),
                selected: index.isOdd,
//                  leading: Icon(Icons.message,color: Colors.orange,size: 22.0,),
                onTap: () {
                  print('index = $index');
                },
              );
            },
          ),
        ),
      ],
    );
//     return Container(
//       color: Colors.white,
// //      height: 400,
//       child: EasyRefresh(
//         controller: _refreshController,
// //firstRefresh: true,
// //        enableControlFinishRefresh:true,
// //        enableControlFinishLoad:true,
// //        headerIndex:1,
//         ///项目国际化异常
//         header: ClassicalHeader(
//           refreshText: '拉动刷新',
//           refreshReadyText: '释放刷新',
//           refreshingText: '正在刷新...',
//           refreshedText: '刷新完成',
//           refreshFailedText: '刷新失败',
//           noMoreText: '没有更多数据',
//           infoText: '更新于 %T',
//         ),
//         footer: ClassicalFooter(
//           loadText: '拉动加载',
//           noMoreText: '没有更多数据',
//           loadingText: '正在加载...',
//           loadReadyText: '释放加载',
//           loadedText: '加载完成',
//           infoText: '更新于 %T',
//         ),
//
//         /// 第三方刷新事件
//         onRefresh: () async {
//           dataList.clear();
//           pageIndex = 1;
//           _loadData();
//         },
//         onLoad: () async {
//           pageIndex++;
//           _loadData();
//         },
//
//         child: Column(
//           children: <Widget>[
//             ConverseListHeader(
//               onPressed: () {},
//             ),
//             Container(
// //              height: 200,
//               child: ListView.separated(
//                 controller: _scrollController,
//
//                 /// 内容适配,无限尺寸,NeverScrollableScrollPhysics禁止滚动时候,需要自适应,不然不显示
//                 shrinkWrap: true,
// //                  primary:true,
//                 ///滑动类型设置 NeverScrollableScrollPhysics 禁止滑动
// //                physics: NeverScrollableScrollPhysics(),
// //              physics: FixedExtentScrollPhysics(),
//                 //确定每一个item的高度 会让item加载更加高效
// //            itemExtent: 200.0,
//
//                 //cacheExtent  设置预加载的区域
// //            cacheExtent: 30.0,
//
//                 /// 分割线属性
//                 padding: EdgeInsets.all(10),
//                 separatorBuilder: (context, index) {
// //                  return Divider(
// //                    height: 5,
// //                    color: Colors.red,
// //                  );
//                   return Container(
//                     color: Colors.grey,
//                     height: 1,
//                   );
//                 },
//
//                 /**listView 个数*/
//                 itemCount: dataList.length,
//                 /**listView item*/
//                 itemBuilder: (BuildContext context, int index) {
// //                  return GestureDetector(
// //                    //单击事件响应
// //                    onTap: () {
// //                      print('点击了 $index');
// //                    },
// //                    child: Container(
// //                      color: Colors.red,
// //                      alignment: Alignment.centerLeft,
// //                      height: 88,
// ////                    width: 120,
// //                      child: Text('内容 - $index'),
// //                    ),
// //                  );
//
//                   return ListTile(
//                     leading: Text(
//                       'leading - $index',
//                       textAlign: TextAlign.start,
//                     ),
//                     title: Text(
//                       'index - $index',
//                       textAlign: TextAlign.left,
//                     ),
//                     subtitle: Text(
//                       'subtitle - $index',
//                       textAlign: TextAlign.start,
//                     ),
//                     isThreeLine: index.isOdd,
//                     dense: index.isOdd,
//                     trailing: Icon(
//                       Icons.navigate_next,
//                       size: 22.0,
//                     ),
//                     selected: index.isOdd,
// //                  leading: Icon(Icons.message,color: Colors.orange,size: 22.0,),
//                     onTap: () {
//                       print('index = $index');
//                     },
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//
//         emptyWidget: dataList.length > 0
//             ? null
//             : const Center(
//                 child: Text('暂无数据'),
//               ),
//       ),
//     );
  }
}

class AxRefresh extends StatefulWidget {
  @override
  _AxRefreshState createState() => _AxRefreshState();
}

class _AxRefreshState extends State<AxRefresh> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
