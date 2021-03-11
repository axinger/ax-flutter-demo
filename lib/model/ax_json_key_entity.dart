import 'package:ax_flutter_demo/model/ax_json_key.dart';

class AxJsonKeyEntity {
  @AxJsonKey(name: "nick_name")
  String name = '';
}

void main() {
  print('Hello, World!');
  AxJsonKeyEntity entity = AxJsonKeyEntity();
}
