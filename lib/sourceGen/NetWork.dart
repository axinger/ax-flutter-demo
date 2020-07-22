class NetWork {
  static final NetWork _netWork = NetWork._internal(); //1
  factory NetWork() {
    //2
    return _netWork;
  }

  NetWork._internal(); //3
  static NetWork get instance => NetWork._internal();

  Future todo() {
    return Future.value("2");
  }
}
