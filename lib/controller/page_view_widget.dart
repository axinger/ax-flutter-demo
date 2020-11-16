import 'package:flutter/material.dart';

import '../model/post_entity.dart';
//import 'package:flutter_boost/flutter_boost.dart';

class PageViewWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PageViewWidget();
  }
}

class _PageViewWidget extends State<PageViewWidget> {
  List<PostEntity> dataList = [];

  @override
  Widget build(BuildContext context) {
    this.dataList = PostEntity.dataList;

    return _GridView_builder();
//    return _pageview();

//    return _pageviewbuilder();

    /// 网格视图 collectView
//    return _GridView_count();
    return _GridView_builder();
  }
}

class _GridView_builder extends StatelessWidget {
  List<PostEntity> dataList = [];

  @override
  Widget build(BuildContext context) {
    this.dataList = PostEntity.dataList;

    return GridView.builder(

        /// 四周空隙
        padding: EdgeInsets.all(10),

        /// 总数量
        itemCount: dataList.length,

        /// 代理 按照个数来计算
        ///SliverGridDelegateWithFixedCrossAxisCount 构建一个横轴固定数量Widget
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          ///横轴元素个数
          crossAxisCount: 3,

          ///纵轴间距
          mainAxisSpacing: 10.0,

          ///横轴间距
          crossAxisSpacing: 10.0,

          ///子组件宽高长度比例
//          childAspectRatio: 0.5,
        ),

//    ///代理, 按照尺寸计算
//        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
//          ///横轴元素个数
////          crossAxisCount: 3,
//          maxCrossAxisExtent: 200,
//
//          ///纵轴间距
//          mainAxisSpacing: 20.0,
//
//          ///横轴间距
//          crossAxisSpacing: 10.0,
//
//          ///子组件宽高长度比例
//          childAspectRatio: 1.0,
//        ),
        itemBuilder: (BuildContext context, int index) {
          return StackView(dataList, index);
        });
  }
}

class StackView extends StatelessWidget {
  int index;
  List<PostEntity> dataList;

  StackView(this.dataList, this.index);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ///SizedBox.expand 可以使SizedBox的大小充满parent的布局
        ///
        SizedBox.expand(
          child: Image.network(
            dataList[index].imageUrl,
            fit: BoxFit.cover,
          ),
        ),

        Positioned(
          bottom: 8.0,
          left: 8.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                dataList[index].title,
                style: TextStyle(color: Colors.red),
              ),
              Text(
                dataList[index].author,
                style: TextStyle(color: Colors.red),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/// 网格视图 collectView
class _GridView_count extends StatelessWidget {
  List<PostEntity> dataList = [];

  @override
  Widget build(BuildContext context) {
    this.dataList = PostEntity.dataList;

    List<Widget> _cell() {
      ///自动生成Widget
      return List.generate(dataList.length, (int index) {
        return StackView(dataList, index);
      });
    }

    /// 网格视图 collectView
    return GridView.count(
      ///  每行几个
      crossAxisCount: 3,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      children: _cell(),
    );
  }
}

class _pageviewbuilder extends StatelessWidget {
  List<PostEntity> dataList = [];

  @override
  Widget build(BuildContext context) {
    this.dataList = PostEntity.dataList;

    return PageView.builder(
      itemCount: dataList.length,
      itemBuilder: (BuildContext context, int index) {
        return Stack(
          children: <Widget>[
            ///SizedBox.expand 可以使SizedBox的大小充满parent的布局，

            /*        一般的SizeBox()构造方法:传width、height、child,SizedBox会强制设置它的孩子的宽度或者高度为指定值
        SizeBox.expand():可以使SizedBox的大小充满parent的布局，相当于设置了SizedBox的宽度和高度为double.infinity(无穷大)。
        SizeBox.fromSize():创建一个指定Size的SizedBox
        FractionallySizedBox():可以用百分比来控制sizebox的大小。 widthFactor，heightFactor参数就是相对于父控件的比例。 alignment：可以设置sizebox在父控件里面的相对位置。
        SizedOverflowBox():通过设置Size，允许它的child控件，溢出它的父控件，进行绘制，不会报OverFlow的错误。
        OverflowBox()：通过设置最大最小的宽高，OverflowBox允许它的child控件，溢出它的父控件，进行绘制，不会报OverFlow的错误。
        LimtedBox():一个可以限制子控件的最大宽高的控件，child只能在这区域内进行绘制
        ————————————————
        版权声明：本文为CSDN博主「weixin_33716154」的原创文章，遵循 CC 4.0 BY-SA 版权协议，转载请附上原文出处链接及本声明。
        原文链接：https://blog.csdn.net/weixin_33716154/article/details/88017225
        */
            SizedBox.expand(
              child: Image.network(
                dataList[index].imageUrl,
                fit: BoxFit.cover,
              ),
            ),

            Positioned(
              bottom: 8.0,
              left: 8.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    dataList[index].title,
                    style: TextStyle(color: Colors.red),
                  ),
                  Text(
                    dataList[index].author,
                    style: TextStyle(color: Colors.red),
                  ),
                ],
              ),
            ),
          ],
        );
      },
      controller: PageController(
        viewportFraction: 0.9,
      ),
    );
  }
}

class _pageview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return PageView(
      /// 是否翻页,默认翻页
//      pageSnapping: false,
      /// 滚动方向,默认水平
//      scrollDirection: Axis.vertical,
      /// 事件
      onPageChanged: (index) {
        debugPrint("翻页下标 $index");
      },

      controller: PageController(
        initialPage: 1,
//        keepPage: false,
        /// 左右有边距的那种
        viewportFraction: 0.8,
      ),

      children: <Widget>[
        Container(
          child: Text("1"),
          alignment: Alignment(0, 0),
          color: Colors.red,
        ),
        Container(
          child: Text("2"),
          alignment: Alignment(0, 0),
          color: Colors.green,
        ),
        Container(
          child: Text("3"),
          alignment: Alignment(0, 0),
          color: Colors.grey,
        ),
      ],
    );
  }
}
