class Singleton {

 late String name;

  // static _instance，_instance会在编译期被初始化，保证了只被创建一次
  static final Singleton _instance = Singleton._();

  //提供了一个工厂方法来获取该类的实例
  factory Singleton() => _instance;

  /// 单例方法
  static Singleton get instance => Singleton();

  // 通过私有方法_internal()隐藏了构造方法，防止被误创建
  Singleton._() {
    // 初始化
    init();
  }

  // Singleton._internal(); // 不需要初始化

  void init() {
    print("这里初始化");
    name = 'jim';
  }
}


main(){
  
  
  test(){
    Singleton singleton1 = Singleton();
    Singleton singleton2 = Singleton.instance;
    print('判断是否同一内存地址: ${identical(singleton1,singleton2)}');

    print('改变值前');
    print('singleton1.name: ${singleton1.name}');
    print('singleton2.name: ${singleton2.name}');
    singleton1.name = 'tom';
    print('改变值后');
    print('singleton1.name: ${singleton1.name}');
    print('singleton2.name: ${singleton2.name}');
  }
  
  test();
}