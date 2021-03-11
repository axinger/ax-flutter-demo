/// 单例
class Manager {
  String name = '';

  /// 工厂方法,一般不需要些,就强制调用 Manager.instance 表名是一个单例,代码规范
  factory Manager() => _getInstance;

  /// 单例方法
  static Manager get instance => _getInstance;

  static Manager _instance = Manager._init();

  Manager._init();

  static Manager get _getInstance {
    if (_instance == null) {
      _instance = Manager._init();
    }
    return _instance;
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

void main() {
//  Person();

//  // 无论如何初始化，取到的都是同一个对象
//  Manager manager = Manager.instance;
//  Manager manager2 = Manager.instance;
//
//  print(identical(manager, manager2)); // true
//  print(manager == manager2); // true
  print(Manager());

  print("Manager 单例 = ${Manager() == Manager.instance}"); // true

//  debugPrint("debugPrint=========");

  print(Manager().hashCode);
  print(identityHashCode(Manager()));

  print("person 单例 = ${Person.instance == Person.instance}"); // true

//  manager.name = "jim";
//
//  Manager.instance.name = "2";
//  Manager().name = "jim";
//
//  print("Manager.instance.name = ${Manager.instance.name}");
//
//  Person.instance.name = "jim";
//  print(" Person.instance.name = ${Person.instance.name}");
//  Person.clear();
//  print(" Person.instance.name = ${Person.instance.name}");
//
//  Person.instance.name = "jim";
//  print(" Person.instance.name = ${Person.instance.name}");

//
//  manager.todo().then((result) {
//    print("接口返回的数据是:${result}");
//  }).whenComplete(() {});
}
