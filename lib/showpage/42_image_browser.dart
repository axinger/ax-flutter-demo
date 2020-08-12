import 'package:ax_flutter_demo/photo/LXPhotosData.dart';
import 'package:ax_flutter_demo/photo/LXScrollPhotosView.dart';
import 'package:ax_flutter_demo/photo/image_browser.dart';
import 'package:ax_flutter_util/ax_flutter_util.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class P42ImageBrowser extends StatefulWidget {
  @override
  _P42ImageBrowserState createState() => _P42ImageBrowserState();
}

class _P42ImageBrowserState extends State<P42ImageBrowser> {
  var photoList = <ImageBrowserItem>[
    ImageBrowserItem(
        url:
            'https://t8.baidu.com/it/u=1484500186,1503043093&fm=79&app=86&size=h300&n=0&g=4n&f=jpeg?sec=1597713678&t=c028e49884a24624abee0e68eed45a23'),
    ImageBrowserItem(
        url:
            'https://t8.baidu.com/it/u=2247852322,986532796&fm=79&app=86&size=h300&n=0&g=4n&f=jpeg?sec=1597713678&t=0ec67748e925da17f70d96312b41616e'),
    ImageBrowserItem(
        url:
            'https://t7.baidu.com/it/u=3204887199,3790688592&fm=79&app=86&size=h300&n=0&g=4n&f=jpeg?sec=1597713678&t=fdf2e8ea73ef0a59c69588ff75b80e89'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('图片浏览器'),
      ),
      body: Column(
        children: <Widget>[
          FlatButton(
            child: Text('图片'),
            onPressed: () {
              push(
                  context: context,
                  widget: LXScrollPhotosView(
                    currentIndex: 2,
                    currentList: [
                      LXPhotosData(
                          'https://t8.baidu.com/it/u=1484500186,1503043093&fm=79&app=86&size=h300&n=0&g=4n&f=jpeg?sec=1597713678&t=c028e49884a24624abee0e68eed45a23'),
                      LXPhotosData(
                          'https://t8.baidu.com/it/u=2247852322,986532796&fm=79&app=86&size=h300&n=0&g=4n&f=jpeg?sec=1597713678&t=0ec67748e925da17f70d96312b41616e'),
                      LXPhotosData(
                          'https://t7.baidu.com/it/u=3204887199,3790688592&fm=79&app=86&size=h300&n=0&g=4n&f=jpeg?sec=1597713678&t=fdf2e8ea73ef0a59c69588ff75b80e89'),
                    ],
                  ));
            },
          ),
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              print('1111111111');
            },
            child: Container(
              width: 100,
              height: 100,
              color: Colors.green,
              alignment: Alignment.topLeft,
              child:  IgnorePointer(
              ignoring: false,
                child: RaisedButton(
                  onPressed: () => print('IgnorePointer Clicked!'),
                  child: Text('IgnorePointer'),
                ),
              ),

//              child: AbsorbPointer(
//                absorbing: false,
//                child: Container(
//                  width: 50,
//                  height: 50,
//                  color: Colors.red,
//                ),
//              ),
            ),




          ),
          _meetingPhotos(context),
        ],
      ),
    );
  }

  Widget _meetingPhotos(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(32, 16, 32, 8),
      child: GridView.builder(
        shrinkWrap: true,
        //解决 listview 嵌套报错
        physics: NeverScrollableScrollPhysics(),
        //禁用滑动事件
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //横轴元素个数
            crossAxisCount: 3,
            //纵轴间距
            mainAxisSpacing: 10.0,
            //横轴间距
            crossAxisSpacing: 10.0,
            //子组件宽高长度比例
            childAspectRatio: 1.0),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              _jumpToGallery(index, photoList);
            },
            child: Image.network(
              photoList[index].url,
              fit: BoxFit.cover,
            ),
          );
        },
        itemCount: photoList.length,
      ),
    );
  }

  //jump to photo gallery
  void _jumpToGallery(index, list) {
    push(
      context: context,
      widget: ImageBrowser(
        index: index,
        imageList: list,
      ),
    );
  }
}

class PhotpGalleryPage extends StatefulWidget {
  final List photoList;
  final int index;

  PhotpGalleryPage({this.photoList, this.index});

  @override
  _PhotpGalleryPageState createState() => _PhotpGalleryPageState();
}

class _PhotpGalleryPageState extends State<PhotpGalleryPage> {
  int currentIndex = 0;
  int initialIndex; //初始index
  int length;
  int title;

  @override
  void initState() {
    currentIndex = widget.index;
    initialIndex = widget.index;
    length = widget.photoList.length;
    title = initialIndex + 1;
    super.initState();
  }

  void onPageChanged(int index) {
    setState(() {
      currentIndex = index;
      title = index + 1;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${title} / ${length}'),
        centerTitle: true,
      ),
      body: Container(
          decoration: BoxDecoration(
            color: Colors.black,
          ),
          constraints: BoxConstraints.expand(
            height: MediaQuery.of(context).size.height,
          ),
          child: Stack(
            alignment: Alignment.bottomRight,
            children: <Widget>[
              PhotoViewGallery.builder(
                scrollDirection: Axis.horizontal,
                scrollPhysics: const BouncingScrollPhysics(),
                builder: (BuildContext context, int index) {
                  return PhotoViewGalleryPageOptions(
                    imageProvider:
                        NetworkImage(widget.photoList[index]['image']),
                    initialScale: PhotoViewComputedScale.contained * 1,
//                    heroTag: widget.photoList[index]['id'],
                  );
                },
                itemCount: widget.photoList.length,
                // loadingChild: widget.loadingChild,
                backgroundDecoration: BoxDecoration(
                  color: Colors.black,
                ),
                pageController: PageController(initialPage: initialIndex),
                //点进去哪页默认就显示哪一页
                onPageChanged: onPageChanged,
              ),
              Container(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "Image ${currentIndex + 1}",
                  style: const TextStyle(
                      color: Colors.white, fontSize: 17.0, decoration: null),
                ),
              )
            ],
          )),
    );
  }
}
