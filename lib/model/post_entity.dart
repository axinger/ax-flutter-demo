import 'package:json_annotation/json_annotation.dart';

part 'post_entity.g.dart';

List<PostEntity> getPostEntityList(List<dynamic> list) {
  List<PostEntity> result = [];
  list.forEach((item) {
    result.add(PostEntity.fromJson(item));
  });
  return result;
}

@JsonSerializable()
class PostEntity extends Object {
  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'author')
  String author;

  @JsonKey(name: 'imageUrl')
  String imageUrl;

  @JsonKey(name: 'name')
  String? name;

  bool selected = false;

  PostEntity(
    this.title,
    this.author,
    this.imageUrl,
    this.name,
  );

  factory PostEntity.fromJson(Map<String, dynamic> srcJson) => _$PostEntityFromJson(srcJson);

  Map<String, dynamic> toJson() => _$PostEntityToJson(this);

  @override
  String toString() {
    return 'PostEntity{title: $title, author: $author, imageUrl: $imageUrl}';
  }

  static List<PostEntity> get dataList {
    List<Map<String, dynamic>> list = List.generate(30, (index) {
      return {
        'title': '内容-$index',
        'imageUrl': 'https://via.placeholder.com/160x90?text=icon${index}',
        'author': 'author-$index',
        'name': '1',
      };
    });
    return getPostEntityList(list);
  }
}
