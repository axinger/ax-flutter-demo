import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class _Controller extends GetxController {
  var isPlay = false.obs;
}

class P62LottiePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _P62LottiePage();
}

class _P62LottiePage extends State<P62LottiePage> with SingleTickerProviderStateMixin {
  _Controller get controller => Get.put<_Controller>(_Controller());

  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    _controller.addListener(() {
      if (_controller.status == AnimationStatus.completed) {
        print('动画完成');

        // _controller.reset();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lottie动画'),
      ),
      body: ListView(
        children: [
          Row(
            children: <Widget>[
              TextButton(
                child: Text('反向'),
                onPressed: () {
                  _controller.reverse();
                },
              ),
              TextButton(
                child: Text('stop'),
                onPressed: () {
                  _controller.stop();
                },
              ),
              TextButton(
                child: Text('forward'),
                onPressed: () {
                  _controller.forward();
                },
              ),
              TextButton(
                child: Text('reset'),
                onPressed: () {
                  _controller.reset();
                },
              ),
              TextButton(
                child: Text('reactive'),
                onPressed: () {
                  _controller.reactive();
                },
              ),
            ],
          ),

          // Obx(() {
          //   /// reverse 反向
          //   print('controller.isPlay.value=${controller.isPlay.value}');
          //
          //   return
          Lottie.asset('assets/lottie/AndroidWave.json',
              repeat: false,
              // animate: controller.isPlay.value,
              controller: _controller, onLoaded: (composition) {
            _controller.duration = composition.duration;

            // _controller
            //   ..duration = composition.duration
            //   ..forward();
          }),
          // }),

          // Load an animation and its images from a zip file
          // Lottie.asset('assets/lottiefiles/angel.zip'),
        ],
      ),
    );
  }
}
