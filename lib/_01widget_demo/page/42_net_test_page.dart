import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class P42NetTestPage extends StatefulWidget {
  @override
  _P42NetTestPageState createState() => _P42NetTestPageState();
}

class _P42NetTestPageState extends State<P42NetTestPage> {
  Future<String> _net() {
    var options = BaseOptions(
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
      baseUrl: 'http://localhost:8080',
    );

    Map<String, dynamic> params = {
      'name': 'jim',
    };

    Dio dio = Dio(options); // 使用默认配置

// return  await dio.post('/test6', data: params).then((value) {
//      print('成功 = ${value}');
//      return '成功';
//    }).catchError((onError){
//      print('失败 = $onError');
//      return '失败12';
//    });
//     Duration duration = Duration(seconds: 2); // creates a new duration of 5 seconds
//     return Future.delayed(duration, () {
    // throw Exception('Expected at least 1 section');
    // throw FormatException('Expected at least 1 section');
    // return '成功';
    return Future.value('成功');
    // }).catchError((onError) {
    //   return '失败12';
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('自定义服务器请求'),
      ),
      body: Column(
        children: [
          TextButton(
            child: Text('get'),
            onPressed: () async {
              var success = await _net().catchError((onError) {
                print('onError2 = $onError');
              });
              print(success);
            },
          ),
        ],
      ),
    );
  }
}
