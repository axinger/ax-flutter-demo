class UserInfo {
  late String name;
  bool isLogin = false;

  // static _instance，_instance会在编译期被初始化，保证了只被创建一次
  static final UserInfo _instance = UserInfo._();

  //提供了一个工厂方法来获取该类的实例
  factory UserInfo() => _instance;

  /// 单例方法
  static UserInfo get instance => UserInfo();

  // 通过私有方法_internal()隐藏了构造方法，防止被误创建
  UserInfo._() {
    // 初始化
    init();
  }

  // Singleton._internal(); // 不需要初始化

  void init() {
    print("这里初始化");
    name = 'jim';
  }
}
