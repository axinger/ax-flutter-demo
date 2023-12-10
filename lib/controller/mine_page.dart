// import 'package:ax_flutter_util/ax_flutter_util.dart';
import 'package:ax_flutter_util/ax_flutter_util.dart';
import 'package:flutter/material.dart';

import '../_01widget_demo/01root_test_page.dart';
import '../global_const.dart';
import '../module/login/view/login_view.dart';

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
      appBar: AppBar(
        title: Text(
          localString.mine,
          style: TextStyle(color: Colors.red),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/image/A171.jpg'),
              fit: BoxFit.fill,
//              repeat :ImageRepeat.repeatY,
            ),
            color: Colors.blue,
          ),
        ),

        centerTitle: true,
//              backgroundColor: Colors.transparent,
        actions: <Widget>[
          TextButton(
            // color: Colors.purple,
            child: Text("登录", style: TextStyle(color: Colors.red, backgroundColor: Colors.green)),
            onPressed: () {
              print("========");
//                    FlutterBoost.singleton.open("route_MaterialPage1");
//                    Navigator.of(context).pushNamed('/route_login');
              push(context: context, widget: LoginView());
            },
          ),
//          TextButton(
//            color: Colors.indigo,
//            child: Text("退出", style: TextStyle(color: Colors.red,backgroundColor: Colors.green)),
//            onPressed: () {
//              BlocProvider.of<AuthenticationBloc>(context)
//                  .add(AuthenticationLoggedOutEvent());
//            },
//          ),
          Center(
            child: Text("退出", style: TextStyle(color: Colors.red, backgroundColor: Colors.green)),
          ),
          TextButton(
            // color: Colors.purple,
            child: Text("测试页面", style: TextStyle(color: Colors.red, backgroundColor: Colors.green)),
            onPressed: () {
              print("========");
              Navigator.push<String>(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return RootHomePage();
                  },
                ),
              );
            },
          )
        ],

//        flexibleSpace:  Image.network(
//              "https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=2641512116,3445406201&fm=26&gp=0.jpg",
//              fit: BoxFit.fill,
//              width: double.infinity,
//              height: double.infinity,
//            ),

//        bottom: PreferredSize(
//          preferredSize: Size.fromHeight(100),
//          child: Container(
//            height: 100,
////        padding: EdgeInsets.all(12),
//            decoration: BoxDecoration(
//              image: DecorationImage(
//                image: AssetImage('assets/image/A171.jpg'),
//                fit: BoxFit.cover,
////              repeat :ImageRepeat.repeatY
//              ),
//              color: Colors.green,
//            ),
//          ),
//        ),
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
            TextButton(
              // color: Colors.orange,
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
