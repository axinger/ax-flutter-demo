import 'dart:async';

import 'package:ax_flutter_toast/ax_flutter_toast.dart';
import 'package:ax_flutter_util/ax_flutter_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class P04MaterialPageDialog extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MaterialPage1();
  }
}

class _MaterialPage1 extends State<P04MaterialPageDialog> with SingleTickerProviderStateMixin {
  _TextButton(String text, VoidCallback callback) {
    return TextButton(
      child: Text(text),
      // splashColor: Colors.red,
      // color: Colors.green,
      // textColor: Colors.white,
      onPressed: callback,
    );
  }

  final _scaffoldKey = GlobalKey<ScaffoldState>();

//  var _isExpanded = false;

  List _isExpandedList = [false, false];

  AnimationController? _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

//    ClipboardData data = new ClipboardData(text: '124');
//    Clipboard.setData(data);

//    Clipboard.getData(format);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("按钮组件"),
      ),
      body: Container(
        padding: EdgeInsets.all(12),
//        color: Colors.blue,
        child: ListView(
          /// 垂直对齐
//          mainAxisAlignment: MainAxisAlignment.start,
//
//          /// 水平对齐
//          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _TextButton('Android 弹窗', () {
//              SimpleDialogOption(
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return SimpleDialog(
                    title: Text("弹窗"),
                    children: <Widget>[
                      SimpleDialogOption(
                        child: Text("选项1"),
                        onPressed: () {
                          Navigator.pop(context, "选择了1");
                        },
                      ),
                    ],
                  );
                },
              );
            }),

            _TextButton('全屏', () {
//            pop(context)
              showDialog(
                  context: context,
                  barrierDismissible: true,
                  builder: (BuildContext context) {
                    return Container(
                      width: double.infinity,
                      height: double.infinity,
                      child: Padding(
                        padding: EdgeInsets.only(left: 100, right: 100),
                        child: Container(
                          ///弹框背景和圆角
                          decoration: ShapeDecoration(
                            color: Colors.orange,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(8.0),
                              ),
                            ),
                          ),
                          child: new Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              // new CircularProgressIndicator(),
                              new Padding(
                                padding: const EdgeInsets.only(
                                  top: 20.0,
                                ),
                                // child: new Text(text),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  });
            }),

            _TextButton('Android alert', () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text("标题"),
                      content: Text("是否"),
                      actions: <Widget>[
                        _TextButton("确定", () {
                          Navigator.pop(context);
                        }),
                        _TextButton("取消", () {
                          Navigator.pop(context);
                        }),
                      ],
                    );
                  });
            }),

            _TextButton("ios alert", () {
              showCupertinoAlert(context: context, title: "标题", message: "内容");
            }),
            _TextButton('ios sheet', () {
              showCupertinoSheet(
                context: context,
                title: "标题",
                message: "内容",
                actions: <CupertinoActionSheetAction>[
                  CupertinoActionSheetAction(
                    child: Text("相机"),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  CupertinoActionSheetAction(
                    child: Text("相册"),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              );
            }),
            _TextButton("自定义 sheet", () {
              showContentSheet(
                context: context,
                content: Container(
                    height: 100,
                    child: Center(
                      child: Text("自定义内容1"),
                    )),
              );
            }),

            Column(
              children: <Widget>[
                TextField(),
                _TextButton("Toast.success", () {
                  Toast.success(
                      context: context,
                      dismissDuration: Duration(seconds: 10),
                      callBack: () {
                        print('Toast.success');
                      });
                }),
                _TextButton("Toast.failure", () {
                  Toast.failure(
                      context: context,
                      dismissDuration: Duration(seconds: 3),
                      callBack: () {
                        print('Toast.failure');
                      });
                }),
                _TextButton("Toast.error", () {
                  Toast.error(
                      context: context,
                      callBack: () {
                        print('Toast.error');
                      });
                }),
                _TextButton("Toast.showToast-1", () {
                  Toast toast = Toast.showToast(
                      context: context,
                      child: Text('showToast-1'),
                      autoDismiss: false,
                      callBack: () {
                        print('Toast.success');
                      });

                  Future.delayed(Duration(seconds: 3)).whenComplete(() {
                    toast.dismissToast();
                  });
                }),
                _TextButton("Toast.showToast-2", () {
                  Toast toast = Toast.showToast(
                      context: context,
                      child: Text('showToast-2'),
                      autoDismiss: false,
                      callBack: () {
                        print('Toast.success');
                      });

                  Future.delayed(Duration(seconds: 4)).whenComplete(() {
                    toast.dismissToast();
                  });
                }),
                _TextButton("Toast.dismissToast-1", () {}),
                _TextButton("Toast.dismissToast-2", () {}),
                _TextButton("Toast.loading", () {
                  Toast toast = Toast.loading(context: context);
                  double current = 0;
                  Timer.periodic(Duration(milliseconds: 500), (timer) {
                    current += 1;
                    var progress = current / 100;
                    print('progress= $progress');
                    toast.loadingProgress = progress;
                    if (progress == 1) {
                      toast.loadingPop();
                      timer.cancel();
                    }
                  });
                }),
              ],
            ),
            _TextButton("自定义 sheet 时间", () {
              showDateSheet(context: context);
            }),

            _TextButton("会消失的", () {
              ScaffoldMessengerState().showSnackBar(
                SnackBar(
                  content: Text('Are you talkin\' to me?'),
                  duration: Duration(seconds: 2),
                  action: SnackBarAction(label: "确定", onPressed: () {}),
                ),
              );
            }),
            _ShowSnackBar(),

            /// 上下收缩 展开 折叠组
//            _ExpansionPanelList(),

            /// 上下收缩 展开
            ExpansionPanelList(
              expansionCallback: (int panelIndex, bool isExpanded) {
                setState(() {
                  debugPrint(" panelIndex = $panelIndex  isExpanded = $isExpanded");
                  _isExpandedList[panelIndex] = !isExpanded;
                });
              },
              children: [
                ExpansionPanel(
                  headerBuilder: (BuildContext context, bool isExpanded) {
                    return Container(
                      padding: EdgeInsets.all(10),
                      child: Text("A"),
                    );
                  },
                  body: Container(
                    padding: EdgeInsets.all(10),
                    width: double.infinity,
                    child: ListBody(
                      children: <Widget>[
                        Card(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Text('我是内容'),
                        ),
                        Card(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Padding(
                            padding: EdgeInsets.all(8),
                            child: Text('我是内容'),
                          ),
                        ),
                        Card(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Padding(
                            padding: EdgeInsets.all(8),
                            child: Text('我是内容'),
                          ),
                        ),
                        Card(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Padding(
                            padding: EdgeInsets.all(8),
                            child: Text('我是内容'),
                          ),
                        ),
                        Card(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Padding(
                            padding: EdgeInsets.all(8),
                            child: Text('我是内容'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  isExpanded: _isExpandedList[0],
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () => _animationController?.forward(),
                  child: Text('Forward'),
                ),
                ElevatedButton(
                  onPressed: () => _animationController?.reverse(),
                  child: Text('Reverse'),
                ),
              ],
            ),

            ///不要被这个组件的名字迷惑了，它本质上是一个SlideTransition组件，
            ///从（0，1）移动到（0，0）
            CupertinoFullscreenDialogTransition(
//              animation: _animationController,
              linearTransition: false,
              primaryRouteAnimation: _animationController!,
              secondaryRouteAnimation: _animationController!,
              child: Container(
                color: Colors.orange,
                height: 300,
//                width: double.infinity,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

///floatingActionButton: Builder( //当BuildContext在Scaffold之前时，
///调用Scaffold.of(context)会报错。这时可以通过Builder Widget来解决
class _ShowSnackBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text("会消失的"),
      // splashColor: Colors.red,
      // color: Colors.green,
      // textColor: Colors.white,
      onPressed: () {
        ScaffoldMessengerState().showSnackBar(
          SnackBar(
            content: Text("消失"),
            backgroundColor: Colors.red,
            duration: Duration(seconds: 2),
            action: SnackBarAction(label: "确定", onPressed: () {}),
          ),
        );
      },
    );
  }
}

class AlertDialogWidget extends StatelessWidget {
  final Widget child;

  const AlertDialogWidget({required this.child});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.all(0),
      //title: Text('Rewind and remember'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(15),
            child: Center(
              child: child,
            ),
          ),
          Divider(height: 1, color: Colors.grey),
          Container(
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: <Widget>[
              TextButton(
                child: Text('我知道了'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ), // button 2
            ]),
          ),
        ],
      ),
    );
  }
}
