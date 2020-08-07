import 'package:ax_flutter_util/ax_flutter_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MaterialPage2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
//    return _MaterialPage22();
    return _MaterialPage23();
  }
}

class _MaterialPage23 extends State<MaterialPage2> {
  var passwordTextEditingController = TextEditingController();

  var passwordFocusNode = FocusNode();


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Scaffold(
//      backgroundColor: Colors.green,
          appBar: AppBar(
            title: Text('中间list适应大小'),
          ),
          body: ConstrainedBox(
            constraints: BoxConstraints.expand(),
            child: Column(
              children: <Widget>[
                Container(
                  height: 50,
                  width: double.infinity,
                  color: Colors.red,
                  child: Text('头'),
                ),
                Expanded(
//              child: Container(
//                height: 50,
//                color: Colors.greenAccent,
//              ),

                  child: ListView(
                    children: <Widget>[
                      Text('TextFormField'),
                      TextFormField(
                        controller: passwordTextEditingController,
                        focusNode: passwordFocusNode,
                        obscureText: true,
//                keyboardType: TextInputType.number,

                        /// 输入的文字
                        onChanged: (value) {
                          print('onChanged输入的手机号' + value);
                          setState(() {});
                        },

                        /// 相当于 onSubmitted 右下角
                        onEditingComplete: () {
                          print('onEditingComplete');

                          /// 收起键盘
                          passwordFocusNode.unfocus();
                        },

                        onSaved: (value) {
                          debugPrint('保存密码 ' + value);
                        },

                        ///输入文本的样式
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.black,
                        ),

                        /// 限制输入类型
                        inputFormatters: <TextInputFormatter>[
                          LengthLimitingTextInputFormatter(20),
                        ],

                        validator: (value) {
                          if (value.length < 6) {
                            return '输入6位密码';
                          }
                          return null;
                        },

                        /// 自动验证
                        autovalidate: true,

                        decoration: InputDecoration(
                          /// 头部的图标
                          prefixIcon: Icon(
                            Icons.lock,
                          ),
                          hintText: '请输入密码',
                          hintStyle: TextStyle(
                            fontSize: 16.0,
                            color: Colors.red,
                          ),

                          labelText: '密码',
                          labelStyle: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black,
                          ),

                          ///输入内容距离上下左右的距离 ，可通过这个属性来控制 TextField的高度
                          contentPadding: EdgeInsets.all(10.0),
                          border: OutlineInputBorder(
//                    borderRadius: BorderRadius.circular(15),
//                    borderSide: BorderSide.none,
                              ),
                        ),
                      ),
                      Text('TextField'),
                      TextField(
//                    controller: phoneTextEditingController,
//                    focusNode: _contentFocusNode,

                        /// 输入的文字
                        onChanged: (value) {
                          print('TextField = ' + value);
                        },
                        onEditingComplete: () {},

//                    maxLength: 11,

                        ///键盘类型
//                    keyboardType: TextInputType.number,

                        /// 右下角 键盘类型
                        textInputAction: TextInputAction.send,
                        onSubmitted: (value) {
                          print('提交手机号' + value);
                        },

                        inputFormatters: <TextInputFormatter>[
//                      WhitelistingTextInputFormatter.digitsOnly, //只输入数字
//                      TestTextInputFormatter(),
//                      WhitelistingTextInputFormatter(RegExp("[a-zA-Z]")),//只允许输入字母

//                      WhitelistingTextInputFormatter(RegExp(r'(\d+)(.\d{0,2})?$/')),

//                      WhitelistingTextInputFormatter(RegExp(r'\d+'))

//                      ///零和非零开头的数字
//                      WhitelistingTextInputFormatter(RegExp(r'^(0|[1-9][0-9]*)$'))

                          ///有两位小数的正实数
//                      WhitelistingTextInputFormatter(RegExp(r'^[a-zA-Z][a-zA-Z0-9_]{4,15}$'))

//                      WhitelistingTextInputFormatterExtension.chinesePhone,
//                      PhoneTextInputFormatter.digitsOnly,

                          WhitelistingTextInputFormatter(RegExp(
                              r'^((13[0-9])|(14[5,7,9])|(15[^4])|(18[0-9])|(17[0,1,3,5,6,7,8])|(19)[0-9])\d{8}$'))

//                      WhitelistingTextInputFormatter,
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
//                      prefix: Text('prefix'),
//                      prefixText: 'prefixText',
                          prefixIcon: Text('prefixIcon'),
//
//                      suffix: Text('suffix'),
                          suffixIcon: Text('suffixIcon'),

                          hintText: '请输入手机号',

                          /// 左上角的标识
                          labelText: '手机号',
                          hintStyle: TextStyle(
//                            fontSize: 16.0,
                            color: Colors.black,
                          ),

                          ///输入内容距离上下左右的距离 ，可通过这个属性来控制 TextField的高度
                          contentPadding: EdgeInsets.all(10.0),

                          /// 这个无效
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100),
                            borderSide: BorderSide(width: 10),
                          ),

                          ///选中时外边框颜色
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
//                        borderSide: BorderSide(
//                          color: Colors.red,
//                        ),

                            /// 无边框
                            borderSide: BorderSide.none,
                          ),

                          ///未选中时候的颜色
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.grey, //边线颜色为白色
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 50,
                  color: Colors.orange,
                  width: double.infinity,
                  child: Text('尾'),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _MaterialPage22 extends State<MaterialPage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      backgroundColor: Colors.green,
      appBar: AppBar(
        title: Text('各种按钮'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          FlatButton(
            color: Colors.orange,
            child: Text('FlatButton'),
            onPressed: () {},
          ),
          SizedBox(
            height: 10,
          ),
          FlatButton(
            color: Colors.red,
            child: Container(
              child: Text('FlatButton'),
            ),
            onPressed: () {},
          ),
          OutlineButton(
            color: Colors.red,
            child: Container(
              child: Text('OutlineButton'),
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

class _MaterialPage1 extends State<MaterialPage2>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => false;

  @override
  void updateKeepAlive() {
    // TODO: implement updateKeepAlive
    super.updateKeepAlive();
    print('MaterialPage2 == updateKeepAlive');
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('MaterialPage2 == initState');

    WidgetsBinding.instance.addPostFrameCallback((callback) {
      print('addPostFrameCallback be invoke');
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    print('MaterialPage2 == build');

    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        title: Text('从下向上排布'),
        actions: <Widget>[
          FlatButton(
            child: Text('点1'),
            onPressed: () {
//              showAlert(context: context, title: '标题', message: '内容');
//              showAlert(context: context, title: '标题2', message: '内容');
//              showAlert(context: context, title: '标题3', message: '内容');
//              showAlert(context: context, title: '标题4', message: '内容');
              showCupertinoAlert(context: context);
            },
          ),
          FlatButton(
            child: Text('点2'),
            onPressed: () {
              showCupertinoAlert(context: context, title: '标题', message: '内容');
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
//          verticalDirection: VerticalDirection.up,
          children: <Widget>[
            Container(
              width: 100,
              height: 100,
              color: Colors.orange,
            ),
            Container(
              width: 100,
              height: 100,
              color: Colors.red,
            ),
            Text('这是个Stack'),
            Container(
              width: double.infinity,
              height: 300,
              color: Colors.white,
              child: Stack(
//              alignment:Alignment.center ,
//              alignment:Alignment.topLeft ,
//              fit: StackFit.expand, //未定位widget占满Stack整个空间
                children: <Widget>[
                  Container(
                    width: 200,
                    height: 200,
                    color: Colors.deepPurple,
                  ),

                  Container(
                    width: 100,
                    height: 100,
                    color: Colors.orange,
                  ),

                  Container(
                    width: 50,
                    height: 50,
                    color: Colors.red,
                  ),

//                  Align(
//                    child: Container(
//                      width: 25,
//                      height: 25,
//                      color: Colors.red,
//                    ),
//                    alignment: Alignment.topRight,
//                  ),

                  Positioned(
                    right: 10,
                    top: 10,
                    child: Container(
                      width: 20,
                      height: 20,
                      color: Colors.indigoAccent,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              width: 100,
              height: 100,
              color: Colors.lightBlueAccent,
            ),
          ],
        ),
      ),
    );
  }
}
