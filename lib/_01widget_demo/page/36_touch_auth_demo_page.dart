import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/error_codes.dart' as authcode;
import 'package:local_auth/local_auth.dart';

class P36TouchAuthDemoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TouchAuthDemoState();
  }
}

class _TouchAuthDemoState extends State<P36TouchAuthDemoPage> {
  final LocalAuthentication auth = LocalAuthentication();
  bool _canCheckBiometrics = false;
  List<BiometricType> _availableBiometrics = [];
  String _authorized = '无权限';
  bool _isAuthenticating = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Touch auth"),
        centerTitle: true,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text('是否可以使用指纹？: $_canCheckBiometrics\n'),
              ElevatedButton(
                child: const Text('检查权限'),
                onPressed: _checkBiometrics,
              ),
              Text('可用的识别类型？: $_availableBiometrics\n'),
              ElevatedButton(
                child: const Text('获取生物识别类型'),
                onPressed: _getAvailableBiometrics,
              ),
              Text('认证结果: $_authorized\n'),
              ElevatedButton(
                child: Text('授权'),
                onPressed: _authenticate,
              ),
            ]),
      ),
    );
  }

  Future<void> _checkBiometrics() async {
    bool canCheckBiometrics = false;
    try {
      canCheckBiometrics = await auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      print(e);
    }

    /// 检查是否正确绑定看view
    /// 由此，State 有一个属性是 mounted 表明 State 当前是否正确绑定在View树中。
    /// 当创建 State 对象，并在调用 State.initState 之前，framework 会根据 BuildContext 来标记 mounted，
    /// 然后在 State的生命周期里面，这个 mounted 属性不会改变，
    /// 直至 framework 调用 State.dispose，当改变之后， State 对象再也不会调用 build 方法，
    /// 而且当 mounted = false 时，调用 State.setState 会报错。
    if (!mounted) return;

    setState(() {
      _canCheckBiometrics = canCheckBiometrics;
    });
  }

  Future<void> _getAvailableBiometrics() async {
    List<BiometricType> availableBiometrics = [];
    try {
      availableBiometrics = await auth.getAvailableBiometrics();
    } on PlatformException catch (e) {
      print('PlatformException = $e');
    }

    if (!mounted) return;

    setState(() {
      print('含有的availableBiometrics = $availableBiometrics');
      _availableBiometrics = availableBiometrics;
    });
  }

  _authenticate() async {
//    bool authenticated = false;

//    setState(() {
//      _isAuthenticating = true;
//      _authorized = 'Authenticating';
//    });

    try {
      _isAuthenticating = await auth.authenticate(
        localizedReason: '需要您的识别认证',
        // useErrorDialogs: false,
        // stickyAuth: true,
        // androidAuthStrings:
        //     AndroidAuthMessages(cancelButton: "取消", signInTitle: "安全验证", biometricHint: "安全识别", biometricNotRecognized: "未识别，请重试", biometricSuccess: "识别成功"),
        // iOSAuthStrings: IOSAuthMessages(lockOut: "识别失败，请重试", cancelButton: "取消"),
      );

      final String message = _isAuthenticating ? '有权限' : '无权限';
      setState(() {
        _authorized = message;
      });
    } on PlatformException catch (e) {
      print('识别错误code = ${e.code}');
      print('识别错误message = ${e.message}');
      print('识别错误details = ${e.details}');

      if (e.code == authcode.notAvailable) {
        // Touch ID或者指纹不可用
        print('Touch ID或者指纹不可用');
      } else if (e.code == authcode.notEnrolled) {
        //无可用的指纹
        print('无可用的指纹');
      } else if (e.code == authcode.passcodeNotSet) {
        //无可用的指纹
        print('无可用的指纹');
      } else if (e.code == authcode.otherOperatingSystem) {
        //非android或者ios系统
        print('非android或者ios系统');
      } else if (e.code == authcode.lockedOut) {
        //失败，并尝试多次
        print('失败，并尝试多次');
      } else if (e.code == authcode.permanentlyLockedOut) {
        //失败，并已经尝试多次，建议使用其他方式登录
        print('失败，并已经尝试多次，建议使用其他方式登录');
      } else {
        print('识别,其他错误');
      }
    }
  }

  void _cancelAuthentication() {
    auth.stopAuthentication();
  }
}
