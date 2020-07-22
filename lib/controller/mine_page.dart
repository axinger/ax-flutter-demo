import 'package:ax_flutter_demo/authentication/authentication.dart';
import 'package:ax_flutter_demo/login/view/login_view.dart';
import 'package:ax_flutter_demo/showpage/00-test_page.dart';
import 'package:ax_flutter_util/ax_flutter_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../global_const.dart';

class MinePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MinePage();
  }
}

class _MinePage extends State<MinePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// 导航栏 加高,添加背景图片
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(200),

        /// 栈控件
        child: Stack(
          children: <Widget>[
            Image.network(
              "https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=2641512116,3445406201&fm=26&gp=0.jpg",
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            AppBar(
              title: Text(
                localString.mine,
                style: TextStyle(color: Colors.red),
              ),
              centerTitle: true,
              backgroundColor: Colors.transparent,
              actions: <Widget>[
                FlatButton(
                  child: Text("登录"),
                  onPressed: () {
                    print("========");
//                    FlutterBoost.singleton.open("route_MaterialPage1");
//                    Navigator.of(context).pushNamed('/route_login');
                    push(context: context,widget:LoginView());
                  },
                ),
                FlatButton(
                  child: Text("退出"),
                  onPressed: () {
                    BlocProvider.of<AuthenticationBloc>(context)
                        .add(AuthenticationLoggedOutEvent());
                  },
                ),
                FlatButton(
                  child: Text("测试页面"),
                  onPressed: () {
                    print("========");
                    Navigator.push<String>(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return ShowTestPage();
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[

            Image.asset('assets/红包1.png'),

          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(10),
        color: Colors.red,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FlatButton(
              color: Colors.orange,
              child: Text('按钮1'),
              onPressed: () {},
            ),
            Text("B"),
            Text("C"),
          ],
        ),
      ),
      persistentFooterButtons: <Widget>[
        Text("A"),
      ],
    );
  }
}
