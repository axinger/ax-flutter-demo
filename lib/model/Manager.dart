class Singleton {
  bool showFlag = false;

  // static _instance，_instance会在编译期被初始化，保证了只被创建一次
  static final Singleton _instance = Singleton._internal();

  //提供了一个工厂方法来获取该类的实例
  factory Singleton() => _instance;

  /// 单例方法
  static Singleton get instance => Singleton();

  // 通过私有方法_internal()隐藏了构造方法，防止被误创建
  Singleton._internal() {
    // 初始化
    init();
  }

  // Singleton._internal(); // 不需要初始化

  void init() {
    print("这里初始化");
  }
}

/// 工厂方法,一般不需要些,就强制调用 .instance 表明是一个单例,代码规范
class Person {
  String name = '';

  static Person _instance = Person._init();

  Person._init();

  static Person get instance {
    if (_instance == null) {
      _instance = Person._init();
    }
    return _instance;
  }

  Person.clear() {
    _instance.name = "";
  }
}
