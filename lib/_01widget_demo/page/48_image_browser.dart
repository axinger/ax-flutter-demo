import 'dart:convert';
import 'dart:io';

import 'package:ax_flutter_demo/component/dismiss_container.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

/// 图片 左右滑动浏览, 含有 == 底部重命名,右上角选择
class P47ImageBrowser extends StatefulWidget {
  final List<ImageFileInfo> imageList;

  /// 默认显示
  final int index;

  /// 是否有 右上角的 选择
  final bool isShowSelect;

  /// 右上角 选择
  final Function(int index, bool isSelected)? selectCallback;

  /// 是否显示名称
  final bool isShowName;

  /// 是否有 底部的重命名
  final bool isShowRename;

  /// 重命名回调
  final Function(int index, String name)? renameCallback;

  P47ImageBrowser({
    required this.imageList,
    this.index = 0,
    this.isShowSelect = false,
    this.selectCallback,
    this.isShowName = false,
    this.isShowRename = false,
    this.renameCallback,
  });

  @override
  _SurveyTasksImageBrowserState createState() => _SurveyTasksImageBrowserState();
}

class _SurveyTasksImageBrowserState extends State<P47ImageBrowser> {
  int _currentIndex = 0;
  List<ImageFileInfo> _imageDataList = <ImageFileInfo>[];
  PageController _pageController = PageController();

  /// 是否显示名称
  bool _isShowName = false;
  final _titleNotifier = ValueNotifier<String>('');
  final _isSelectedNotifier = ValueNotifier<bool>(false);
  final _isEditNotifier = ValueNotifier<bool>(false);
  final _nameController = TextEditingController();
  final _nameFocusNode = FocusNode();
  ImageFileInfo _currentInfo = ImageFileInfo();

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.index;
    _imageDataList = widget.imageList;

    _currentInfo = _imageDataList[_currentIndex];
    _nameController.text = _currentInfo.fileNameNoSuffix;
    _isSelectedNotifier.value = _currentInfo.isSelected;
    _titleNotifier.value = '${_currentIndex + 1} / ${_imageDataList.length}';
    _pageController = PageController(initialPage: widget.index);
    _isShowName = widget.isShowRename;
    if (widget.isShowRename) {
      _isShowName = true;
    }
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
  }

  void _onPageChanged(int index) {
    _currentIndex = index;
    _currentInfo = _imageDataList[_currentIndex];
    _nameController.text = _currentInfo.fileNameNoSuffix;
    _isSelectedNotifier.value = _currentInfo.isSelected;
    _titleNotifier.value = '${_currentIndex + 1} / ${_imageDataList.length}';
  }

  @override
  Widget build(BuildContext context) {
    return DismissContainer(
      child: Stack(
        children: [
          Scaffold(
            backgroundColor: Colors.black,
            appBar: AppBar(
              title: ValueListenableBuilder(
                valueListenable: _titleNotifier,
                builder: (BuildContext context, String value, Widget? child) {
                  return Text(
                    value,
                    style: TextStyle(color: Colors.white),
                  );
                },
              ),
              backgroundColor: Colors.black,
              centerTitle: true,
              iconTheme: IconThemeData(color: Colors.white),
              actions: _rightSelect,
            ),
            body: Column(
              children: <Widget>[
                Expanded(
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      PhotoViewGallery.builder(
                        scrollDirection: Axis.horizontal,
                        scrollPhysics: const BouncingScrollPhysics(),
                        // loadFailedChild: Text('加载失败'),
                        loadingBuilder: (BuildContext context, ImageChunkEvent? event) {
                          return Text('加载中');
                        },
                        builder: (BuildContext context, int index) {
                          var item = _imageDataList[index];
                          return PhotoViewGalleryPageOptions(
                            imageProvider: ImageFileTypeImageProvider(item),
                            initialScale: PhotoViewComputedScale.contained * 1,

                            /// hero 动画
                            heroAttributes: PhotoViewHeroAttributes(tag: '1'),
                          );
                        },
                        itemCount: _imageDataList.length,
                        // loadingChild: widget.loadingChild,
                        backgroundDecoration: BoxDecoration(
                          color: Colors.black,
                        ),
                        pageController: _pageController,
                        onPageChanged: _onPageChanged,
                      ),

                      /// 文件名 显示再图片上层
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: _showNameBtn,
                      )
                    ],
                  ),
                ),
                _showRenameAction,
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// 右上角的选择
  List<Widget> get _rightSelect {
    return [
      !widget.isShowSelect
          ? Container(
              width: 0,
              height: 0,
            )
          : ValueListenableBuilder<bool>(
              valueListenable: _isSelectedNotifier,
              builder: (BuildContext context, value, Widget? child) {
                return IconButton(
                  onPressed: () {
                    _isSelectedNotifier.value = !_isSelectedNotifier.value;
                    _currentInfo.isSelected = !_currentInfo.isSelected;
                    if (widget.selectCallback != null) {
                      widget.selectCallback!(_currentIndex, _isSelectedNotifier.value);
                    }
                  },
                  icon: Image.asset(
                    value ? 'assets/image/album/selected.png' : 'assets/image/album/un_selected.png',
                    width: 25,
                    height: 25,
                  ),
                );
              },
            )
    ];
  }

  /// 文件名
  Widget get _showNameBtn {
    return !_isShowName
        ? Container(width: 0, height: 0)
        : ValueListenableBuilder(
            valueListenable: _isEditNotifier,
            builder: (BuildContext context, bool value, Widget? child) {
              return Container(
                color: Color(0xff000000).withOpacity(0.4),
                padding: EdgeInsets.all(10.0),
                height: 60,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    TextField(
                      controller: _nameController,
                      focusNode: _nameFocusNode,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(top: 0, bottom: 0, left: 10, right: 10),

                        fillColor: !value ? Colors.transparent : Color(0xff464647),
                        filled: true,

                        ///选中时外边框颜色
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                            color: Color(0xff828181),
                          ),
                        ),

                        ///未选中时候的颜色
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),

                    /// 键盘有问题,使用包一层,阻挡手势
                    value
                        ? Container(width: 0, height: 0)
                        : Container(
                            alignment: Alignment.center,
                            color: Colors.transparent,
                          ),
                  ],
                ),
              );
            },
          );
  }

  /// 重命名
  Widget get _showRenameAction {
    return !widget.isShowRename
        ? Container(width: 0, height: 0)
        : Container(
            padding: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
            child: ValueListenableBuilder(
              valueListenable: _isEditNotifier,
              builder: (BuildContext context, bool value, Widget? child) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: !value
                      ? [
                          GestureDetector(
                            child: Text(
                              '重命名',
                              style: TextStyle(color: Colors.white, fontSize: 16),
                            ),
                            onTap: () {
                              FocusScope.of(context).requestFocus(_nameFocusNode);
                              _isEditNotifier.value = true;
                            },
                          )
                        ]
                      : [
                          GestureDetector(
                            child: Text('取消', style: TextStyle(color: Colors.white, fontSize: 16)),
                            onTap: () {
                              _isEditNotifier.value = false;
                              _nameFocusNode.unfocus();
                              _nameController.text = _imageDataList[_currentIndex].fileNameNoSuffix;
                            },
                          ),
                          GestureDetector(
                            child: Text('完成', style: TextStyle(color: Colors.white, fontSize: 16)),
                            onTap: () {
                              _isEditNotifier.value = false;
                              _nameFocusNode.unfocus();
                              _currentInfo.fileNameNoSuffix = _nameController.text;
                              if (widget.renameCallback != null) {
                                widget.renameCallback!(_currentIndex, _currentInfo.fileName);
                              }
                            },
                          ),
                        ],
                );
              },
            ),
          );
  }
}

