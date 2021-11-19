import 'dart:async';

import 'package:ax_flutter_demo/_01widget_demo/page/01_demo_text_field.dart';
import 'package:ax_flutter_demo/_01widget_demo/page/06_table_page.dart';
import 'package:ax_flutter_demo/_01widget_demo/page/63_bottom_up.dart';
import 'package:ax_flutter_util/ax_flutter_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../_01root/root_cell.dart';
import '../_01widget_demo/page/01_content_page1.dart';
import '../_01widget_demo/page/01_content_page2.dart';
import '../_01widget_demo/page/01_content_page3.dart';
import '../_01widget_demo/page/01_content_page4.dart';
import '../_01widget_demo/page/02-slivergrid_page.dart';
import '../_01widget_demo/page/03material_page_date.dart';
import '../_01widget_demo/page/04material_page_dialog.dart';
import '../_01widget_demo/page/05-material_page_chip.dart';
import '../_01widget_demo/page/06-material_page_data_table.dart';
import '../_01widget_demo/page/07-material_page_data_table2.dart';
import '../_01widget_demo/page/08-material_page_card.dart';
import '../_01widget_demo/page/09-material_page_stepper.dart';
import '../_01widget_demo/page/10-material_page_inherit.dart';
import '../_01widget_demo/page/11-material_page_stream.dart';
import '../_01widget_demo/page/12-material_page_rx_dart.dart';
import '../_01widget_demo/page/13-material_page_bloc.dart';
import '../_01widget_demo/page/14_all_builder.dart';
import '../_01widget_demo/page/15_animation_demo.dart';
import '../_01widget_demo/page/16-material_page_i18n.dart';
import '../_01widget_demo/page/17-material_page_sql.dart';
import '../_01widget_demo/page/18-material_page_more_text.dart';
import '../_01widget_demo/page/19-material_page_plugin.dart';
import '../_01widget_demo/page/20-material_page_image_picker.dart';
import '../_01widget_demo/page/21-future_await.dart';
import '../_01widget_demo/page/22_1_web_view_http.dart';
import '../_01widget_demo/page/22_2_webView_local_html.dart';
import '../_01widget_demo/page/23-list_view_page.dart';
import '../_01widget_demo/page/25_more_list_view_page.dart';
import '../_01widget_demo/page/26_test_event_page.dart';
import '../_01widget_demo/page/27_test_async_page.dart';
import '../_01widget_demo/page/28_test_route_page.dart';
import '../_01widget_demo/page/29_animated_list_route.dart';
import '../_01widget_demo/page/30_basic_app_bar_sample.dart';
import '../_01widget_demo/page/31_test_animation.dart';
import '../_01widget_demo/page/32_test_animation.dart';
import '../_01widget_demo/page/33_db_hvie_page.dart';
import '../_01widget_demo/page/34_MultiProvider.dart';
import '../_01widget_demo/page/35_TestTodoList.dart';
import '../_01widget_demo/page/36_touch_auth_demo_page.dart';
import '../_01widget_demo/page/38_center_up_page.dart';
import '../_01widget_demo/page/39_circle_page.dart';
import '../_01widget_demo/page/42_net_test_page.dart';
import '../_01widget_demo/page/43_search_page.dart';
import '../_01widget_demo/page/44_camera_demo_page.dart';
import '../_01widget_demo/page/45_hero_demo.dart';
import '../_01widget_demo/page/46_material_motion.dart';
import '../_01widget_demo/page/48_PhotoAlbumGridView.dart';
import '../_01widget_demo/page/49_dismissible.dart';
import '../_01widget_demo/page/50_on_pop_page.dart';
import '../_01widget_demo/page/51_nested_scroll_view.dart';
import '../_01widget_demo/page/52scrollable_positioned_list.dart';
import '../_01widget_demo/page/53draggable_scrollable_sheet.dart';
import '../_01widget_demo/page/54_sliver_persisten.dart';
import '../_01widget_demo/page/55_bottom_tab_bar_widget.dart';
import '../_01widget_demo/page/56_stateful_builder.dart';
import '../_01widget_demo/page/57_custom_route.dart';
import '../_01widget_demo/page/58_navigation_rail_page.dart';
import '../_01widget_demo/page/59_get_value_page.dart';
import '../_01widget_demo/page/60_get_more_page.dart';
import '../_01widget_demo/page/61_get_future_page.dart';
import '../_01widget_demo/page/62_lottie_page.dart';
import '../_01widget_demo/page/62_shimmer_page.dart';
import '../generated/l10n.dart';
import '../module/login/view/login_view.dart';

class RootHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RootHomePageState();
  }
}

class _RootHomePageState extends State<RootHomePage> {
  ///Flutter&Dart Callback转同步 https://www.jianshu.com/p/e5cba8ca96bc
  Future<void> initFinish() async {
    Completer<void> completer = Completer();

    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      print('回调=============1');
      completer.complete();
    });

    print('回调=============2');
    return completer.future;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   print('回调=============1');
    // });
    //
    // print('回调=============2');

    // initFinish().then((value){
    //   print('回调=============3');
    // });
    // print('回调=============4');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        /// 导航栏 加高,添加背景图片
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(200),
          child: AppBar(
            title: Text(
              S.of(context).test_title,
              style: TextStyle(color: Colors.red),
            ),
            flexibleSpace: Image.asset(
              'assets/image/A171.jpg',
              fit: BoxFit.fill,
              height: double.infinity,
            ),
            centerTitle: true,
            actions: <Widget>[],
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Wrap(
                children: dataList.map((e) {
              e.index = dataList.indexOf(e);
              return Cell(e);
            }).toList()),
          ),
        ));
  }

  List<CellItem> get dataList {
    return [
      CellItem(
          title: 'LoginView',
          subTitle: '从下往上弹出',
          onTap: () {
            // push(context: context, widget: LoginView());

            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) {
                return LoginView();
              },

              /// 从下往上
              fullscreenDialog: true,
            ));
          }),
      CellItem(
          title: '01-按钮组件1',
          subTitle: '01_content_page1.dart',
          onTap: () {
            push(context: context, widget: P01ContentPage());
          }),
      CellItem(
          title: '01_组件',
          subTitle: '01_content_page2.dart',
          onTap: () {
            push(context: context, widget: P01ContentPage2());
          }),
      CellItem(
          title: '01-组件',
          subTitle: '01_content_page3.dart',
          onTap: () {
            push(context: context, widget: P01ContentPage3());
          }),
      CellItem(
          title: '01-TextField',
          subTitle: '01_demo_text_field.dart',
          onTap: () {
            push(context: context, widget: DemoTextField());
          }),
      CellItem(
          title: '01-圆角组件',
          subTitle: '01_content_page4.dart',
          onTap: () {
            push(context: context, widget: P01ContentPage4());
          }),
      CellItem(
          title: '02-SliverList 和 SliverGrid',
          onTap: () {
            push(context: context, widget: P02SlivergridPage());
          }),
      CellItem(
          title: '03-复选,开关等',
          onTap: () {
            push(context: context, widget: MaterialPageDate());
          }),
      CellItem(
          title: '04-弹窗',
          onTap: () {
            push(context: context, widget: P04MaterialPageDialog());
          }),
      CellItem(
          title: '05-Chip 标签',
          onTap: () {
            push(context: context, widget: MaterialPageChip());
          }),
      CellItem(
          title: '06-Table',
          onTap: () {
            push(context: context, widget: DemoTablePage());
          }),
      CellItem(
          title: '06-DataTable',
          onTap: () {
            push(context: context, widget: MaterialDataTablePage());
          }),
      CellItem(
          title: '07-分页DataTable',
          onTap: () {
            push(context: context, widget: MaterialPaginatedDataTablePage());
          }),
      CellItem(
          title: '08-卡片',
          onTap: () {
            push(context: context, widget: MaterialPageCard());
          }),
      CellItem(
          title: '09-步骤',
          onTap: () {
            push(context: context, widget: MaterialPageStepper());
          }),
      CellItem(
          title: '10-InheritedWidget子widget之间传参',
          onTap: () {
            push(context: context, widget: MaterialPageInheritedWidget());
          }),
      CellItem(
          title: '11-Stream 监听',
          onTap: () {
            push(context: context, widget: MaterialPageStream());
          }),
      CellItem(
          title: '12-RxDart',
          onTap: () {
            push(context: context, widget: MaterialPageRxDart());
          }),
      CellItem(
          title: '13-Bloc业务',
          subTitle: ' 依赖 Streams 独家使用输入（Sink）和输出（stream）',
          onTap: () {
            push(context: context, widget: MaterialPageBloc());
          }),
      CellItem(
          title: '14-各种BuilderWidget',
          onTap: () {
            push(context: context, widget: P14AllBuilderPage());
          }),
      CellItem(
          title: '15-动画',
          onTap: () {
            push(context: context, widget: P15AnimationDemo());
          }),
      CellItem(
          title: '16-国际化',
          onTap: () {
            push(context: context, widget: MaterialPageI18n());
          }),
      CellItem(
          title: '17-本地存储',
          onTap: () {
            push(context: context, widget: MaterialPageSql());
          }),
      CellItem(
          title: '18-多行Text',
          onTap: () {
            push(context: context, widget: MaterialPageMoreText());
          }),
      CellItem(
          title: '19-自定义插件',
          onTap: () {
            push(context: context, widget: MaterialPagePlugin());
          }),
      CellItem(
          title: '20-相机和相册',
          onTap: () {
            push(context: context, widget: ImagePickerWidget());
          }),
      CellItem(
          title: '21-FutureAndAwaitTest',
          onTap: () {
            push(context: context, widget: FutureAndAwaitTest());
          }),
      CellItem(
          title: '22-1-WebView-https',
          onTap: () {
            push(context: context, widget: WebViewPage());
          }),
      CellItem(
          title: '22-2-WebView-本地html',
          onTap: () {
            push(context: context, widget: LocalHtmlPage());
          }),
      CellItem(
          title: '23-ListView',
          onTap: () {
            push(context: context, widget: ListViewPage());
          }),
      CellItem(
          title: '24-ListView,第三方侧滑',
          onTap: () {
            // push(context: context, widget: ListViewActionPage());
          }),
      CellItem(
          title: '25-ListView,多个拼接,禁止滚动,截图',
          onTap: () {
            push(context: context, widget: P25MoreListViewPage());
          }),
      CellItem(
          title: '26-EVENT_BUS,封装stream',
          onTap: () {
            push(context: context, widget: P26TestEventPage());
          }),
      CellItem(
          title: '27- async和async*',
          onTap: () {
            push(context: context, widget: P27AsyncPage());
          }),
      CellItem(
          title: '28- 跳转路由',
          onTap: () {
            push(context: context, widget: P28RoutePage());
          }),
      CellItem(
          title: '29- AnimatedList',
          onTap: () {
            push(context: context, widget: AnimatedListSample());
          }),
      CellItem(
          title: '30-包含在溢出下拉菜单中',
          onTap: () {
            push(context: context, widget: BasicAppBarSample());
          }),
      CellItem(
          title: '31-AnimatedWidget',
          onTap: () {
            push(context: context, widget: P31TestAnimation());
          }),
      CellItem(
          title: '32-AnimatedBuilder',
          onTap: () {
            push(context: context, widget: P32TestAnimation());
          }),
      CellItem(
          title: '32-Hive数据存储',
          onTap: () {
            push(context: context, widget: P33DbHive());
          }),
      CellItem(
          title: '34-单个Provider和Consumer',
          onTap: () {
            push(context: context, widget: P34Provider());
          }),
      CellItem(
          title: '34-多个Provider和Consumer',
          onTap: () {
            push(context: context, widget: P34MultiProvider());
          }),
      CellItem(
          title: '35-TestWidget',
          onTap: () {
            push(context: context, widget: P35TestTodoList());
          }),
      CellItem(
          title: '36-识别',
          onTap: () {
            push(context: context, widget: P36TouchAuthDemoPage());
          }),
      CellItem(
          title: '37-P37PopupRoutePage',
          onTap: () {
            // push(context: context, widget: P37PopupRoutePage());
          }),
      CellItem(
          title: '38-居中向上布局',
          onTap: () {
            push(context: context, widget: P38CenterUpPage());
          }),
      CellItem(
          title: '39-圆形图片',
          onTap: () {
            push(context: context, widget: P39CirclePage());
          }),
      CellItem(
          title: '40-获得尺寸',
          onTap: () {
            // push(context: context, widget: P40SizePage());
          }),
      CellItem(
          title: '41-flutter_redux',
          onTap: () {
            // push(context: context, widget: P41FlutterReduxApp());
          }),
      CellItem(
          title: '41-图片',
          onTap: () {
//            push(context: context, widget: P42ImageBrowser());
          }),
      CellItem(
          title: '42-自定义服务器请求',
          onTap: () {
            push(context: context, widget: P42NetTestPage());
          }),
      CellItem(
          title: '43-搜索',
          onTap: () {
            push(context: context, widget: P43SearchPage());
          }),
      CellItem(
          title: '44-自定义相机',
          onTap: () {
            push(context: context, widget: CameraDemoPage());
          }),
      CellItem(
          title: '45-HeroDemo',
          onTap: () {
            push(context: context, widget: P45HeroDemo());
          }),
      CellItem(
          title: '46-MaterialMotion',
          onTap: () {
            push(context: context, widget: P46MaterialMotion());
          }),
      CellItem(
          title: '47-FlutterBoost',
          onTap: () {
            print('==============');
//            FlutterBoost.singleton
//                .open('aa', urlParams: <String, dynamic>{'present': true}).then(
//                    (Map<dynamic, dynamic> value) {
//              print('FlutterBoost =  $value');
//            });
          }),
      CellItem(
          title: '48-图片浏览器',
          onTap: () {
            push(context: context, widget: P48PhotoAlbum());
          }),
      CellItem(
          title: '49-侧滑删除',
          onTap: () {
            push(context: context, widget: P49DismissibleWidget());
          }),
      CellItem(
          title: '50-Navigator 2.0',
          onTap: () {
            push(context: context, widget: P50OnPopPage());
          }),
      CellItem(
          title: '51-NestedScrollView',
          onTap: () {
            push(context: context, widget: P51NestedScrollView());
          }),
      CellItem(
          title: '52-跳转指定位置',
          onTap: () {
            push(context: context, widget: P52ScrollablePositionedList());
          }),
      CellItem(
          title: '53-拖拽滚动布局',
          onTap: () {
            push(context: context, widget: P53DraggableScrollableSheet());
          }),
      CellItem(
          title: '54 吸顶效果1',
          onTap: () {
            push(context: context, widget: P54SliverPersisten());
          }),
      CellItem(
          title: 'P55BottomTabBarWidget',
          onTap: () {
            push(context: context, widget: P55BottomTabBarWidget());
          }),
      CellItem(
          title: 'P56StatefulBuilder局部刷新',
          onTap: () {
            push(context: context, widget: P56StatefulBuilder());
          }),
      CellItem(
          title: 'P57自定义路由动画',
          onTap: () {
            push(context: context, widget: P57CustomRoute());
          }),
      CellItem(
          title: 'P58通常展示在应用程序的左边或者右边',
          onTap: () {
            push(context: context, widget: P58NavigationRailPage());
          }),
      CellItem(
          title: 'P59Get框架 改变主题',
          onTap: () {
            Get.changeTheme(
                Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
          }),
      CellItem(
          title: 'P59Get传值,\n用Get.to跳转,才能恢复初始值',
          onTap: () {
            // push(context: context, widget: P59CounterGetPage());
            Get.to(() => P59CounterGetPage())?.then((value) {
              print('then = $value');
              print('CounterController2 = ${Get.find<CounterController2>()}');
            }).whenComplete(() {
              print(
                  'whenComplete CounterController2 = ${Get.find<CounterController2>()}');
            });
          }),
      CellItem(
          title: 'P60Get跨页面传值',
          onTap: () {
            // push(context: context, widget: P60JumpOnePage());
            Get.to(P60JumpOnePage());
          }),
      CellItem(
          title: 'P61长按拖动',
          onTap: () {
            Get.to(P61CounterGetPage());
          }),
      CellItem(
          title: 'P62Lottie动画',
          onTap: () {
            Get.to(P62LottiePage());
          }),
      CellItem(
          title: 'P62ShimmerPage鱼骨图',
          onTap: () {
            Get.to(P62ShimmerPage());
          }),
      CellItem(
          title: 'P63BottomUpPage 底部跟随弹起',
          onTap: () {
            Get.to(P63BottomUpPage());
          }),
    ];
  }
}
