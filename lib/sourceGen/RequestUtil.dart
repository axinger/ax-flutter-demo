//import 'package:request_generator/out_generator.dart';
import 'Request.dart';

@Request()
class RequestUtil {
  static RequestUtil sInstance = new RequestUtil._internal();

  RequestUtil._internal();

  factory RequestUtil() {
    return sInstance;
  }

  @ApiMethod("https://swapi.co/api/starships", HttpRequestType.GET, head: {"token": "123"})
  Future ships() async {
//    return _$get_ships();
    return await Future.value("2");
  }

  @ApiMethod("https://swapi.co/api/starships", HttpRequestType.POST, head: {"token": "123"})
  Future upships() {
//    return _$post_upships();
    return Future.value("3");
  }
}
