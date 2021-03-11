import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:screenshot/screenshot.dart';

class P25MoreListViewPage extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<P25MoreListViewPage> {
  GlobalKey screenshotsKey = GlobalKey();

  List<Uint8List> images = <Uint8List>[];

  ScreenshotController screenshotController = ScreenshotController();

  Future<Uint8List?> _capturePng() async {
    try {
      var boundary = screenshotsKey.currentContext?.findRenderObject();

      /// 设备分辨率
      double pixelRatio = window.devicePixelRatio;
      var image = await (boundary as RenderRepaintBoundary)
          .toImage(pixelRatio: pixelRatio);

      /// png格式
      ByteData byteData =
          (await image.toByteData(format: ImageByteFormat.png))!;
      Uint8List pngBytes = byteData.buffer.asUint8List();

      // bool result = await ImageGallerySaver.saveImage(pngBytes); //这个是核心的保存图片的插件
//
//      showCupertinoCertainAlert(
//          context: context, title: result ? '保存成功' : '保存失败');
      return pngBytes;
    } catch (e) {
      print('截图失败 = $e');
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(
          'listview拼接,\n子禁止滚动',
        ),
        actions: <Widget>[
          TextButton(
            child: Text("截图"),
            onPressed: () {
              screenshotController
                  .capture(delay: Duration(milliseconds: 10))
                  .then((Uint8List? image) async {
                // _imageFile = image;
                if (image != null) {
                  // Get.showSnackbar(GetBar(
                  //   title: '截屏',
                  //   message: 'aa',
                  //   backgroundColor: Colors.red,
                  //   // icon: Image.memory(image),
                  // ));

                }
              }).catchError((onError) {
                print(onError);
              });
            },
          ),
        ],
      ),
      body: FutureBuilder<String>(
          future: _netData(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: Text("等待..."),
              );
            } else {
              print("snapshot.data = ${snapshot.data ?? ''}");
              // return Center(
              //   child: Text("有数据..."),
              // );
              /// 截图  ListView.builder 必须包裹一层滚动的视图,比如SingleChildScrollView
              // return SingleChildScrollView(
              //   // physics:NeverScrollableScrollPhysics(),//禁用滑动事件
              //   child: RepaintBoundary(
              //     ///截图需要的key
              //     key: screenshotsKey!,
              //     // child: Text("有数据..."),
              //     child: Container(
              //       color: Colors.orange,
              //       child: Column(
              //         children: <Widget>[
              //           Text('22'),
              //
              //           Expanded(
              //             // flex: 1,
              //             child: ListView.builder(
              //                 physics:NeverScrollableScrollPhysics(),//禁用滑动事件
              //                 shrinkWrap: true,
              //                 itemCount: 100,
              //                 semanticChildCount:0,
              //                 itemBuilder: (BuildContext context, int index) {
              //                   // return Text('内容 - $index');
              //                   return  Text('11');
              //                 }),
              //           ),
              //           Text('33'),
              //         ],
              //       ),
              //     ),
              //   ),
              // );

              return Screenshot(
                ///截图需要的key
                controller: screenshotController,
                // child: Text("有数据..."),
                child: Container(
                  color: Colors.orange,
                  child: Column(
                    children: <Widget>[
                      Text('22'),
                      Expanded(
                        // flex: 1,
                        child: ListView.builder(
                            // physics:NeverScrollableScrollPhysics(),//禁用滑动事件
                            shrinkWrap: true,
                            itemCount: 100,
                            semanticChildCount: 0,
                            itemBuilder: (BuildContext context, int index) {
                              return Text('内容 - $index');
                            }),
                      ),
                      Text('33'),
                    ],
                  ),
                ),
              );
            }
          }),
    );
  }

  Future<String> _netData() async {
    await Future.delayed(Duration(seconds: 1));
    return "1";
  }
}
