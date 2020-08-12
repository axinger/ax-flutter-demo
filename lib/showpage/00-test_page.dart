import 'package:ax_flutter_demo/util/my_icons.dart';
import 'package:ax_flutter_util/ax_flutter_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../global_const.dart';
import '01material_page1.dart';
import '02material_page2.dart';
import '03material_page_date.dart';
import '04material_page_dialog.dart';
import '05-material_page_chip.dart';
import '06-material_page_data_table.dart';
import '07-material_page_data_table2.dart';
import '08-material_page_card.dart';
import '09-material_page_stepper.dart';
import '10-material_page_inherit.dart';
import '11-material_page_stream.dart';
import '12-material_page_rx_dart.dart';
import '13-material_page_bloc.dart';
import '14_all_builder.dart';
import '15-material_page_animation.dart';
import '16-material_page_i18n.dart';
import '17-material_page_sql.dart';
import '18-material_page_more_text.dart';
import '19-material_page_plugin.dart';
import '20-material_page_image_picker.dart';
import '21-future_await.dart';
import '22_1_web_view_http.dart';
import '22_2_webView_local_html.dart';
import '23-list_view_page.dart';
import '24-list_view_action_page.dart';
import '25_more_list_view_page.dart';
import '26_test_event_page.dart';
import '27_test_async_page.dart';
import '28_test_route_page.dart';
import '29_animated_list_route.dart';
import '30_basic_app_bar_sample.dart';
import '31_test_animation.dart';
import '32_test_animation.dart';
import '33_db_hvie_page.dart';
import '34_MultiProvider.dart';
import '35_TestTodoList.dart';
import '36_touch_auth_demo_page.dart';
import '37_popup_route_page.dart';
import '38_center_up_page.dart';
import '39_circle_page.dart';
import '40_size_page.dart';
import '41_flutter_redux_app.dart';
import '42_image_browser.dart';

class ShowTestPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MinePage();
  }
}

class _MinePage extends State<ShowTestPage> {
  /// 封装一下
  Widget _listCell(String text, Widget contentWidget) {
    return ListTile(
      title: Text(
        text,
        style: TextStyle(color: Colors.red),
      ),
      onTap: () {
        /// iOS风格push
        Navigator.of(context, rootNavigator: true)
            .push(CupertinoPageRoute(builder: (BuildContext context) {
//          contentWidget.key = Key('111');
          return contentWidget;
        }));

//        push(context: context,widget: contentWidget);
      },
    );
  }

  List<Widget> data = [];

  Widget _itemBuilder(BuildContext context, int index) {
    return data[index];
  }

  Widget _separatorBuilder(BuildContext context, int index) {
    return Divider();
  }

  /// 定义回调函数
  Function({String name, int age}) completeCallback;

  @override
  void initState() {
    super.initState();
    completeCallback = ({String name, int age}) {
      print('name = ${name}');
    };
    print('ShowTestPage = ${widget.runtimeType}');
  }

