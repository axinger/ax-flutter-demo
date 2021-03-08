//import 'package:flutter/material.dart';
//import 'package:photo_view/photo_view.dart';
//import 'package:photo_view/photo_view_gallery.dart';
//
//class ImageBrowserItem {
//  final String url;
//  final String title;
//  ImageBrowserItem({this.title,this.url});
//
//}
//
//class ImageBrowser extends StatefulWidget {
//
//  final List<ImageBrowserItem> imageList;
//  final int index;
//  ImageBrowser({required this.imageList,this.index=0});
//
//  @override
//  _ImageBrowserState createState() => _ImageBrowserState();
//}
//
//class _ImageBrowserState extends State<ImageBrowser> {
//
//  int currentIndex = 0;
//  int initialIndex; //初始index
//  int length;
//  int title;
//
//
//  @override
//  void initState() {
//    super.initState();
//    currentIndex = widget.index;
//    initialIndex = widget.index;
//    length = widget.imageList.length;
//    title = initialIndex + 1;
//  }
//
//  void onPageChanged(int index) {
//    setState(() {
//      currentIndex = index;
//      title = index + 1;
//    });
//  }
//
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text('${title} / ${length}'),
//        centerTitle: true,
//      ),
//      body: Container(
//          decoration: BoxDecoration(
//            color: Colors.black,
//          ),
//          constraints: BoxConstraints.expand(
//            height: MediaQuery.of(context).size.height,
//          ),
//          child: Stack(
//            alignment: Alignment.bottomRight,
//            children: <Widget>[
//              PhotoViewGallery.builder(
//                scrollDirection: Axis.horizontal,
//                scrollPhysics: const BouncingScrollPhysics(),
//                builder: (BuildContext context, int index) {
//
//                  return PhotoViewGalleryPageOptions(
//                    imageProvider: NetworkImage(widget.imageList[index].url),
//                    initialScale: PhotoViewComputedScale.contained * 1,
////                    heroTag: widget.photoList[index]['id'],
//                  );
//                },
//                itemCount: widget.imageList.length,
//                // loadingChild: widget.loadingChild,
//                backgroundDecoration: BoxDecoration(
//                  color: Colors.black,
//                ),
//                pageController: PageController(initialPage: initialIndex), //点进去哪页默认就显示哪一页
//                onPageChanged: onPageChanged,
//              ),
//              Container(
//                padding: const EdgeInsets.all(10.0),
//                child: Text(
//                  "Image ${currentIndex + 1}",
//                  style: const TextStyle(color: Colors.white, fontSize: 17.0, decoration: null),
//                ),
//              )
//            ],
//          )),
//    );
//  }
//}
