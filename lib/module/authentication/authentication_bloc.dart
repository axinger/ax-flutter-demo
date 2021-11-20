import 'dart:async';
import 'dart:convert' show json;

import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'authentication_event.dart';
import 'authentication_state.dart';
import 'user_info.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc(AuthenticationState initialState) : super(initialState);

  @override
  AuthenticationState get initialState => AuthenticationInitial();

  ///..add(AuthenticationStarted()); 就在 add中对应的事件
  /// async*
  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    /// 从本地取用户信息
    if (event is AuthenticationStartedEvent) {
      print('开始校验身份...................');

      yield AuthenticationInProgress();
      SharedPreferences preferences = await SharedPreferences.getInstance();
      String userJson = (preferences?.getString('user') ?? null)!;
      print('userJson == $userJson');

      Map<String, dynamic> map = (userJson == null || userJson.length == 0) ? null : json.decode(userJson);

      UserInfo userInfo = UserInfo.fromJson(map);
      bool isV = (userInfo?.userName?.isNotEmpty ?? false) && (userInfo?.passWord?.isNotEmpty ?? false);

      print('isV == $isV');

      if (isV) {
        yield AuthenticationSuccess();
      } else {
        yield AuthenticationFailure();
      }
    }

    /// loginview 发送请求
    if (event is AuthenticationLoggedInEvent) {
      print('开始校验身份...从登陆中来的...................');
      yield AuthenticationSuccess();
    }

    if (event is AuthenticationLoggedOutEvent) {
      print('开始校验身份===退出登录...................');

      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.remove('user');

      SharedPreferences preferences2 = await SharedPreferences.getInstance();
      String userJson = (preferences2.getString('user') ?? null)!;
      print('userJson2 == $userJson');
      yield AuthenticationFailure();
    }
  }
}