  @override
  Widget build(BuildContext context) {
    data = [
      _listCell(
        '01-按钮组件1',
        MaterialPage1(),
      ),
      _listCell(
        '02-组件',
        MaterialPage2(),
      ),
      _listCell(
        '03-复选,开关等',
        MaterialPageDate(),
      ),
      _listCell(
        '04-弹窗',
        P04MaterialPageDialog(),
      ),
      _listCell(
        '05-Chip 标签',
        MaterialPageChip(),
      ),
      _listCell(
        '06-DataTable',
        MaterialDataTablePage(),
      ),
      _listCell(
        '07-分页DataTable',
        MaterialPaginatedDataTablePage(),
      ),
      _listCell(
        '08-卡片',
        MaterialPageCard(),
      ),
      _listCell(
        '09-步骤',
        MaterialPageStepper(),
      ),
      _listCell(
        '10-InheritedWidget子widget之间传参',
        MaterialPageInheritedWidget(),
      ),
      _listCell(
        '11-Stream 监听',
        MaterialPageStream(),
      ),
      _listCell(
        '12-RxDart',
        MaterialPageRxDart(),
      ),
      _listCell(
        '13-Bloc业务 依赖 Streams 独家使用输入（Sink）和输出（stream）',
        MaterialPageBloc(),
      ),
      _listCell(
        '14-各种BuilderWidget',
        P14AllBuilderPage(),
      ),
      _listCell(
        '15-动画',
        MaterialPageAnimation(),
      ),
      _listCell(
        '16-国际化',
        MaterialPageI18n(),
      ),
      _listCell(
        '17-本地存储',
        MaterialPageSql(),
      ),
      _listCell(
        '18-多行Text',
        MaterialPageMoreText(),
      ),
      _listCell(
        '19-自定义插件',
        MaterialPagePlugin(),
      ),
      _listCell(
        '20-相机和相册',
        ImagePickerWidget(),
      ),
      _listCell(
        '21-FutureAndAwaitTest',
        FutureAndAwaitTest(),
      ),
      _listCell(
        '22-1-WebView-https',
        WebViewPage(),
      ),
      _listCell(
        '22-2-WebView-本地html',
        LocalHtmlPage(),
      ),
      _listCell(
        '23-ListView',
        ListViewPage(),
      ),
      _listCell(
        '24-ListView,第三方侧滑',
        ListViewActionPage(),
      ),
      _listCell(
        '25-ListView,多个拼接,禁止滚动,截图',
        P25MoreListViewPage(),
      ),
      _listCell(
        '26-EVENT_BUS,封装stream',
        P26TestEventPage(),
      ),
      _listCell(
        '27- async和async*',
        P27AsyncPage(),
      ),
      _listCell(
        '28- 跳转路由',
        P28RoutePage(),
      ),
      _listCell(
        '29- AnimatedList',
        AnimatedListSample(),
      ),
      _listCell(
        '30-包含在溢出下拉菜单中',
        BasicAppBarSample(),
      ),
      _listCell(
        '31-AnimatedWidget',
        P31TestAnimation(),
      ),
      _listCell(
        '32-AnimatedBuilder',
        P32TestAnimation(),
      ),
      _listCell(
        '32-Hive数据存储',
        P33DbHive(),
      ),
      _listCell(
        '34-单个Provider和Consumer',
        P34Provider(),
      ),
      _listCell(
        '34-多个Provider和Consumer',
        P34MultiProvider(),
      ),
      _listCell(
        '35-TestWidget',
        P35TestTodoList(),
      ),
      _listCell(
        '36-识别',
        P36TouchAuthDemoPage(),
      ),
      _listCell(
        '37-P37PopupRoutePage',
        P37PopupRoutePage(),
      ),
      _listCell(
        '38-居中向上布局',
        P38CenterUpPage(),
      ),
      _listCell(
        '39-圆形图片',
        P39CirclePage(),
      ),
      _listCell(
        '40-获得尺寸',
        P40SizePage(),
      ),
      _listCell(
        '41-flutter_redux',
        P41FlutterReduxApp(),
      ),
      _listCell(
        '41-图片',
        P42ImageBrowser(),
      ),
    ];

    return Stack(
      children: <Widget>[
        Scaffold(
          /// 导航栏 加高,添加背景图片
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(200),
            child: AppBar(
              title: Text(
                '测试',
                style: TextStyle(color: Colors.red),
              ),
//          flexibleSpace: Container(
//            decoration: BoxDecoration(
//              image: DecorationImage(
//                image: AssetImage('assets/image/A171.jpg'),
//                fit: BoxFit.fill,
////              repeat :ImageRepeat.repeatY,
//              ),
//              color: Colors.blue,
//            ),
//          ),

              flexibleSpace: Image.asset(
                'assets/image/A171.jpg',
                fit: BoxFit.fill,
                height: double.infinity,
              ),

              centerTitle: true,
              actions: <Widget>[
//          FlatButton(
//            color: Colors.red,
//            child: Text('右1completeCallback'),
//            onPressed: () {
//              completeCallback(name: 'jim', age: 19);
//            },
//          ),

                FlatButton(
                  color: Colors.greenAccent,
                  child: Icon(
                    MyIcons.calendar,
                    color: Colors.orange,
                    size: 40,
                  ),
                  onPressed: () {
                    var OffsetY = MediaQuery.of(context).size.height - 200;

//             var btn =  FlatButton(
//                  child: Icon(Icons.add),
//                  onPressed: (){
//
//                  },
//                );

                    Container(
//                width: 50,
                      height: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
//                    shape:BoxShape.rectangle,
                        border: Border.all(color: Colors.green, width: 1),
                 borderRadius: BorderRadius.circular(20.0),

                        color: Colors.orange,
                      ),
                      child: IconButton(
                        icon: Icon(Icons.add),
//                  iconSize: 100,
//                iconSize: 50,
                        onPressed: () {},
                      ),
                    );
                    var btn = Material(
                        shape: CircleBorder(
                            side: BorderSide(
                          color: Colors.green,
                          width: 2,
                          style: BorderStyle.solid,
                        )),
                        child: IconButton(
                            icon: Icon(Icons.play_arrow),
                            iconSize: 100,
                            onPressed: () {}));

                    var offsetNotifier =
                        ValueNotifier<Offset>(Offset(0, OffsetY));
                    var entry = OverlayEntry(
                        maintainState: true,
                        builder: (BuildContext context) {
                          return ValueListenableBuilder(
                            valueListenable: offsetNotifier,
                            builder: (BuildContext context, Offset value,
                                Widget child) {
                              return Positioned(
                                top: value.dy,
                                left: value.dx,
                                child: Draggable(
                                    //创建可以被拖动的Widget
                                    child: btn,
                                    //拖动过程中的Widget
                                    feedback: btn,
                                    //拖动过程中，在原来位置停留的Widget，设定这个可以保留原本位置的残影，如果不需要可以直接设置为Container()
                                    childWhenDragging: Container(),
                                    //拖动结束后的Widget
                                    onDraggableCanceled:
                                        (Velocity velocity, Offset offset) {
                                      //更新位置信息
                                      offsetNotifier.value = offset;
                                    }),
                              );
                            },
                          );
                        });
                    navigatorState.currentState.overlay.insert(entry);
                  },
                ),
              ],
            ),
          ),

          body: ListView.separated(
            padding: EdgeInsets.only(bottom: 10),
            itemBuilder: _itemBuilder,
            separatorBuilder: _separatorBuilder,
            itemCount: data.length,
          ),
        ),
      ],
    );
  }
}
