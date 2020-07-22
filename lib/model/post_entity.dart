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
    List<Map<String, dynamic>> list = [
      {
        "title": "内容1",
        "imageUrl":
            "https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=2059216813,3169419971&fm=26&gp=0.jpg",
        "author": "jim",
      },
      {
        "title": "图片地址错误",
        "imageUrl": "https://123.png",
        "author": "jim",
      },
      {
        "title": "内容2",
        "imageUrl":
            "https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=2641512116,3445406201&fm=26&gp=0.jpg",
        "author": "tom",
      },
      {
        "title": "内容3",
        "imageUrl":
            "https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=186682105,1195550347&fm=26&gp=0.jpg",
        "author": "tom",
      },
      {
        "title": "内容4",
        "imageUrl":
            "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=1671223440,1615374730&fm=26&gp=0.jpg",
        "author": "tom",
      },
      {
        "title": "内容5",
        "imageUrl":
            "https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=1731597746,428499852&fm=26&gp=0.jpg",
        "author": "tom",
      },
      {
        "title": "内容6",
        "imageUrl":
            "https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=396448549,3340705754&fm=26&gp=0.jpg",
        "author": "tom",
      },
      {
        "title": "内容7",
        "imageUrl":
            "https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=1208538952,1443328523&fm=26&gp=0.jpg",
        "author": "tom",
      },
      {
        "title": "内容8",
        "imageUrl":
            "https://dss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=1091579268,2185400060&fm=26&gp=0.jpg",
        "author": "tom",
      },
      {
        "title": "内容9",
        "imageUrl":
            "https://dss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=4214941395,707510718&fm=26&gp=0.jpg",
        "author": "tom",
      },
    ];

    return getPostEntityList(list);
  }

  static List<PostEntity> PostEntityDataList() {
    List<Map<String, dynamic>> list = [
      {
        "title": "内容1",
        "imageUrl":
            "https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=2059216813,3169419971&fm=26&gp=0.jpg",
        "author": "jim",
      },
      {
        "title": "图片地址错误",
        "imageUrl": "https://123.png",
        "author": "jim",
      },
      {
        "title": "内容2",
        "imageUrl":
            "https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=2641512116,3445406201&fm=26&gp=0.jpg",
        "author": "tom",
      },
      {
        "title": "内容3",
        "imageUrl":
            "https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=186682105,1195550347&fm=26&gp=0.jpg",
        "author": "tom",
      },
      {
        "title": "内容4",
        "imageUrl":
            "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=1671223440,1615374730&fm=26&gp=0.jpg",
        "author": "tom",
      },
      {
        "title": "内容5",
        "imageUrl":
            "https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=1731597746,428499852&fm=26&gp=0.jpg",
        "author": "tom",
      },
      {
        "title": "内容6",
        "imageUrl":
            "https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=396448549,3340705754&fm=26&gp=0.jpg",
        "author": "tom",
      },
      {
        "title": "内容7",
        "imageUrl":
            "https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=1208538952,1443328523&fm=26&gp=0.jpg",
        "author": "tom",
      },
      {
        "title": "内容8",
        "imageUrl":
            "https://dss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=1091579268,2185400060&fm=26&gp=0.jpg",
        "author": "tom",
      },
      {
        "title": "内容9",
        "imageUrl":
            "https://dss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=4214941395,707510718&fm=26&gp=0.jpg",
        "author": "tom",
      },
    ];

    return getPostEntityList(list);
  }
}
