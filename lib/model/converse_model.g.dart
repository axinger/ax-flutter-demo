// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'converse_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConverseModel _$ConverseModelFromJson(Map<String, dynamic> json) => ConverseModel(
      json['headIcon'] as String,
      json['title'] as String?,
      json['msg'] as String?,
      json['time'] as String?,
      json['unreadCount'] as int?,
      json['isDisturb'] as bool?,
    );

Map<String, dynamic> _$ConverseModelToJson(ConverseModel instance) => <String, dynamic>{
      'headIcon': instance.headIcon,
      'title': instance.title,
      'msg': instance.msg,
      'time': instance.time,
      'unreadCount': instance.unreadCount,
      'isDisturb': instance.isDisturb,
    };
