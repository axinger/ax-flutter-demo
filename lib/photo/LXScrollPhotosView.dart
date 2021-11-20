import 'package:flutter/material.dart';

import 'LXPhotosData.dart';

class LXScrollPhotosView extends StatefulWidget {
  //点击的当前索引
  final int currentIndex;

  //当前数据集合
  final List<LXPhotosData> currentList;

  LXScrollPhotosView({
    Key? key,
    required this.currentIndex,
    required this.currentList,
  }) : super(key: key);

  @override
  _LXScrollPhotosViewState createState() => _LXScrollPhotosViewState();
}

class _LXScrollPhotosViewState extends State<LXScrollPhotosView> {
  int _indexPage = 0;
  PageController? _pageController;

  @override
  void initState() {
    super.initState();
    _indexPage = widget.currentIndex;
    _pageController = PageController(initialPage: _indexPage, viewportFraction: 1.06);
  }

  @override
  void dispose() {
    _pageController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: Container(),
        backgroundColor: Colors.black,
        title: Text(
          '${_indexPage + 1}/${widget.currentList.length}',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          Navigator.of(context).pop();
          // return false;
        },
        child: Hero(
          tag: widget.currentList[_indexPage].imgUrl,
          child: PageView.builder(
            itemBuilder: (BuildContext context, int index) {
              return Container(
                alignment: Alignment.center,
//                  padding: EdgeInsets.symmetric(
//                      horizontal: MediaQuery.of(context).size.width * 0.03),
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    child: Image(
                      image: NetworkImage(widget.currentList[index].imgUrl),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
              );
            },
            controller: _pageController,
            scrollDirection: Axis.horizontal,
            itemCount: widget.currentList.length,
            onPageChanged: (index) {
              setState(() {
                _indexPage = index;
              });
            },
          ),
        ),
      ),
    );
  }
}
