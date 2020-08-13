import 'dart:io';
import 'dart:ui';

import 'package:ax_flutter_demo/event/login_success_event.dart';
import 'package:ax_flutter_demo/event/update_user_info_event.dart';
import 'package:ax_flutter_demo/generated/l10n.dart';
import 'package:ax_flutter_demo/showpage/01material_page1.dart';
import 'package:ax_flutter_demo/showpage/28_test_route_page.dart';
import 'package:device_info/device_info.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:package_info/package_info.dart';
import 'package:provider/provider.dart';

import 'controller/root_cupertino_tab_bar.dart';
import 'controller/root_page.dart';
import 'global_const.dart';
import 'main_config_model.dart';
import 'module/authentication/authentication_event.dart';
import 'module/login/view/login_view.dart';
//void main() => runApp(MyApp());

//void main() async {
////  BlocSupervisor.delegate = SimpleBlocDelegate();
//  runApp(
//    /// 必须先建立一个 bloc
//    BlocProvider<AuthenticationBloc>(
//      create: (context) {
//        /// 监听需要的类型 AuthenticationBloc 内部处理
//        return AuthenticationBloc()
//
//          /// 主动发一个请求
//          ..add(AuthenticationStartedEvent());
////          ..add(AuthenticationLoggedInEvent());
//      },
//      child: MyApp(),
//    ),
//  );
//}

void main() async {
//  await Future.delayed(Duration(seconds: 2));
//  EVENT_BUS.fire(AuthenticationLoggedInEvent(user: UserRepository(username: 'jim',password: '123')));
  runApp(MyApp());

//  Provider
//  BlocProvider();
}

class MyApp extends StatefulWidget {
//  var adapter = Hive.registerAdapter(StudentAdapter(),0);
  @override
  State<StatefulWidget> createState() {
    return _MyApp();
  }
}

///WidgetsBindingObserver 进入后台
class _MyApp extends State<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    /// build完成
    WidgetsBinding.instance.addPostFrameCallback((callback) {
      _overlayEntry();
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

  /// 全局浮层
  void _overlayEntry() {
    var btn = Material(
      shape: CircleBorder(
        side: BorderSide(
          color: Colors.green,
          width: 2,
          style: BorderStyle.solid,
        ),
      ),
      child: GestureDetector(
        child: Container(
          width: 50,
          height: 50,
          child: Icon(Icons.add),
        ),
        onTap: () {
          print('add==========');
        },
      ),
    );
//      IconButton(
//        icon: Icon(Icons.add),
//        iconSize: 50,
//        onPressed: () {},
//      ),

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
    navigatorStateKey.currentState.overlay.insert(entry);
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
    String name;

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
    /// ios fe
    return RootTabBar();

//   return RootPage();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => mainConfigModel),
      ],
      child: Consumer<MainConfigModel>(
        builder: (context, value, child) {
//      return Text(Provider.of<UserModel>(context).age.toString());

          return MaterialApp(
            title: 'Flutter Demo',
            navigatorKey: navigatorStateKey,
            debugShowCheckedModeBanner: false,

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

//      home: RootPage(),

//      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
//        builder: (context, state) {
//          print("state ==1 $state");
//
//          if (state is AuthenticationSuccess) {
//            return RootPage();
//          } else if (state is AuthenticationFailure) {
//            return LoginView();
//          } else {
//            return LoadingIndicator();
//          }
//        },
//      ),
            home: StreamBuilder(
              stream: EVENT_BUS.on<AuthenticationEvent>(),
//        initialData: "初始值",
              builder: (context, asyncSnapshot) {
                if (asyncSnapshot.data is AuthenticationLoggedInEvent) {
                  print(
                      'main - asyncSnapshot = ${(asyncSnapshot.data as AuthenticationLoggedInEvent).user.username}');
                  return _rootView;
                }

//          return LoginView();
                return _rootView;
              },
            ),

//      builder: FlutterBoost.init(postPush: _onRoutePushed),

//            theme: ThemeData(
//              /**
//             * primarySwatch不是Color.这是MaterialColor.
//                这意味着它是材质应用程序将使用的颜色的不同色调.
//                primaryColor是其中一种阴影.确切地说,primaryColor通常等于primarySwatch [500].
//                通常最好定义primarySwatch而不是primaryColor.因为某些材质组件可能会使用不同的primaryColor阴影来处理阴影,边框等
//             */
//              primaryColor: Colors.lightBlue,
//
//              /// 主要样品颜色 是 MaterialColor
////        primarySwatch: Colors.lightBlue,
//              highlightColor: Colors.grey,
////bottomAppBarColor: Colors.orange,
////        splashColor: Colors.orange,
//
//              appBarTheme: AppBarTheme(
//                ///导航按钮颜色
//                iconTheme: IconThemeData(color: Colors.white),
//              ),
//
//              /// 按钮统一颜色
//              buttonColor: Colors.deepPurpleAccent,
//
//              /// 容器默认背景色
////        scaffoldBackgroundColor: ColorScheme().background,
//              buttonTheme: ButtonThemeData(
//                buttonColor: Colors.black,
//              ),
//            ),

//          theme:  Provider.of<MainConfigModel>(context).themeData,

            theme: value.themeData,

            /// 根路由,一般设置 和 onGenerateRoute 冲突,不能同时存在
            initialRoute: "/",
            routes: {
              "/Root": (context) => RootPage(),
              "/route_login": (context) => LoginView(),
              "/p28": (context) => P28RoutePage(),
              "/sub1": (context) => P28RoutePageSub1(),
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
        },
      ),
    );
  }

  void _onRoutePushed(
      String pageName, String uniqueId, Map params, Route route, Future _) {}
}

//class TestBoostNavigatorObserver extends BoostNavigatorObserver {
//  void didPush(Route<dynamic> route, Route<dynamic> previousRoute) {
//    print("flutterboost#didPush");
//  }
//
//  void didPop(Route<dynamic> route, Route<dynamic> previousRoute) {
//    print("flutterboost#didPop");
//  }
//
//  void didRemove(Route<dynamic> route, Route<dynamic> previousRoute) {
//    print("flutterboost#didRemove");
//  }
//
//  void didReplace({Route<dynamic> newRoute, Route<dynamic> oldRoute}) {
//    print("flutterboost#didReplace");
//  }
//}
