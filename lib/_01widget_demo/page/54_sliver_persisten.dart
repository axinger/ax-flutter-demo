import 'package:flutter/material.dart';

class P54SliverPersisten extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CustomScrollView1State();
  }
}

class CustomScrollView1State extends State<P54SliverPersisten> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverPersistentHeader(
            floating: true,
            pinned: true,
            delegate: SliverCustomHeaderDelegate(
              collapsedHeight: 43.0,
              expandedHeight: 220.0,
              paddingTop: 27.0,
              coverImgUrl: 'https://via.placeholder.com/350x160/1296db?text=cat',
              title: '标题',
            ),
          ),
          SliverFillRemaining(
            child: Container(
              child: Text('吸顶效果'),
            ),
          ),
        ],
      ),
    );
  }
}

class SliverCustomHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double collapsedHeight;

  ///折叠的高度
  final double expandedHeight;

  ///展开的高度
  final double paddingTop;
  final String coverImgUrl;
  final String title;

  SliverCustomHeaderDelegate({
    this.collapsedHeight = 0,
    this.expandedHeight = 0,
    this.paddingTop = 0,
    this.coverImgUrl = '',
    this.title = '',
  });

  Color makeStickyHeaderBgColor(shrinkOffset) {
    final int alpha = (shrinkOffset / (this.maxExtent - this.minExtent) * 255).clamp(0, 255).toInt();
    return Color.fromARGB(alpha, 255, 255, 255);
  }

  Color makeStickyHeaderTextColor(shrinkOffset, isIcon) {
    if (shrinkOffset <= 50) {
      return isIcon ? Colors.white : Colors.transparent;
    } else {
      final int alpha = (shrinkOffset / (this.maxExtent - this.minExtent) * 255).clamp(0, 255).toInt();
      return Color.fromARGB(alpha, 0, 0, 0);
    }
  }

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      height: this.maxExtent,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          // 背景图
          Container(child: Image.network(this.coverImgUrl, fit: BoxFit.cover)),
          // 收起头部
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            child: Container(
              color: this.makeStickyHeaderBgColor(shrinkOffset), // 背景颜色
              child: SafeArea(
                bottom: false,
                child: Container(
                  height: this.collapsedHeight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: this.makeStickyHeaderTextColor(shrinkOffset, true), // 返回图标颜色
                        ),
                        onPressed: () => Navigator.pop(context),
                      ),
                      Text(
                        this.title,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: this.makeStickyHeaderTextColor(shrinkOffset, false), // 标题颜色
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.share,
                          color: this.makeStickyHeaderTextColor(shrinkOffset, true), // 分享图标颜色
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => this.expandedHeight;

  @override
  double get minExtent => this.collapsedHeight + this.paddingTop;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
