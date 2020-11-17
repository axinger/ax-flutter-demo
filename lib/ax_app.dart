import 'dart:io';
import 'dart:ui';

import 'package:ax_flutter_demo/event/login_success_event.dart';
import 'package:ax_flutter_demo/event/update_user_info_event.dart';
import 'package:ax_flutter_demo/generated/l10n.dart';
import 'package:ax_flutter_demo/showpage/01material_page1.dart';
import 'package:ax_flutter_demo/showpage/28_test_route_page.dart';
import 'package:ax_flutter_demo/theme_data_notifier.dart';
import 'package:ax_flutter_util/ax_flutter_util.dart';
import 'package:device_info/device_info.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:package_info/package_info.dart';
import 'package:provider/provider.dart';

import 'controller/root_page.dart';
import 'global_const.dart';
import 'module/login/view/login_view.dart';

class AxApp extends StatefulWidget {
//  var adapter = Hive.registerAdapter(StudentAdapter(),0);
//  void log(String? name){
//print();
//
//  }

  @override
  State<StatefulWidget> createState() {
    return _MyApp();
  }
}

///WidgetsBindingObserver 进入后台
class _MyApp extends State<AxApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    /// build完成
    WidgetsBinding.instance.addPostFrameCallback((callback) {
//      _overlayEntry();
      if (mounted) {
        _overlayEntry();
      }
    });
    eventBus();

    getDeviceInfo();
    packageInfo();

//    testStr = 'tom';
//    testStr2 = 'tom';
//window.padding;
    time3 = DateTime.now();

    ///需要注意的是，匿名函数声明调用结束时追加了小括号（），
    ///这是因为断言只能检查布尔值，这里使用括号强制执行这个始终返回true的匿名函数，以保证函数里的代码被执行
//    assert((1==2){
//      // Do something for debug
//      print('这是asset下的输出内容');
//      return true;
//    };

    if (kReleaseMode) {
      //
      //release
      print('Mode = kReleaseMode');
    } else {
      //debug
      print('Mode = kBug');
    }

    const bool inProduction = const bool.fromEnvironment("dart.vm.product");
    print('inProduction = $inProduction');
    _androidBack();
    _boost();

    /// FlutterBoost 注册
//    FlutterBoost.singleton.registerPageBuilders(
//      {
//        "route_MaterialPage1": (pageName, params, _) => MaterialPage1(),
//      },
//    );

//    FlutterBoost.singleton
//        .addBoostNavigatorObserver(TestBoostNavigatorObserver());

    /// debug 不会被打印
//    log.Logger.level = log.Level.info;

