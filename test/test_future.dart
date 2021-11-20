main() {
  test() {
    var _string = '';

    print('开始：$_string');
    Future future = Future(() {
      for (int i = 0; i < 1000000000; i++) {
        _string = '$i';
      }
    });
    future.then((value) {
      print('then方法: $_string, value: $value');
    });
    print('结束：$_string');
  }

  test();
}
