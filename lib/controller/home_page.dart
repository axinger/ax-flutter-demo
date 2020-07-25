import 'package:ax_flutter_demo/module/login/view/login_view.dart';
import 'package:ax_flutter_util/ax_flutter_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controller/content_page.dart';
import '../controller/home_second_page.dart';
import '../controller/page_view_widget.dart';
import '../global_const.dart';
import '../component/drawer_view.dart';

class HomePage extends StatefulWidget {
  final String title;

  HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePage createState() => new _HomePage();
}

class _HomePage extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    print("状态栏栏高度 = ${MediaQuery.of(context).padding}");

    return DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: Colors.grey[100],
          appBar: AppBar(
            title: Text(localString.honeTitle,
                style: GoogleFonts.oswald(
                    textStyle: TextStyle(fontSize: 20, color: Colors.red))),
            centerTitle: true,
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.tablet_mac),
                onPressed: () {
                  Navigator.of(context).pushNamed('route_MaterialPage1');
                },
                tooltip: "按钮提示",
              ),
              IconButton(
                icon: Icon(Icons.favorite),
                onPressed: () {
                  AxLogger.info("ax>>>>>>>info=======");
                },
                tooltip: "按钮提示",
              ),
              IconButton(
                icon: Icon(Icons.ac_unit),
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute<bool>(builder: (context) {
                    return LoginView();
                  }));
                },
                tooltip: "按钮提示",
              ),
            ],

            /*切换按钮放在导航栏中*/
            bottom: TabBar(
              indicatorColor: Colors.red,
              tabs: <Widget>[
                Tab(
                  text: "主页",
                  icon: Icon(Icons.local_florist),
                ),
                Tab(
                  text: "富文本",
                  icon: Icon(Icons.local_gas_station),
                ),
                Tab(
                  text: "网格",
                  icon: Icon(Icons.local_grocery_store),
                ),
              ],
            ),
          ),

          /*bottomNavigationBar */
          /**drawer 会自动在左上角,添加一个菜单按钮 leading: IconButton*/
          drawer: DrawerView(),

          /*主要内容*/
          body: TabBarView(
            children: <Widget>[
              ContentPage(),
              SecondPage(),
              PageViewWidget(),
            ],
          ),
        ));
  }
}
