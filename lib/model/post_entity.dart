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

  bool selected = false;

  PostEntity(
    this.title,
    this.author,
    this.imageUrl,
  );

  factory PostEntity.fromJson(Map<String, dynamic> srcJson) =>
      _$PostEntityFromJson(srcJson);

  Map<String, dynamic> toJson() => _$PostEntityToJson(this);

  @override
  String toString() {
    return 'PostEntity{title: $title, author: $author, imageUrl: $imageUrl}';
  }

  static List<PostEntity> dataList() {
    List<Map<String, dynamic>> list = List.generate(20, (index) {
      return {
        'title': '内容-$index',
        'imageUrl': 'https://bing.ioliu.cn/v1/rand?key=b$index&w=640&h=360',
        'author': 'author-$index',
      };
    });
    print('list == $list');
    return getPostEntityList(list);
  }
}
