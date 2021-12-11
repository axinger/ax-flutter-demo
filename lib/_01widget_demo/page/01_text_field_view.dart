import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DemoTextField extends StatefulWidget {
  const DemoTextField({Key? key}) : super(key: key);

  @override
  _DemoTextFieldState createState() => _DemoTextFieldState();
}

class _DemoTextFieldState extends State<DemoTextField> {
  var passwordFocusNode = FocusNode();
  final _nameFocusNode = FocusNode();
  var passwordTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    FocusScope.of(context).requestFocus(passwordFocusNode);
    return Scaffold(
      appBar: AppBar(
        title: Text('TextField'),
      ),
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
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
            Divider(color: Colors.red),
            Text('TextField 只能输入邮箱'),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              child: TextField(
                onChanged: (value) {},
                onEditingComplete: () {},

                /// 右下角 键盘类型
                textInputAction: TextInputAction.send,
                onSubmitted: (value) {
                  print('提交手机号' + value);
                },

                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                ],

                ///输入文本的样式
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black,
                ),

                decoration: InputDecoration(
                  /// 头部的图标
                  icon: Icon(
                    Icons.email_outlined,
                  ),
                  hintText: '请输入邮箱',
                  labelText: '邮箱',
                  hintStyle: TextStyle(
                    fontSize: 16.0,
                    color: Colors.red,
                  ),

                  ///输入内容距离上下左右的距离 ，可通过这个属性来控制 TextField的高度
                  contentPadding: EdgeInsets.all(10.0),

                  /// right 小组件
                  suffixIcon: MaterialButton(
                    child: Text(
                      '发送邮件',
                      style: TextStyle(fontSize: 14.0),
                    ),
                    textColor: Colors.black,
                    disabledTextColor: Colors.grey,
                    onPressed: () {},
                  ),
                ),
              ),
            ),
            Divider(color: Colors.red),
            Text('TextField 只能注入数字'),
//
            /// 手机号
            Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              child: TextField(
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
                  FilteringTextInputFormatter.digitsOnly,
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

            Text('TextFormField'),
            ElevatedButton(
              child: Text('编辑'),
              onPressed: () {
                FocusScope.of(context).requestFocus(passwordFocusNode);
              },
            ),
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
                debugPrint('保存密码 $value');
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
                if (value!.length < 6) {
                  return '输入6位密码';
                }
                return null;
              },

              /// 自动验证
              autovalidateMode: AutovalidateMode.always,

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
                FilteringTextInputFormatter(RegExp("[a-zA-Z]"), allow: true),
                //只允许输入字母

//                      WhitelistingTextInputFormatter(RegExp(r'(\d+)(.\d{0,2})?$/')),

//                      WhitelistingTextInputFormatter(RegExp(r'\d+'))

//                      ///零和非零开头的数字
//                      WhitelistingTextInputFormatter(RegExp(r'^(0|[1-9][0-9]*)$'))

                ///有两位小数的正实数
//                      WhitelistingTextInputFormatter(RegExp(r'^[a-zA-Z][a-zA-Z0-9_]{4,15}$'))

//                      WhitelistingTextInputFormatterExtension.chinesePhone,
//                      PhoneTextInputFormatter.digitsOnly,

//                          WhitelistingTextInputFormatter(
//                            RegExp(
//                                r'^((13[0-9])|(14[5,7,9])|(15[^4])|(18[0-9])|(17[0,1,3,5,6,7,8])|(19)[0-9])\d{8}$'),
//                          )

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
            Text('FormField\n'
                'FormField是一个表单控件，此控件包含表单的状态，方便更新UI，'
                '通常情况下，我们不会直接使用FormField，而是使用TextFormField。'),
            FormField(
              autovalidateMode: AutovalidateMode.always,
              builder: (FormFieldState state) {
                return Container(
                  width: 200,
                  height: 100,
                  color: Colors.red,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
