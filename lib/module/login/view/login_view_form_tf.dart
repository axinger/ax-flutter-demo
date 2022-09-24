import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ButtonActionState {
  bool isActivity = true;
}

class LoginViewFormTF extends StatefulWidget {
  @override
  _FormTFState createState() => _FormTFState();
}

class _FormTFState extends State<LoginViewFormTF> {
  /// phone 和 password 的表单
  GlobalKey<FormState> loginFomKey = GlobalKey<FormState>();

  /// phone 和 发送验证码
  GlobalKey<FormState> phoneFomKey = GlobalKey<FormState>();

//  ValueKey<ButtonActionState> sendMsgKey = ValueKey<ButtonActionState>(ButtonActionState());

  TextEditingController phoneTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  FocusNode phoneFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  String username = '';
  String password = '';

  @override
  void initState() {
    super.initState();

    /// 失去焦点事件
    phoneFocusNode.addListener(() {
      print(
          'phoneFocusNode.hasPrimaryFocus = ${phoneFocusNode.hasPrimaryFocus}');
      if (!phoneFocusNode.hasFocus) {
        // 失去焦点
        print('phone失去焦点 = ${phoneTextEditingController.text}');
      }
    });

    /// 失去焦点事件
    passwordFocusNode.addListener(() {
      if (!passwordFocusNode.hasFocus) {
        // 失去焦点
        print('password失去焦点 = ${passwordTextEditingController.text}');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
//    phoneTextEditingController.addListener(() {
//      print('phoneTextEditingController.addListener======');
//    });

    return Container(
      margin: EdgeInsets.only(top: 60, left: 20, right: 20),
      child: Form(
        key: loginFomKey,
        child: Column(
//              mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            /// 这边在包裹一层,用于验证码监听
            Form(
              key: phoneFomKey,
              child: TextField(
                controller: phoneTextEditingController,
                focusNode: phoneFocusNode,

                autofocus: true,

                ///键盘类型
//                  keyboardType: TextInputType.number,
                maxLength: 11,

                /// 限制输入类型
                inputFormatters: <TextInputFormatter>[
                  // WhitelistingTextInputFormatter.digitsOnly, //只输入数字
                  FilteringTextInputFormatter(RegExp(r"^[0-9]*$"), allow: true),

                  /// 最大长度,然后就不给输入了, 所以这里没有最小长度, validator 验证最小长度
                  LengthLimitingTextInputFormatter(11),
                ],

                /// 自动验证
//                autovalidate: true,
//                validator: (value) {
//                  /// 这里 验证最小长度
//                  if (value.length < 11) {
//                    return "必须输入11位手机号";
//                  }
//                  return null;
//                },

                ///输入文本的样式
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black,
                ),

                decoration: InputDecoration(
//                  icon: Icon(
//                    Icons.phone,
//                  ),

                  /// 头部的图标
                  prefixIcon: Icon(
                    Icons.phone,
                  ),

                  hintText: ' 请输入手机号',
                  hintStyle: TextStyle(
                    fontSize: 16.0,
                    color: Colors.red,
                  ),
//                  labelText: "手机号",
//                  labelStyle: TextStyle(
//                    fontSize: 16.0,
//                    color: Colors.black,
//                  ),

                  helperText: "帮助",

                  ///输入内容距离上下左右的距离 ，可通过这个属性来控制 TextField的高度
                  contentPadding: EdgeInsets.all(10.0),

                  ///这个不生效
//                  border: OutlineInputBorder(
////                    borderRadius: BorderRadius.circular(15),
//
//                    borderSide: BorderSide(color: Colors.lightBlue),
//                  ),

                  ///选中时下边框颜色 只有下边框
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.greenAccent),
                  ),

                  ///选中时外边框颜色 有四边
//                  focusedBorder: OutlineInputBorder(
////                    borderRadius: BorderRadius.circular(5.0),
//                    borderSide: BorderSide(color: Colors.orange,),
//                  ),

                  ///未选中时候的颜色
//                  enabledBorder: OutlineInputBorder(
//                    borderRadius: BorderRadius.circular(5.0),
//                    borderSide: BorderSide(color: Colors.blueGrey,),
//                  ),

                  /// right 小组件
//                    suffixIcon: TextButton(
////                      key: sendMsgKey,
//                      child: Text(
//                        "获取验证码4",
//                        style: TextStyle(fontSize: 14.0),
//                      ),
//                      textColor: Colors.red,
//                      disabledTextColor: Colors.grey,
//                      onPressed:
//                          !(phoneFomKey?.currentState?.validate() ?? true)
//                              ? null
//                              : () {
//                                  setState(() {
//                                    Future.delayed(Duration(seconds: 5))
//                                        .then((value) {});
//                                  });
//                                },
//                    ),
                  suffixIcon: OutlinedButton(
//                      key: sendMsgKey,
                    child: Text(
                      "获取验证码4",
                      style: TextStyle(fontSize: 14.0),
                    ),
                    // textColor: Colors.red,
                    // disabledTextColor: Colors.grey,
                    onPressed: () {},
                  ),
                ),

                /// 输入的文字
                onChanged: (value) {
                  /// 强制重绘,用来控制 验证码 回调是否空
                  setState(() {});
                },
                onEditingComplete: () {
                  print("onEditingComplete============");
                },
//                onFieldSubmitted: (value) {
//                  print("onFieldSubmitted============ $value");
//                },
//
//                onSaved: (value) {
//                  username = value;
//                },
              ),
            ),

            /// 手机号

            SizedBox(
              height: 20,
            ),

            ///密码
            TextFormField(
              controller: passwordTextEditingController,
              focusNode: passwordFocusNode,
              obscureText: true,
//                keyboardType: TextInputType.number,

              /// 输入的文字
              onChanged: (value) {
                print("onChanged输入的手机号" + value);
                setState(() {});
              },

              /// 相当于 onSubmitted 右下角
              onEditingComplete: () {
                print('onEditingComplete');

                /// 收起键盘
                passwordFocusNode.unfocus();
              },

              onSaved: (value) {
                debugPrint("保存密码 " + value!);
                password = value;
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
                  return "输入6位密码";
                }
                return null;
              },

              /// 自动验证
              // autovalidate: true,
              // autoValidateMode:AutovalidateMode.,
              autovalidateMode: AutovalidateMode.disabled,
              decoration: InputDecoration(
                /// 头部的图标
                prefixIcon: Icon(
                  Icons.lock,
                ),
                hintText: "请输入密码",
                hintStyle: TextStyle(
                  fontSize: 16.0,
                  color: Colors.red,
                ),

                labelText: "密码",
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
            SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
//                alignment: Alignment.center,
              height: 50,
              child: TextButton(
                child: Text(
                  "登录",
                  style: TextStyle(
                    letterSpacing: 10,
                    fontSize: 20,
                  ),
                ),
                // color: Colors.green,
                // textColor: Colors.white,
                // disabledColor: Colors.grey,
                // disabledTextColor: Colors.white30,
                onPressed:

                    /// 需要 不需要setState, 但可以根据校验条件
                    !(loginFomKey.currentState?.validate() ?? false)

                        /// 通过 TextEditingController 控制 方便,不需要setState, 但不能根据校验条件改变
//                      ((phoneTextEditingController?.text?.isEmpty ?? false) ||
//                              (passwordTextEditingController?.text?.isEmpty ??
//                                  false))
                        ? null
                        : () {
                            debugPrint("账号: $username  密码: $password");
                            loginFomKey.currentState!.save();
                            debugPrint("账号: $username  密码: $password");
                            Navigator.pop(context);
                          },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
