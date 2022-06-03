import 'package:ax_flutter_demo/module/authentication/authentication_event.dart';
import 'package:ax_flutter_demo/module/login/model/user_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../global_const.dart';
import 'login_view_form_tf.dart';

class LoginView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginPage();
  }
}

class _LoginPage extends State<LoginView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Droid Sans',
//
//       ///点击空白隐藏键盘
//       home: GestureDetector(
//         behavior: HitTestBehavior.translucent,
//         onTap: () {
//           print("=============");
//           FocusScope.of(context).requestFocus(FocusNode());
//         },
//         child: Scaffold(
//           appBar: AppBar(
//             title: Text(
//               '登录',
//               style: TextStyle(fontFamily: 'Droid Sans'),
//             ),
//             elevation: 0,
//           ),
//           backgroundColor: Colors.white,
//           body: LoginViewFormTF(),
//
// //          body: ContainerTF(),
//         ),
//       ),
//     );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          '登录\n临时取消返回按钮',
          textAlign: TextAlign.center,
        ),
        elevation: 0,
        centerTitle: true,

        /// 取消返回按钮
        // automaticallyImplyLeading: false,
      ),
      backgroundColor: Colors.white,
      body: LoginViewFormTF(),

//          body: ContainerTF(),
    );
  }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Droid Sans',
//
//       ///点击空白隐藏键盘
//       home: GestureDetector(
//         behavior: HitTestBehavior.translucent,
//         onTap: () {
//           print("=============");
//           FocusScope.of(context).requestFocus(FocusNode());
//         },
//         child: Scaffold(
//           appBar: AppBar(
//             title: Text(
//               '登录',
//               style: TextStyle(fontFamily: 'Droid Sans'),
//             ),
//             elevation: 0,
//           ),
//           backgroundColor: Colors.white,
//           body: LoginViewFormTF(),
//
// //          body: ContainerTF(),
//         ),
//       ),
//     );
//   }
}

class ContainerTF extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ContainerTF();
  }
}

class _ContainerTF extends State<ContainerTF> {
  TextEditingController phoneTextEditingController = TextEditingController();
  TextEditingController pswTextEditingController = TextEditingController();
  String username = "", password = "";

  FocusNode _contentFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _contentFocusNode.addListener(() {
      // 失去焦点
      if (!_contentFocusNode.hasFocus) {}
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 40, left: 20, right: 20),

      /// TextField 很多属性 无效,包一层 Theme
      child: Theme(
        data: Theme.of(context).copyWith(
          primaryColor: Colors.orange,
          hintColor: Colors.grey,
        ),
        child: Column(
//              mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            /// 手机号
            TextField(
              controller: phoneTextEditingController,
              focusNode: _contentFocusNode,

              /// 输入的文字
              onChanged: (value) {
                username = value;
                print("username = " + username);

                /// 强制重绘
                setState(() {});
              },
              onEditingComplete: () {},

              maxLength: 11,

              ///键盘类型
              keyboardType: TextInputType.number,

              /// 右下角 键盘类型
              textInputAction: TextInputAction.send,
              onSubmitted: (value) {
                print("提交手机号" + value);
              },

              inputFormatters: <TextInputFormatter>[
                // WhitelistingTextInputFormatter.digitsOnly, //只输入数字
//                  PhoneTextInputFormatter.digitsOnly,
                FilteringTextInputFormatter(RegExp(r"^[0-9]*$"), allow: true),
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
                hintText: "请输入手机号",

                /// 左上角的标识
                labelText: "手机号",
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
                  borderSide: BorderSide(
                    color: Colors.red,
                  ),
                ),

                ///未选中时候的颜色
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Colors.grey, //边线颜色为白色
                  ),
                ),

                /// right 小组件
//                suffixIcon: MaterialButton(
//                  child: Text(
//                    "获取验证码",
//                    style: TextStyle(fontSize: 14.0),
//                  ),
//                  textColor: Colors.black,
//                  disabledTextColor: Colors.grey,
//                  onPressed: (username.isEmpty) ? null : () {},
//                ),
                suffixIcon: OutlinedButton(
                  child: Text(
                    "获取验证码1",
                    style: TextStyle(fontSize: 14.0),
                  ),
                  // textColor: Colors.black,
                  // disabledTextColor: Colors.grey,
//                  onPressed: (username.isEmpty) ? null : () {},
                  onPressed: () {},
                ),
              ),
            ),

            /// 间隔
            SizedBox(
              height: 20,
            ),

            ///密码
            TextField(
              controller: pswTextEditingController,

              /// 输入的文字
              onChanged: (value) {
                password = value;
                print("password = " + password);

                /// 强制重绘
                setState(() {});
              },

              onEditingComplete: () {},

              obscureText: true,

              /// 右下角 键盘类型
              textInputAction: TextInputAction.done,
              onSubmitted: (value) {
                print("提交密码" + value);

                ///收起键盘
                FocusScope.of(context).requestFocus(FocusNode());
              },

              ///输入文本的样式
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black,
              ),

              decoration: InputDecoration(
                /// 头部的图标
                icon: Icon(
                  Icons.lock,
                ),
                hintText: "请输入密码",
                labelText: "密码",
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
              ),
            ),

            SizedBox(
              height: 20,
            ),

            Container(
              width: double.infinity,
              height: 50,
              child: FlatButton(
                child: Text(
                  "登录",
                  style: TextStyle(
                    letterSpacing: 10,
                    fontSize: 20,
                  ),
                ),
                textColor: Colors.white,
                disabledTextColor: Colors.grey,
                color: Colors.red,
                disabledColor: Colors.green,
                onPressed: (username.isEmpty || password.isEmpty)
                    ? null
                    : () {
                        ///收起键盘
                        FocusScope.of(context).requestFocus(FocusNode());
                        EVENT_BUS.fire(AuthenticationLoggedInEvent(
                            user: UserRepository(
                                username: phoneTextEditingController.text,
                                password: pswTextEditingController.text)));
                      },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