enum ImageFileType {
  /// 本地
  local,
  http,
  base64,
}

enum ImageFileUploadState {
  none,
  loading,
  success,
  fail,
}

T? asT<T>(dynamic value) {
  if (value is T) {
    return value;
  }

  return null;
}

class ImageFileInfo {
  ImageFileInfo({
    this.fileName = 'jim.png',
    this.fileBase64 = '',
    this.httpUrl = '',
    this.localPath = '',
    this.isSelected = false,
    this.type = ImageFileType.base64,
  });

  String fileBase64;
  String fileName;

  /// 相机拍照时候,存在本地路径
  String localPath;
  bool isSelected;
  ImageFileType type;
  int index = 0;
  String httpUrl;

  /// 回传值 - 上传转态,
  ImageFileUploadState state = ImageFileUploadState.none;

  String get fileNameNoSuffix {
    return fileName.split('.').first;
  }

  set fileNameNoSuffix(String name) {
    fileName = '$name.${fileName.split('.').last}';
  }

  @override
  String toString() {
    return json.encode(this);
  }
}

class TagList {
  TagList({
    this.tagCode = '',
    this.tagPropertyCode = '',
    this.tagPropertyVal = '',
  });

  // factory TagList.fromJson(Map<String, dynamic> jsonRes) => jsonRes == null
  //     ? null
  //     : TagList(
  //         tagCode: asT<String>(jsonRes?['tagCode']) ??'',
  //         tagPropertyCode: asT<String>(jsonRes['tagPropertyCode']),
  //         tagPropertyVal: asT<String>(jsonRes['tagPropertyVal']),
  //       );

  String tagCode;
  String tagPropertyCode;

  ///标签值文字描述
  String tagPropertyVal;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'tagCode': tagCode,
        'tagPropertyCode': tagPropertyCode,
        'tagPropertyVal': tagPropertyVal,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}

class LoadNetworkImage extends StatelessWidget {
  final String url;

  LoadNetworkImage({required this.url});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      fit: BoxFit.cover,
      placeholder: (BuildContext context, String url) {
        return Image.asset('assets/image/placeholder.png');
      },
    );
  }
}

/// 不同图片类型,返回不同view
class ImageFileTypeView extends StatelessWidget {
  final ImageFileInfo? info;

  ImageFileTypeView({
    this.info,
  });

  @override
  Widget build(BuildContext context) {
    Widget child;

    switch (info?.type) {
      case ImageFileType.local:
        child = Image.file(File(info!.localPath), fit: BoxFit.fill);
        break;
      case ImageFileType.http:
        child = LoadNetworkImage(url: info!.httpUrl);
        break;
      case ImageFileType.base64:
        child = Image.memory(Base64Decoder().convert(info!.fileBase64), fit: BoxFit.fill);
        break;
      default:
        child = Container();
        break;
    }
    return Container(
      /// 超出部分剪切
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: Colors.transparent,
//        border: Border.all(color: Colors.red,width: 1),
//        borderRadius: BorderRadius.all(Radius.circular(6)),
      ),
      child: ClipRRect(
//        borderRadius: BorderRadius.circular(5),
        child: child,
      ),
    );
  }
}

ImageProvider? ImageFileTypeImageProvider(ImageFileInfo model) {
  switch (model.type) {
    case ImageFileType.local:
      return FileImage(File(model.localPath));
    case ImageFileType.http:
      return CachedNetworkImageProvider(model.httpUrl);
    case ImageFileType.base64:
      return MemoryImage(Base64Decoder().convert(model.fileBase64));
    default:
      return null;
  }
}
