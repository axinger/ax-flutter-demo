import 'package:ax_flutter_demo/_01root/root_page.dart';
import 'package:ax_flutter_demo/_02get_demo/page/02route_view.dart';
import 'package:ax_flutter_demo/_02get_demo/page/03order_binding.dart';
import 'package:ax_flutter_demo/_02get_demo/page/03order_detail_binding.dart';
import 'package:ax_flutter_demo/_02get_demo/page/03order_detail_view.dart';
import 'package:ax_flutter_demo/_02get_demo/page/03order_view.dart';
import 'package:ax_flutter_demo/_02get_demo/page/myView.dart';
import 'package:ax_flutter_demo/_02get_demo/page/not_found_view.dart';
import 'package:ax_flutter_demo/_02get_demo/page/route_auth_middleware.dart';
import 'package:ax_flutter_demo/module/login/view/login_view.dart';
import 'package:get/get.dart';

abstract class AppRoutes {
  static const route_pages = '/route_pages';
  static const not_found = '/notfound';
  static const Home = '/Home';
  static const Login = '/login';
  static const My = '/my';
  static const order = '/order';
  static const orderDetail = '/orderDetail';
}

abstract class RoutePages {
  static final List<GetPage>? pages = [
    GetPage(
      name: AppRoutes.Home,
      page: () => RootPage(),
    ),
    GetPage(
      name: AppRoutes.route_pages,
      page: () => RouteDemo(),
    ),
    GetPage(
      name: AppRoutes.Login,
      page: () => LoginView(),
    ),
    GetPage(
      name: AppRoutes.My,
      page: () => MyView(),
      transition: Transition.downToUp,
      middlewares: [
        RouteAuthMiddleware(priority: 1),
      ],
    ),
    GetPage(
      name: AppRoutes.order,
      page: () => OrderView(),
      bindings: [OrderBinding()],
    ),
    GetPage(
      name: AppRoutes.orderDetail,
      page: () => OrderDetailView(),
      bindings: [OrderDetailBinding()],
    ),
  ];

  static final notFoundRoute = GetPage(
    name: AppRoutes.not_found,
    page: () => NotfoundView(),
  );
}
