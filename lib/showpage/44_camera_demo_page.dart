import 'dart:async';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:path_provider/path_provider.dart';

class CameraDemoPage extends StatefulWidget {
  /// TODO
  /// 提供是否显示隐藏切换摄像头的flag
  /// 提供是否预览图片的flag
  /// 回调函数（可以将控制预览图片放到这里）
  @override
  CameraDemoPageState createState() {
    return CameraDemoPageState();
  }
}

class CameraDemoPageState extends State<CameraDemoPage> {
  CameraController controller;
  String videoPath;
  VoidCallback videoPlayerListener;
  WidgetsBinding widgetsBinding;

  /// 摄像头权限
  List<CameraDescription> cameras;
  String photoType = '';

  /// 图片地址
  var photoPathList = <String>[];
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    getCameras();
  }

  /// 获取权限
  Future<void> getCameras() async {
// Fetch the available cameras before initializing the app.
    try {
      cameras = await availableCameras();

      /// TODO同时只能选择一个，可以提供切换按钮，传入参数控制是否展示切换按钮
      onNewCameraSelected(cameras[0]); // 后置摄像头
// onNewCameraSelected(cameras[1]);// 前置摄像头
    } on CameraException catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: Colors.black,
        ),
        body: Container(
          color: Colors.black,
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 5, //flex用来设置当前可用空间的占优比
                child: Stack(children: <Widget>[
                  _cameraPreviewWidget(), //相机视图
                ]),
              ),
              Expanded(
                flex: 1,
                child: _takePictureLayout(), //拍照操作区域布局
              ),
            ],
          ),
        ));
  }

  Widget _takePictureLayout() {
    var url = (photoPathList?.isNotEmpty ?? false) ? photoPathList.last : '';
    double wh = 60;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          clipBehavior: Clip.hardEdge,
          margin: EdgeInsets.only(left: 20, top: 20, bottom: 20, right: 10),
          width: wh,
          height: wh,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: url.isEmpty
              ? null
              : Stack(
                  clipBehavior: Clip.none,
                  overflow: Overflow.visible,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      clipBehavior: Clip.hardEdge,
                      child: Image.file(
                        File(url),
                        fit: BoxFit.fill,
                        width: wh,
                        height: wh,
                      ),
                    ),
                    Positioned(
                      top: -7,
                      right: -7,
                      child: CircleAvatar(
                        radius: 7,
                        backgroundColor: Colors.red,
                        child: Text(
                          photoPathList?.length?.toString() ?? '',
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                    ),
                  ],
                ),
        ),
        Container(
          alignment: Alignment.center,
          child: IconButton(
            iconSize: 50.0,
            onPressed: controller != null &&
                    controller.value.isInitialized &&
                    !controller.value.isRecordingVideo
                ? onTakePictureButtonPressed
                : null,
            icon: Icon(
              Icons.camera_alt,
              color: Colors.white,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 20, right: 20),
          width: 50,
          height: 50,
          color: Colors.transparent,
        ),
      ],
    );
  }

  Widget _cameraPreviewWidget() {
    if (controller == null || !controller.value.isInitialized) {
      return const Text(
        '相机',
        style: TextStyle(
          color: Colors.white,
          fontSize: 24.0,
          fontWeight: FontWeight.w900,
        ),
      );
    } else {
      return Container(
        width: double.infinity,
        child: AspectRatio(
          aspectRatio: controller.value.aspectRatio,
          child: CameraPreview(controller),
        ),
      );
    }
  }

  Widget getPhotoPreview() {
    /// TODO 可以在这里添加预览图片
    /// 比如判断是否有图片地址，有就展示，没有就不展示
    return Container(
      height: 1.0,
      width: 1.0,
      alignment: Alignment.bottomLeft,
    );
  }

  String timestamp() => DateTime.now().millisecondsSinceEpoch.toString();

  ///TODO 预留重新拍摄
  void onNewCameraSelected(CameraDescription cameraDescription) async {
    if (controller != null) {
      await controller.dispose();
    }
    controller = CameraController(cameraDescription, ResolutionPreset.high);
    try {
      await controller.initialize();
    } on CameraException catch (e) {}

    if (mounted) {
      setState(() {});
    }
  }

  /// TODO 拍照按钮，可以考虑与回调函数结合去操作图片
  /// TODO 图片保存CommonSaveImg.saveImg(shareInfo.img)
  /// TODO 图片保存入参是Uint8List格式需要处理下
  /// TODO 理赔如果需要单次查勘，可以选择保存到磁盘（以当天为时间戳创建文件夹？.不确定）
  void onTakePictureButtonPressed() {
    takePicture().then((String filePath) {
      if (mounted && filePath != null) {
        if (filePath != null) {
          setState(() {
//            photoPath = filePath;

            photoPathList.add(filePath);
          });
        }
      }
    });
  }

  Future<String> takePicture() async {
    final Directory extDir = await getApplicationDocumentsDirectory();
    final String dirPath = '${extDir.path}/Pictures/flutter_test';
    await Directory(dirPath).create(recursive: true);
    final String filePath = '$dirPath/${timestamp()}.jpg';

    if (controller.value.isTakingPicture) {
      return null;
    }

    try {
      await controller.takePicture(filePath);
    } on CameraException catch (e) {
      return null;
    }
    return filePath;
  }

// 根据图片名字获取图片文件
  Future<File> getCompressImage(File file, String targetPath) async {
    var path = file.absolute.path;
    var result = await FlutterImageCompress.compressAndGetFile(
      path,
      targetPath,
      quality: 88,
      rotate: 180,
    );
    return result;
  }

  Future<String> getTempDir() async {
    var dir = await getTemporaryDirectory();
    var targetPath = dir.absolute.path + "/temp.jpg";
    return targetPath;
  }
}