//    getTemporaryDirectory().then((value) {
//      String tempPath = value.path;
//    });
//
//    getApplicationDocumentsDirectory().then((value) {
//      String appDocPath = value.path;
//    });
//
//    accelerometerEvents.listen((AccelerometerEvent event) {
//      print(event);
//    });
//// [AccelerometerEvent (x: 0.0, y: 9.8, z: 0.0)]
//
//    userAccelerometerEvents.listen((UserAccelerometerEvent event) {
//      print(event);
//    });
//// [UserAccelerometerEvent (x: 0.0, y: 0.0, z: 0.0)]
//
//    gyroscopeEvents.listen((GyroscopeEvent event) {
//      print(event);
//    });
// [GyroscopeEvent (x: 0.0, y: 0.0, z: 0.0)]
  }

  @override
  Widget build(BuildContext context) {
    return _buildMultiProvider;
  }

  /// 监听安卓返回按键
  void _androidBack() {
    const basicMessageChannel =
        const BasicMessageChannel('Android_back', StringCodec());

//接受并回复消息
    basicMessageChannel.setMessageHandler(
      (String message) => Future<String>(() {
        print('收到消息===============');

//        setState(() {
//          this.message = message;
//        });
        return "回复native消息";
      }),
    );
  }

  /// 咸鱼路由
  void _boost() {
//    FlutterBoost.singleton.registerPageBuilders(<String, PageBuilder>{
//      '/P28RoutePageSub1':
//          (String pageName, Map<String, dynamic> params, String uniqueId) {
//        print('P00ShowTestPage params:$params');
//        return P28RoutePageSub1();
//      },
//
//      ///可以在native层通过 getContainerParams 来传递参数
//      'aa': (String pageName, Map<String, dynamic> params, String uniqueId) {
//        print('P47RouteWidget params:$params');
//
//        return P47RouteWidget(map: params);
//      },
//
//      ///可以在native层通过 getContainerParams 来传递参数
//      'P47RouteWidget2':
//          (String pageName, Map<String, dynamic> params, String uniqueId) {
//        print('P47RouteWidget2 params:$params');
//
//        return P47RouteWidget2();
//      },
//    });
//    FlutterBoost.singleton
//        .addBoostNavigatorObserver(TestBoostNavigatorObserver());
  }

  /// 全局浮层
  void _overlayEntry() {
    var btn = Material(
      color: Colors.transparent,
      shape: CircleBorder(
        side: BorderSide(
          color: Colors.green,
          width: 2,
          style: BorderStyle.solid,
        ),
      ),
      child: GestureDetector(
        child: Container(
          width: 80,
          height: 80,
          color: Colors.transparent,
          child: Icon(Icons.add),
        ),
        onTap: () {
          print('add==========');
        },
      ),
    );

    double OffsetY = 200;
    ValueNotifier<Offset> offsetNotifier =
        ValueNotifier<Offset>(Offset(0, OffsetY));
    var entry = OverlayEntry(
        maintainState: true,
        builder: (BuildContext context) {
          return ValueListenableBuilder(
            valueListenable: offsetNotifier,
            builder: (BuildContext context, Offset value, Widget child) {
              return Positioned(
                top: value.dy > 0 ? value.dy : 0,
                left: value.dx > 0 ? value.dx : 0,
                child: Draggable(
                    //创建可以被拖动的Widget
                    child: btn,
                    //拖动过程中的Widget
                    feedback: btn,
                    //拖动过程中，在原来位置停留的Widget，设定这个可以保留原本位置的残影，如果不需要可以直接设置为Container()
                    childWhenDragging: Container(),
                    //拖动结束后的Widget
                    onDraggableCanceled: (Velocity velocity, Offset offset) {
                      //更新位置信息
                      offsetNotifier.value = offset;
                    }),
              );
            },
          );
        });
    navigatorStateKey?.currentState?.overlay?.insert(entry);
  }

  void getDeviceInfo() async {
    DeviceInfoPlugin deviceInfo = new DeviceInfoPlugin();
    if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      print('IOS设备 = ${iosInfo.toString()}');
    } else if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      print('Android设备 = $androidInfo}');
    }
  }

  void packageInfo() async {
    PackageInfo.fromPlatform().then((PackageInfo packageInfo) {
      String appName = packageInfo.appName;
      String packageName = packageInfo.packageName;
      String version = packageInfo.version;
      String buildNumber = packageInfo.buildNumber;
      print(
          "appName = $appName packageName = $packageName version = $version buildNumber = $buildNumber");
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print("state = " + state.toString());
    switch (state) {
      case AppLifecycleState.inactive: // 处于这种状态的应用程序应该假设它们可能在任何时候暂停。
        print("app转态 不活跃");
        break;
      case AppLifecycleState.resumed: // 应用程序可见，前台
        print("app转态 前台");
        break;
      case AppLifecycleState.paused: // 应用程序不可见，后台
        print("app转态 后台");
        break;
      case AppLifecycleState.detached: // 申请将暂时暂停
        print("app转态 暂时暂停");
        break;
    }
  }

  void eventBus() {
    EVENT_BUS.on<UpdateUserInfoEvent>().listen((event) {
      print("UpdateUserInfoEvent = " + event.name);
    });
    EVENT_BUS.on<LoginSuccessEvent>().listen((event) {
      print("LoginSuccessEvent = " + event.name);
    });
  }

  Widget get _rootView {
    /// 全局点击空白处隐藏键盘
//    return GestureDetector(
//      onTap: () {
//        FocusScopeNode currentFocus = FocusScope.of(context);
//        if (!currentFocus.hasPrimaryFocus &&
//            currentFocus.focusedChild != null) {
//          FocusManager.instance.primaryFocus.unfocus();
//        }
//      },
//      child: P00ShowTestPage(),
////      child: DismissKeyboardDemo(),
//    );

    // return P00ShowTestPage();
    return RootPage();
//   return RootPage();
  }

  Widget get _buildMultiProvider {
    return MultiProvider(
      providers: [
//        ChangeNotifierProvider(create: (context) => mainConfigModel),
        ChangeNotifierProvider.value(value: ThemeDataNotifier())
      ],
      child: Consumer<ThemeDataNotifier>(
        builder: (context, value, child) {
          return _materialApp(value.themeData);
        },
      ),
    );
  }

  MaterialApp _materialApp(ThemeData themeData) {
    ///
    Color _foregroundColor(Set<MaterialState> states) {
//      const Set<MaterialState> interactiveStates = <MaterialState>{
//        ///按下
//        MaterialState.pressed,
//        ///徘徊 应该是长按
//        MaterialState.hovered,
//        /// 集中
//        MaterialState.focused,
//        MaterialState.selected,
//      };
//
//      if (states == MaterialState.pressed) {
//        return Colors.orange;
//      }
//      if (states == MaterialState.hovered) {
//        return Colors.orange;
//      }
//      if (states == MaterialState.selected) {
//        return Colors.purple;
//      }
//      if (states.any(interactiveStates.contains)) {
//        return Colors.blue;
//      }
//      return Colors.red;
      if (states.contains(MaterialState.focused) &&
          !states.contains(MaterialState.pressed)) {
        ///获取焦点时的颜色
        return Colors.blue;
      } else if (states.contains(MaterialState.pressed)) {
        ///按下时的颜色
        return Colors.lightBlueAccent;
      } else if (states.contains(MaterialState.disabled)) {
        return Colors.grey[600];
      } else if (states.contains(MaterialState.selected)) {
        return Colors.purple;
      } else {
        return Colors.red;
      }
    }

    return MaterialApp(
      title: '阿星 Flutter Demo',
      navigatorKey: navigatorStateKey,
      debugShowCheckedModeBanner: false,
      theme: ThemeData().copyWith(
        primaryColor: themeData.primaryColor ?? Colors.red,
//        backgroundColor: Colors.lightBlue,
//        scaffoldBackgroundColor: Colors.lightBlueAccent,
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.orange,
        ),

        /// TextButton 主题
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            /// foregroundColor 文字颜色
//                  foregroundColor: MaterialStateColor.resolveWith(getColor),
            /// 这里可以控制不同状态颜色
            foregroundColor: MaterialStateColor.resolveWith(_foregroundColor),

            /// all 所有状态颜色
            // foregroundColor:MaterialStateProperty.all(Colors.red),
            /// 这里设置文字颜色无效
            textStyle: MaterialStateProperty.all(
                TextStyle(color: Colors.white, fontSize: 16)),
            // minimumSize: MaterialStateProperty.all(Size(100, 30)),
            /// 如何去掉边距(padding)
            // minimumSize: MaterialStateProperty.all(Size(0, 0)),
            // padding: MaterialStateProperty.all(EdgeInsets.zero),
            backgroundColor: MaterialStateProperty.resolveWith((states) {
              //设置按下时的背景颜色
              if (states.contains(MaterialState.pressed)) {
                return Colors.blue[200];
              } else if (states.contains(MaterialState.disabled)) {
                return Colors.greenAccent;
              } else {
                ///默认背景颜色
                return Colors.orange;
              }
            }),
          ),
        ),
      ),

      /// 本地化
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        S.delegate,
      ],
      supportedLocales: [
        const Locale("en", ""),
        const Locale("zh", "CN"),
      ]..addAll(S.delegate.supportedLocales),

      home: _rootView,

