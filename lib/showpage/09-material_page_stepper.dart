import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MaterialPageStepper extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MaterialPage1();
  }
}

class _MaterialPage1 extends State<MaterialPageStepper> {
  int _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("步骤组件"),
      ),
      body: Container(
        padding: EdgeInsets.all(0.0),
        child: Stepper(
            currentStep: _currentStep,
            onStepTapped: (int value) {
              // 点击步骤的序号触发的方法
              setState(() {
                _currentStep = value;
              });
            },

            /// 继续
            onStepContinue: () {
              // 点击继续触发的方法
              setState(() {
                _currentStep < 2 ? _currentStep += 1 : _currentStep = 0;
              });
            },

            /// 取消
            onStepCancel: () {
              // 点击取消触发的方法
              setState(() {
                _currentStep > 0 ? _currentStep -= 1 : _currentStep = 0;
              });
            },
            steps: [
              Step(
                  title: Text('提交中'),
                  subtitle: Text('提交中'),
                  content: Text('您的订单正在提交'),
                  isActive: _currentStep == 0),
              Step(
                  title: Text('待付款'),
                  subtitle: Text('待付款'),
                  content: Text('您的订单尚未支付'),
                  isActive: _currentStep == 1),
              Step(
                  title: Text('待收货'),
                  subtitle: Text('待收获'),
                  content: Text('您的包裹正在运输中'),
                  isActive: _currentStep == 2),
            ]),
      ),
    );
  }
}
