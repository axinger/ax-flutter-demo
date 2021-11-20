import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RouteDemo extends StatefulWidget {
  const RouteDemo({Key? key}) : super(key: key);

  @override
  _RouteDemoState createState() => _RouteDemoState();
}

class _RouteDemoState extends State<RouteDemo> {
  @override
  void initState() {
    super.initState();

    var arguments = Get.arguments;
    print('arguments方式 = $arguments');

    var parameters = Get.parameters;
    ;
    print('parameters方式 = $parameters');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('路由传参方式1'),
      ),
    );
  }
}

class RouteDemo2 extends StatefulWidget {
  const RouteDemo2({Key? key}) : super(key: key);

  @override
  _RouteDemoState2 createState() => _RouteDemoState2();
}

class _RouteDemoState2 extends State<RouteDemo2> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    var parameters = Get.parameters;
    ;
    print('parameters = $parameters');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('路由传参方式1'),
      ),
    );
  }
}