//      home: P00ShowTestPage(),
      /// 影响我的浮层
//      builder: FlutterBoost.init(postPush: _onRoutePushed),
//      builder: FlutterBoost.init(),
      /// 根路由,一般设置 和 onGenerateRoute 冲突,不能同时存在
//      initialRoute: "/",
      routes: {
        "/Root": (context) => RootPage(),
        "/route_login": (context) => LoginView(),
        "/P28RoutePage": (context) => P28RoutePage(),
        "/P28RoutePageSub1": (context) => P28RoutePageSub1(),
        "/P28RoutePageSub2": (context) => P28RoutePageSub2(),
        "/P28RoutePageSub3": (context) => P28RoutePageSub3(),
        "/MaterialPage1": (context) => MaterialPage1(),
      },

      /// Navigator.of(context).pushNamed('/new');  Navigator.pushNamed 时无法直接给新页面传参数
      ///和 routes 冲突 可以传参的，相比于命名路由，可以多做一些相关的拦截
//      onGenerateRoute: (RouteSettings settings) {
//        String routeName = settings.name;
//        print("routeName = : $routeName");
//        print("settings.arguments: ${settings.arguments}");
//        switch (routeName) {
//          case "/sub2":
//            return MaterialPageRoute(builder: (context) {
//              return P28RoutePageSub2(
//                sub2Map: settings.arguments,
//              );
//            });
//          default:
//            return MaterialPageRoute(builder: (BuildContext context) {
//              return Scaffold(
//                  body: Center(
//                child: Text("Page not found"),
//              ));
//            });
//        }
//      },
    );
  }

  void _onRoutePushed(
      String pageName, String uniqueId, Map params, Route route, Future _) {
    print('_onRoutePushed == $pageName  uniqueId = $uniqueId');
  }
}

class TestBoostNavigatorObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic> previousRoute) {
    print('flutterboost#didPush');
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic> previousRoute) {
    print('flutterboost#didPop');
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic> previousRoute) {
    print('flutterboost#didRemove');
  }

  @override
  void didReplace({Route<dynamic> newRoute, Route<dynamic> oldRoute}) {
    print('flutterboost#didReplace');
  }
}

class DismissKeyboardDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: FlatButton(
          child: Text('0000'),
          onPressed: () {
            push(context: context, widget: DismissKeyboardDemo2());
          },
        ),
      ),
    );
  }
}

class DismissKeyboardDemo2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: TextField(),
      ),
    );
  }
}
