import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) => Center(
//        child: CircularProgressIndicator(),
//      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('进度'),
      ),
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
