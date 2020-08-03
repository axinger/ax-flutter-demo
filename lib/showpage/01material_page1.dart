import 'dart:async';
import 'dart:ui';

import 'package:ax_flutter_demo/config.dart';
import 'package:ax_flutter_util/ax_flutter_util.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../global_const.dart';

class MaterialPage1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyPage();
  }
}

class _MyPage extends State<MaterialPage1> {
  /// 悬浮按钮
  final _floatingActionButton = FloatingActionButton(
    onPressed: () {},
    child: Icon(Icons.add),
    backgroundColor: Colors.orange,

    ///形状,默认圆形
//    shape: BeveledRectangleBorder(),

    /// 阴影
    elevation: 0,
  );

  bool isOffstage = false;
  bool isVisibility = false;
  bool isBack = true;

  Visibility abv = Visibility(
    visible: true,
    child: Container(
      color: Colors.lightGreen,
      height: 50,
    ),
  );

  StreamController<bool> _streamController = StreamController<bool>();
  bool _isShow = true;

  ValueNotifier<bool> isAbsorbPointer = ValueNotifier(true);

  @override
  void dispose() {
    super.dispose();
    _streamController?.close();
  }

  _popupMenuItem(String title, {String imagePath, IconData icon}) {
    return PopupMenuItem(
      child: Row(
        children: <Widget>[
          imagePath != null
              ? Image.asset(
                  imagePath,
                  width: 30.0,
                  height: 30.0,
                )
              : SizedBox(
                  width: 30.0,
                  height: 30.0,
                  child: Icon(
                    icon,
                    color: Colors.white,
                  ),
                ),
          Container(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text(
              title,
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (isBack) {
          return true;
        }

        Navigator.of(context).pushNamed('/sub2', arguments: {
          'title': '透传title',
          'name': 'postbird',
          'passw': '123456'
        });

        return false;
//        return await showAlert(
//            context: context,
//            title: '确定返回吗?',
//            cancelCallback: () {},
//            certainCallback: () {});
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            '测试',
            style: TextStyle(color: Colors.red),
          ),
          centerTitle: true,

//          backgroundColor: Colors.orange,
          actions: <Widget>[

            FlatButton(
              color: Colors.orange,
              child: Text('改变主题色'),
              onPressed: () {


                showCupertinoSheet(
                  context: context,
                  actions: <CupertinoActionSheetAction>[
                    CupertinoActionSheetAction(
                      child: Text('蓝色'),
                      onPressed: () {
                        mainConfigModel.themeData = Theme.of(context).copyWith(
                          primaryColor: Colors.lightBlue,
                        );
                        Navigator.pop(context);
                      },
                    ),
                    CupertinoActionSheetAction(
                      child: Text('红色'),
                      onPressed: () {
                        Navigator.pop(context);
                        mainConfigModel.themeData = Theme.of(context).copyWith(
                          primaryColor: Colors.red,
                        );
                      },
                    ),
                  ],
                );
              },
            ),
          ],
        ),

        /// 悬浮按钮
        floatingActionButton: _floatingActionButton,
//        floatingActionButton: _FloatingActionButton2,
        ///  悬浮按钮 位置 endDocked 有叠合效果 endFloat
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: StreamBuilder<bool>(
            // 监听Stream，每次值改变的时候，更新Text中的内容
            stream: _streamController.stream,

            /// 第一次监听值
            initialData: _isShow,
            builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
              print('snapshot.data = ${snapshot?.data}');

              return BottomAppBar(
                color: Colors.red,

                /// 直接用_isShow 方便控制,比snapshot?.data 不知道为什么
                child: (!_isShow)
                    ? null
                    : Container(
                        height: 80,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,

                          ///交叉轴的布局方式，对于column来说就是水平方向的布局方式
                          crossAxisAlignment: CrossAxisAlignment.end,
                          verticalDirection: VerticalDirection.down,
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: Container(
                                /// 充满 容器
                                alignment: Alignment.center,
                                color: Colors.orange,
                                child: FlatButton(
                                  child: Text('请求'),
                                  onPressed: () async {
                                    var options = BaseOptions(
                                      connectTimeout: 15000,
                                      receiveTimeout: 15000,
//                                      responseType: ResponseType.plain,
//                                      validateStatus: (status) {
//                                        print('status = $status');
//                                        // 不使用http状态码判断状态，使用AdapterInterceptor来处理（适用于标准REST风格）
//                                        return false;
//                                      },
                                      baseUrl: 'http://localhost:8080',
                                    );

                                    Map<String, dynamic> params = {
                                      'name': 'jim',
                                    };

                                    Dio _dio =  Dio(options); // 使用默认配置

                                    _dio.post(
                                      '/test6',
                                      data:params,
                                    ).catchError((onError){
                                      print('onError = $onError');
                                    }).then((value){
                                      print('response = ${value}');
                                    });



//                                    try{
//                                      Response response = await Dio().get(
//                                          'http://127.0.0.1:8080//test4?name=jim'
//                                      );
//                                       print(response);
//                                    }catch(e){
//                                       print(e);
//                                    }

                                  },
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 1,
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                /// 充满 容器
                                alignment: Alignment.center,
                                color: Colors.orange,
                                child: FlatButton(
                                  onPressed: () {},
                                  child: Text('按钮1'),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                /// 切形状 自动根据被 重叠部分
//              shape: CircularNotchedRectangle(),
              );
            }),
        persistentFooterButtons: [
          Text('A'),
          Text('B'),
          Text('C'),
        ],

        body: Container(
//        padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/image/IMG_3601.JPG'),
              fit: BoxFit.cover,
//              repeat :ImageRepeat.repeatY
            ),
            color: Colors.blue,
          ),
          child: ListView(
//          padding: EdgeInsets.all(20),
            children: [
//            Column(
//              /// 垂直对齐
//              mainAxisAlignment: MainAxisAlignment.start,
//
//              /// 水平对齐
//              crossAxisAlignment: CrossAxisAlignment.start,
//              children: <Widget>[
              Image.asset(
                assetsOfImagePath('/A171.jpg'),
                fit: BoxFit.fill,
              ),
//            Row(
//              children: <Widget>[

              Text('Expanded 等比分布,撑满剩余空间'),
              Row(
                children: <Widget>[
                  Text('头'),
                  Expanded(
                    child: Container(
                      color: Colors.red,
                      child: Text(
                        'aa',
                        maxLines: 1,
                      ),
                    ),
                  ),
                  Text('尾部'),
                  Text('尾部'),
                ],
              ),

              Row(children: <Widget>[
                Container(
                  width: 20,
                  height: 100,
                  color: Colors.orange,
                ),
                new Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () {
                      print('===========');
                    },
                    child: Container(
                      child: new Text('Text1', textAlign: TextAlign.center),
                      height: 100,
                      alignment: AlignmentDirectional.center,
                      color: Colors.grey,
                    ),
                  ),
                ),
                new Expanded(
                  flex: 1,
                  child: new Container(
                    child: new Text('Text2', textAlign: TextAlign.center),
                    height: 100,
                    alignment: AlignmentDirectional.center,
                    color: Colors.blue,
                  ),
                ),
                new Expanded(
                  flex: 1,
                  child: new Container(
                    child: new Text('Text3', textAlign: TextAlign.center),
                    height: 100,
                    alignment: AlignmentDirectional.center,
                    color: Colors.cyan,
                  ),
                ),
              ]),

              Row(
                children: <Widget>[
                  Text('头'),
                  Expanded(
                    child: Text(
                      'A=============================================================A',
                      maxLines: 1,
                    ),
                  ),
                  Text('尾部'),
                ],
              ),

              FlatButton(
                child: Text('控制是否可以直接返回'),
                splashColor: Colors.red,
                color: Colors.green,
                textColor: Colors.white,
                onPressed: () {
                  isBack = !isBack;
                },
              ),
              SizedBox(
                height: 20,
              ),
              FlatButton(
                child: Text('显示隐藏-Visibility'),
                splashColor: Colors.red,
                color: Colors.green,
                textColor: Colors.white,
                onPressed: () {
                  setState(() {
                    isVisibility = !isVisibility;
                  });
                },
              ),
              FlatButton(
                child: Text('显示隐藏-Offstage'),
                splashColor: Colors.red,
                color: Colors.green,
                textColor: Colors.white,
                onPressed: () {
                  setState(() {
                    isOffstage = !isOffstage;
                  });
                },
              ),
              Visibility(
                visible: isVisibility,
                child: Container(
                  color: Colors.indigo,
                  height: 50,
                ),
              ),
              Offstage(
                offstage: isOffstage,
                child: Container(
                  color: Colors.orange,
                  height: 50,
                ),
              ),
              Container(
                color: Colors.red,
                height: 50,
              ),
              FlatButton(
                child: Text('控制下面这个'),
                splashColor: Colors.red,
                color: Colors.green,
                textColor: Colors.white,
                onPressed: () async {
                  _isShow = !_isShow;
                  _streamController.sink.add(!_isShow);
                },
              ),
              CupertinoButton(
                color: Colors.orange,
                child: Text('ios DatePicker'),
                onPressed: () {
                  _showCupertinoDatePicker(context);
                },
              ),
              SizedBox(
                height: 20,
              ),
              Text('iOS文本框'),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                child: CupertinoTextField(
                  placeholder: '请输入姓名',
                  prefix: Text(' 姓名 '),
                  suffix: Text(' 结尾 '),
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text('flutter文本框'),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                child:

                    /// 手机号
                    TextField(
//                    controller: phoneTextEditingController,
//                    focusNode: _contentFocusNode,

                  /// 输入的文字
                  onChanged: (value) {
//                      username = value;
//                      print('username = ' + username);
//
//                      /// 强制重绘
//                      setState(() {});
                  },
                  onEditingComplete: () {},

                  maxLength: 11,

                  ///键盘类型
                  keyboardType: TextInputType.number,

                  /// 右下角 键盘类型
                  textInputAction: TextInputAction.send,
                  onSubmitted: (value) {
                    print('提交手机号' + value);
                  },

                  inputFormatters: <TextInputFormatter>[
                    WhitelistingTextInputFormatter.digitsOnly, //只输入数字
//                  PhoneTextInputFormatter.digitsOnly,
                  ],

                  ///输入文本的样式
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black,
                  ),

                  decoration: InputDecoration(
                    /// 头部的图标
                    icon: Icon(
                      Icons.phone,
                    ),
                    hintText: '请输入手机号',
                    labelText: '手机号',
                    hintStyle: TextStyle(
                      fontSize: 16.0,
                      color: Colors.red,
                    ),

                    ///输入内容距离上下左右的距离 ，可通过这个属性来控制 TextField的高度
                    contentPadding: EdgeInsets.all(10.0),
                    border: OutlineInputBorder(
//                    borderRadius: BorderRadius.circular(15),
//                    borderSide: BorderSide.none,
                        ),

                    /// right 小组件
                    suffixIcon: MaterialButton(
                      child: Text(
                        '获取验证码5',
                        style: TextStyle(fontSize: 14.0),
                      ),
                      textColor: Colors.black,
                      disabledTextColor: Colors.grey,
                      onPressed: () {},
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              FlatButton(
                child: Text('flutter日期选择'),
                onPressed: () {
                  _selectDateFunc();
                },
                splashColor: Colors.red,
                color: Colors.green,
                textColor: Colors.white,
              ),
              SizedBox(
                height: 20,
              ),
              CupertinoButton(
                color: Colors.orange,
                child: Text('ios TimerPicker'),
                onPressed: () {
                  _showCupertinoTimerPicker(context);
                },
              ),
              SizedBox(
                height: 20,
              ),
              FlatButton(
                child: Text('flutter 时间选择'),
                onPressed: () {
                  _selectTimeFunc();
                },
                splashColor: Colors.red,
                color: Colors.green,
                textColor: Colors.white,
              ),
              SizedBox(
                height: 20,
              ),
              CupertinoButton(
                color: Colors.orange,
                child: Text('ios DatePicker'),
                onPressed: () {
                  _cupertinoDatePicker(context);
                },
              ),
              DropdownButton(
                hint: new Text('下拉选择你想要的数据'),
                items: [
                  DropdownMenuItem(
                    child: new Text('1'),
                    value: '1',
                  ),
                  DropdownMenuItem(
                    child: new Text('2'),
                    value: '2',
                  ),
                ],
                onChanged: (T) {
                  //下拉菜单item点击之后的回调
                },
              ),
              SizedBox(
                height: 20,
              ),
              Text('长按预览'),
              Container(
                color: Colors.greenAccent,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    CupertinoContextMenu(
                      child: Container(
                        alignment: Alignment.centerLeft,
//                color: Colors.red,
                        width: 100,
                        height: 200,
                        child: Image.asset(
                          assetsOfImagePath('headIcon.png'),
                          width: 50,
                          height: 50,
                        ),
                      ),
                      previewBuilder: (context, animation, child) {
                        return Container(
                          color: Colors.greenAccent,
//                    width: 400,
//                    height: 200,
                          child: Image.asset(
                            assetsOfImagePath('A171.jpg'),
                          ),
                        );
                      },
                      actions: <Widget>[
                        CupertinoContextMenuAction(
                          child: const Text('Action one'),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        CupertinoContextMenuAction(
                          child: const Text('Action two'),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),

              FlatButton(
                child: Text('控制AbsorbPointer'),
                onPressed: () {
                  isAbsorbPointer.value = !isAbsorbPointer.value;
                },
              ),
              ValueListenableBuilder<bool>(
                valueListenable: isAbsorbPointer,
                builder: (BuildContext context, value, Widget child) {
                  return AbsorbPointer(
                    absorbing: value,
                    child: FlatButton(
                      color: Colors.greenAccent,
                      disabledColor: Colors.orange,
                      child: Text('AbsorbPointer'),
                      onPressed: value ? null : () {},
                    ),
                  );
                },
              ),

              FlatButton(
                color: Colors.orange,

                onPressed: () {
                  print('登陆');
                },
                child: Padding(
                  padding: new EdgeInsets.all((50)),
                  child: new Text('Padding测试Buton的宽度'),
                ),
//                  ///圆角
                shape: RoundedRectangleBorder(
                  side: BorderSide.none,
//                      borderRadius: BorderRadius.all(Radius.circular(double.minPositive)),
                  borderRadius: BorderRadius.circular(400),
                ),
//                  shape: CircleBorder(
//                    side: BorderSide(),
//                  ),
              ),

              Container(
//            width: 200,
//                  width: double.infinity,
                alignment: Alignment.center,
//            height: 20,
                child: FlatButton(
                  child: Text('FlatButton 加宽'),
                  onPressed: () {},
                  splashColor: Colors.red,
                  color: Colors.green,
                  textColor: Colors.white,
                ),
              ),

              FlatButton(
                child: Text('FlatButton'),
                onPressed: () {},
                splashColor: Colors.red,
                color: Colors.green,
                textColor: Colors.white,
              ),

              FlatButton.icon(
                icon: Icon(Icons.add),
                label: Text('FlatButton.icon'),
                onPressed: () {},

                /// 点击高亮颜色
                splashColor: Colors.orange,
                color: Colors.red,
              ),

              FlatButton.icon(
                ///
                icon: Image.asset('assets/image/红包.png', width: 40, height: 40),
                //ImageIcon(AssetImage('assets/image/红包.png')),
//                  icon: ImageIcon(AssetImage('assets/image/红包.png'),color: Colors.red,),

                label: Text('FlatButton'),
                onPressed: () {},
                splashColor: Colors.orange,
                color: Colors.green,
              ),

              /// 点击有波纹效果 阴影效果
              RaisedButton.icon(
                icon: Icon(Icons.add),
                label: Text('RaisedButton.icon'),
                onPressed: () {},

                /// 点击高亮颜色
                splashColor: Colors.orange,
                color: Colors.red,
                elevation: 20,
              ),

              /// 描边
              OutlineButton.icon(
                icon: Icon(Icons.add),
                label: Text('OutlineButton.icon'),
                onPressed: () {},

                /// 点击高亮颜色
//              splashColor: Colors.orange,
                color: Colors.red,
                borderSide: BorderSide(
                  color: Colors.red,
                ),
              ),

              /// 描边
              OutlineButton(
                child: Text('OutlineButton'),
                onPressed: () {},

                /// 点击高亮颜色
//              splashColor: Colors.orange,
                color: Colors.red,
                borderSide: BorderSide(
                  color: Colors.red,
                ),
              ),

              Row(
                children: <Widget>[
                  Expanded(
                    child: FlatButton(
                      child: Text('FlatButton'),
                      onPressed: () {},
                      splashColor: Colors.red,
                      color: Colors.green,
                      textColor: Colors.white,
                    ),
                  ),
                ],
              ),

              Row(
                children: <Widget>[
                  /// Expanded 可用空间
                  Expanded(
                    child: FlatButton(
                      child: Text('FlatButton'),
                      onPressed: () {},
                      splashColor: Colors.red,
                      color: Colors.green,
                      textColor: Colors.white,
                    ),
                  ),

                  SizedBox(
                    width: 20,
                  ),

                  Expanded(
                    flex: 2,
                    child: FlatButton(
                      child: Text('FlatButton'),
                      onPressed: () {},
                      splashColor: Colors.red,
                      color: Colors.green,
                      textColor: Colors.white,
                    ),
                  ),
                ],
              ),

              Text('ButtonBar 可以默认实现一个按钮组，通过 children 属性可以传入多个 Button'),
              ButtonBar(
                alignment: MainAxisAlignment.center,
                children: <Widget>[
                  FlatButton(
                    child: Text('FlatButton'),
                    onPressed: () {},
                    splashColor: Colors.red,
                    color: Colors.green,
                    textColor: Colors.white,
                  ),
                  FlatButton(
                    child: Text('ButtonBar-FlatButton'),
                    onPressed: () {},
                    splashColor: Colors.red,
                    color: Colors.green,
                    textColor: Colors.white,
                  ),
                  FlatButton(
                    child: Text('FlatButton'),
                    onPressed: () {},
                    splashColor: Colors.red,
                    color: Colors.green,
                    textColor: Colors.white,
                  ),
                ],
              ),

              SizedBox.fromSize(size: Size.fromHeight(20)),
              Text('PopupMenuButton'),
              PopupMenuButton(
                icon: Icon(Icons.add),
                onSelected: (value) {
                  print('value = $value');
                },
                itemBuilder: (BuildContext context) => [
                  PopupMenuItem(
                    value: 1,
                    child: Text('1'),
                  ),
                  PopupMenuItem(
                    value: 2,
                    child: Text('2'),
                  ),
                ],
              ),

              SizedBox.fromSize(size: Size.fromHeight(20)),

              /// 自动换行的row
              Text('自动换行的row--Wrap'),
              Wrap(children: <Widget>[for (String item in tags) TagItem(item)]),
//              ],
//            )
            ],
          ),
        ),
      ),
    );
  }

  void _showCupertinoDatePicker(BuildContext cxt) async {
    /// 假如中文环境报错,配置 GlobalCupertinoLocalizations.delegate,
    final picker = CupertinoDatePicker(
//      initialDateTime: DateTime(1995),
      initialDateTime: DateTime.now(),
      use24hFormat: true,
      mode: CupertinoDatePickerMode.date,
      onDateTimeChanged: (date) {
        print('the date is ${date.toString()}');
      },
    );

    showCupertinoModalPopup(
        context: cxt,
        builder: (cxt) {
          return Container(
            color: Colors.white,
            height: 200,
            child: picker,
          );
        });
  }

  void _showCupertinoTimerPicker(BuildContext cxt) {
    final picker = CupertinoTimerPicker(
      onTimerDurationChanged: (duration) {
        print('the time is $duration');
      },
    );

    showCupertinoModalPopup(
        context: cxt,
        builder: (cxt) {
          return Container(
            color: Colors.white,
            height: 200,
            child: picker,
          );
        });
  }

  _cupertinoDatePicker(cxt) {
    CupertinoPicker picker = CupertinoPicker(
      /// 每行的高度
      itemExtent: 50,
      children: <Widget>[
        Text('1'),
        Text('2'),
        Text('3'),
      ],
      onSelectedItemChanged: (index) {},
    );

    showCupertinoModalPopup(
        context: cxt,
        builder: (cxt) {
          return Container(
            color: Colors.white,
            height: 200,
            child: picker,
          );
        });
  }

  _selectDateFunc() async {
    DateTime dateTime = await showDatePicker(
      context: context,
      firstDate: DateTime(1900),
      initialDate: DateTime.now(),
      lastDate: DateTime(2100),
      helpText: '选择日期',
      errorFormatText: 'errorFormatText',
      errorInvalidText: 'errorInvalidText',
      fieldHintText: 'fieldHintText',
      fieldLabelText: 'fieldLabelText',
    );
  }

  _selectTimeFunc() async {
    TimeOfDay timeOfDay = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (timeOfDay == null) {
      return;
    }
  }
}

class TagItem extends StatelessWidget {
  final String text;

  TagItem(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.orange, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(5))),
      child: Container(
        margin: EdgeInsets.all(8),
        child: Text(text),
      ),
    );
  }
}

const List<String> tags = [
  '肯德基',
  '小哥哥你的东西掉了',
  '小姐姐好漂亮啊',
  '这个东西是啥',
  '哈哈哈',
  '好困啊',
  '今天好运',
  '明天好运来',
  '今年快结束了',
  '我累啊',
  '你写的什么代码',
  '多多多'
];
