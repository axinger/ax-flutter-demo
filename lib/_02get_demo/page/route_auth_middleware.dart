import 'package:ax_flutter_demo/_02get_demo/route/route_pages.dart';
import 'package:ax_flutter_demo/model/user_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RouteAuthMiddleware extends GetMiddleware {
  @override
  int? priority = 2;

  RouteAuthMiddleware({required this.priority});

  @override
  RouteSettings? redirect(String? route) {
    debugPrint('=======AuthMiddleware.redirect:$route');
    if (!UserInfo.instance.isLogin) {
      return RouteSettings(name: AppRoutes.Login);
    }

    return super.redirect(route);
  }

  @override
  GetPage? onPageCalled(GetPage? page) {
    debugPrint('=======AuthMiddleware.onPageCalled:$page');
    return super.onPageCalled(page);
  }
}
