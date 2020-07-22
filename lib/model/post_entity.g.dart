// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostEntity _$PostEntityFromJson(Map<String, dynamic> json) {
  return PostEntity(
    json['title'] as String,
    json['author'] as String,
    json['imageUrl'] as String,
  );
}

Map<String, dynamic> _$PostEntityToJson(PostEntity instance) =>
    <String, dynamic>{
      'title': instance.title,
      'author': instance.author,
      'imageUrl': instance.imageUrl,
    };
