import 'dart:convert' show json;

import 'package:flutter/foundation.dart';

void tryCatch(Function f) {
  try {
    f?.call();
  } catch (e, stack) {
    debugPrint('$e');
    debugPrint('$stack');
  }
}

T? asT<T>(dynamic value) {
  if (value is T) {
    return value;
  }
  if (value != null) {
    final String valueS = value.toString();
    if (0 is T) {
      return int.tryParse(valueS) as T;
    } else if (0.0 is T) {
      return double.tryParse(valueS) as T;
    } else if ('' is T) {
      return valueS as T;
    } else if (false is T) {
      if (valueS == '0' || valueS == '1') {
        return (valueS == '1') as T;
      }
      return bool.fromEnvironment(value.toString()) as T;
    }
  }
  // return Object<T>();
  return null;
}

class UserInfo {
  /// 调用方法
//  static UserInfo sharedInstance = _instance;

  static UserInfo get sharedInstance => _instance;

//  @override
//  void initInstances() {
//    super.initInstances();
////    _instance = this;
//
//   ());

  ///当你需要构造函数不是每次都创建一个新的对象时，使用factory关键字。
  factory UserInfo({String userName = '', String passWord = '', String token = ''}) {
    if (_instance == null) {
      _instance = UserInfo._(
        userName: userName,
        passWord: passWord,
        token: token,
      );
    }
    return _instance;
  }

  /// 私有方法,json解析,也不要用
  UserInfo._({this.userName = '', this.passWord = '', this.token = ''});

  static UserInfo _instance = UserInfo._();

  String userName = '';
  String passWord = '';
  String token = '';

  factory UserInfo.fromJson(Map<String, dynamic> jsonRes) {
    return UserInfo(
      passWord: asT<String>(jsonRes['passWord']) ?? '',
      token: asT<String>(jsonRes['token']) ?? '',
    );
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'userName': userName,
        'passWord': passWord,
        'token': token,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}
