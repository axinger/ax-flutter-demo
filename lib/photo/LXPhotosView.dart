import 'package:flutter/material.dart';

import 'LXPhotosData.dart';
import 'LXScrollPhotosView.dart';

class LXPhotosView extends StatefulWidget {
  //数据资源
  final List<LXPhotosData> list;

  //主轴间距
  final double mainAxisPaddingSize;

  //交叉轴间距
  final double crossAxisPaddingSize;

  // 圆角大小(默认没有圆角)
  final double radiusSize;

  //交叉轴个数 (默认值 根据九宫格个数决定)
  final int currentCrossAxisCount;

  //背景颜色
  final Color bgColor;

  ///构造方法
  LXPhotosView({
    Key? key,
    required this.list,
    this.mainAxisPaddingSize = 5,
    this.crossAxisPaddingSize = 5,
    this.radiusSize = 0.0,
    this.bgColor = Colors.white,
    int currentCrossAxisCount = 0,
  })  : this.currentCrossAxisCount = currentCrossAxisCount ?? (list.length == 4 ? 2 : 3),
        super(key: key);

  @override
  _PhotosViewState createState() => _PhotosViewState();
}

class _PhotosViewState extends State<LXPhotosView> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Container(
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: this.widget.currentCrossAxisCount,
            crossAxisSpacing: this.widget.crossAxisPaddingSize,
            mainAxisSpacing: this.widget.mainAxisPaddingSize,
          ),
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              child: Hero(
                tag: widget.list[index].imgUrl,
                child: Container(
                  color: widget.bgColor,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(widget.radiusSize),
                    child: Image(
                      image: NetworkImage(widget.list[index].imgUrl),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
              ),
              onTap: () {
                Navigator.of(context).push(PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) {
                  return FadeTransition(
                      opacity: animation,
                      child: LXScrollPhotosView(
                        currentIndex: index,
                        currentList: widget.list,
                      ));
                }));
              },
            );
          },
          itemCount: widget.list.length,
        ),
      ),
    );
  }
}
