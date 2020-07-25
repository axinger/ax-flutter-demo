import 'package:ax_flutter_demo/module/authentication/authentication_bloc.dart';
import 'package:ax_flutter_demo/module/authentication/authentication_event.dart';
import 'package:ax_flutter_demo/module/login/bloc/login_bloc.dart';
import 'package:ax_flutter_demo/module/login/model/user_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../global_const.dart';

class LoginBlocView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginPage();
  }
}

class _LoginPage extends State<LoginBlocView> {
  TextEditingController phoneTextEditingController = TextEditingController();
  TextEditingController pswTextEditingController = TextEditingController();
  String username = "", password = "";

  FocusNode _contentFocusNode = FocusNode();

  /// 必须在  BlocProvider(
  ///            create: (context) {
  ///内部
  _onLoginButtonPressed() {
    ///收起键盘
    FocusScope.of(context).requestFocus(FocusNode());

    print(
        'BlocProvider.of<LoginBloc>(context) = ${BlocProvider.of<LoginBloc>(context)}');

    BlocProvider.of<LoginBloc>(context).add(
      LoginButtonPressedEvent(
        username: phoneTextEditingController.text,
        password: pswTextEditingController.text,
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    /// TextEditingController
    phoneTextEditingController.addListener(() {
      debugPrint("监听输入的电话 " + phoneTextEditingController.text);
    });

    //    codeTextEditingController.addListener((){
    //      setState(() {
    //      });
    //    },
  }

  @override
  Widget build(BuildContext context) {
    print(
        'BlocProvider.of<AuthenticationBloc>(context) = ${BlocProvider.of<AuthenticationBloc>(context)}');

    return MaterialApp(
      title: 'Droid Sans',

      ///点击空白隐藏键盘
      home: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          print("=============");
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              '登录',
              style: TextStyle(fontFamily: 'Droid Sans'),
            ),
            elevation: 0,
          ),
          backgroundColor: Colors.blue,
          body: BlocProvider(
            create: (context) {
              return LoginBloc(
                authenticationBloc:
                    BlocProvider.of<AuthenticationBloc>(context),
              );
            },
            child: BlocListener<LoginBloc, LoginState>(
              listener: (context, state) {
                if (state is LoginFailure) {
                  Scaffold.of(context).showSnackBar(
                    SnackBar(
                      content: Text('错误'),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
              child:
                  BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
                print('state ==2 $state');
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
                            suffixIcon: MaterialButton(
                              child: Text(
                                "获取验证码2",
                                style: TextStyle(fontSize: 14.0),
                              ),
                              textColor: Colors.black,
                              disabledTextColor: Colors.grey,
                              onPressed: (username.isEmpty) ? null : () {},
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
                          child: RaisedButton(
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
                            onPressed: (username.isEmpty ||
                                    password.isEmpty ||
                                    (state is LoginInProgress))
                                ? null
                                : () {
                                    ///收起键盘
                                    FocusScope.of(context)
                                        .requestFocus(FocusNode());

                                    EVENT_BUS.fire(AuthenticationLoggedInEvent(
                                        user: UserRepository(
                                            username:
                                                phoneTextEditingController.text,
                                            password: pswTextEditingController
                                                .text)));

                                    print(
                                        'BlocProvider.of<LoginBloc>(context) = ${BlocProvider.of<LoginBloc>(context)}');

//                                    BlocProvider.of<LoginBloc>(context).add(
//                                      LoginButtonPressedEvent(
//                                        username:
//                                            phoneTextEditingController.text,
//                                        password: pswTextEditingController.text,
//                                      ),
//                                    );
                                  },
                          ),
                        ),
                      ],
                    ),
                  ),
                );
                ;
              }),
            ),
          ),
        ),
      ),
    );
  }
}

class _formTF extends StatelessWidget {
  TextEditingController phoneTextEditingController = TextEditingController();
  var loginFomKey = GlobalKey<FormState>();

  String username, password;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: loginFomKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          /// 手机号
          TextFormField(
            controller: phoneTextEditingController,

            /// 输入的文字
            onChanged: (value) {
              print("onChanged输入的手机号" + value);

              /// 强制重绘,用来控制 验证码 回调是否空
//              setState(() {
//
//              });
            },
            onEditingComplete: () {},

            onSaved: (value) {
              username = value;
            },

//            maxLength: 11,
            //键盘类型
            keyboardType: TextInputType.phone,

            /// 限制输入类型
            inputFormatters: <TextInputFormatter>[
//              WhitelistingTextInputFormatter.digitsOnly, //只输入数字
//              LengthLimitingTextInputFormatter(11),
//              PhoneTextInputFormatter.digitsOnly,
            ],

//                    validator: (value) {
//                      return value.isEmpty ?  "必须输入手机号" : null;
//                    },
//                    /// 自动验证
//                    autovalidate: true,

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
//                    hintText: "请输入手机号",
              labelText: "手机号",
              helperText: "帮助",
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
                  "获取验证码3",
                  style: TextStyle(fontSize: 14.0),
                ),
                textColor: Colors.red,
                disabledTextColor: Colors.grey,
                onPressed: (phoneTextEditingController.value.text.isEmpty)
                    ? null
                    : () {},
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),

          ///密码
          TextFormField(
//                  controller: phoneTextEditingController,

            obscureText: true,

            /// 输入的文字
            onChanged: (value) {
              print("onChanged输入的手机号" + value);
            },
            onEditingComplete: () {},

            onSaved: (value) {
              debugPrint("保存密码 " + value);
              password = value;
            },

            ///输入文本的样式
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.black,
            ),

//                    validator: (value) {
//                      return value.isEmpty ?  "必须输入密码" : null;
//                    },
//                    /// 自动验证
//                    autovalidate: true,

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
            child: RaisedButton(
              child: Text("登录"),
              onPressed: () {
                print("是否空 ${phoneTextEditingController.value.text.isEmpty}");

                this.loginFomKey.currentState.save();
                debugPrint("账号: $username  密码: $password");
              },
            ),
          ),
        ],
      ),
    );
  }
}
