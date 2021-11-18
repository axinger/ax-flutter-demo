import 'package:ax_flutter_demo/util/utils.dart';
import 'package:flutter/material.dart';

import '48_image_browser.dart';

/// 相册
class P48PhotoAlbum extends StatefulWidget {
  @override
  _P48PhotoAlbumState createState() => _P48PhotoAlbumState();
}

class _P48PhotoAlbumState extends State<P48PhotoAlbum> {
  List<ImageFileInfo> photoDataList = [];

  @override
  void initState() {
    super.initState();
    photoDataList = Utils.netIms().map((e) {
      return ImageFileInfo(type: ImageFileType.http, httpUrl: e);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('相册'),
      ),
      body: _meetingPhotos(context),
    );
  }

  /// 预览按钮事件
  void _preview(int index) {
    _jumpToGallery(index, photoDataList);
  }

  Widget _meetingPhotos(BuildContext context) {
    return Container(
//      padding: EdgeInsets.all(0),
      child: PhotoAlbumGridView(
        itemCount: photoDataList.length,
        itemBuilder: (BuildContext context, int index) {
          var imageItem = photoDataList[index];
          return _PhotoAlbumCell(
            imageItem: imageItem,
            onTap: () {
              _preview(index);
            },
          );
        },
      ),
    );
  }

  void _jumpToGallery(index, List<ImageFileInfo> list) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return P47ImageBrowser(
            index: index,
            imageList: list,
            renameCallback: (index, name) {},
          );
        },
      ),
    );
  }
}

class _PhotoAlbumCell extends StatefulWidget {
  final ImageFileInfo? imageItem;

  /// 选中
  final Function(bool isSelected)? selectCallBack;

  /// 点击其他空白
  final Function()? onTap;

  _PhotoAlbumCell({
    this.imageItem,
    this.selectCallBack,
    this.onTap,
  });

  @override
  _PhotoAlbumCellState createState() => _PhotoAlbumCellState();
}

class _PhotoAlbumCellState extends State<_PhotoAlbumCell> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: widget.onTap,
        child: Stack(
          alignment: Alignment.center,
          fit: StackFit.expand,
          children: <Widget>[
            ImageFileTypeView(info: widget.imageItem!),
          ],
        ));
  }
}

/// 各种 相册的默认, 布局,数量,间距
class PhotoAlbumGridView extends StatefulWidget {
  final int itemCount;
  final Widget Function(BuildContext context, int index) itemBuilder;

  PhotoAlbumGridView({
    required this.itemCount,
    required this.itemBuilder,
  });

  @override
  _PhotoAlbumGridViewState createState() => _PhotoAlbumGridViewState();
}

class _PhotoAlbumGridViewState extends State<PhotoAlbumGridView> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisSpacing: 1.0,
        crossAxisSpacing: 1.0,

        ///子组件宽高长度比例
        childAspectRatio: 1.0,
      ),
      itemCount: widget.itemCount,
      itemBuilder: widget.itemBuilder,
    );
  }
}
