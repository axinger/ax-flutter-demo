//
//  46_material_motion
//
//  ax_flutter_demo
//
//  Created by axinger on 2020/8/27 8:59 下午 .
//  Copyright ©2020/8/27 ax_flutter_demo. All rights reserved.
//

import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

class P46MaterialMotion extends StatefulWidget {
  @override
  _P46MaterialMotionState createState() => _P46MaterialMotionState();
}

class _P46MaterialMotionState extends State<P46MaterialMotion> {
  var _duration = const Duration(seconds: 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          ElevatedButton(
            onPressed: () {
              showModal<void>(
                context: context,
                builder: (BuildContext context) {
                  return _DetailPage();
                },
              );
            },
            // color: Theme.of(context).colorScheme.primary,
            // textColor: Theme.of(context).colorScheme.onPrimary,
            child: const Text('弹出对话框'),
          ),
        ],
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(8),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 2, mainAxisSpacing: 4),
        itemBuilder: (context, index) {
          return GridTile(
            header: GridTileBar(
              title: Text('header'),
              subtitle: Text('专注分享Flutter'),
              backgroundColor: Colors.transparent,
              leading: Icon(Icons.rotate_right),
              trailing: Icon(Icons.details),
            ),
            child: OpenContainer(
              transitionDuration: _duration,
//              tappable:false,
              closedBuilder: (BuildContext _, VoidCallback openContainer) {
                return Container(
                  child: Image.asset(
                    'assets/image/IMG_3601.JPG',
                    fit: BoxFit.fitWidth,
                  ),
                );
              },
              openBuilder: (BuildContext context, VoidCallback _) {
                return _DetailPage();
              },
            ),
            footer: GridTileBar(
              title: Text('Footer'),
            ),
          );
        },
        itemCount: 50,
      ),
    );
  }
}

class _DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Image.asset(
          'assets/image/IMG_3601.JPG',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
