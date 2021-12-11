import 'package:json_annotation/json_annotation.dart';

part 'converse_model.g.dart';

@JsonSerializable()
class ConverseModel extends Object {
  @JsonKey(name: 'headIcon')
  String headIcon;

  @JsonKey(name: 'title')
  String? title;

  @JsonKey(name: 'msg')
  String? msg;

  @JsonKey(name: 'time')
  String? time;

  @JsonKey(name: 'unreadCount')
  int? unreadCount;

  @JsonKey(name: 'isDisturb')
  bool? isDisturb;

  ConverseModel(
    this.headIcon,
    this.title,
    this.msg,
    this.time,
    this.unreadCount,
    this.isDisturb,
  );

  factory ConverseModel.fromJson(Map<String, dynamic> srcJson) => _$ConverseModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ConverseModelToJson(this);
}

main() {
  test() {
    var map = {
      'headIcon': 'headIcon',
    };

    var model = ConverseModel.fromJson(map);
    print('model = ${model.toJson()}');

    print('model = ${model.unreadCount ?? 0 > 0}');

    if ((model.unreadCount ?? 0) > 0) {}
  }

  test();
}
