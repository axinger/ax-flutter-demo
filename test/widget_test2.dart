import 'package:flutter/cupertino.dart';

class A {

  String zeroFill(int i) {
    return i >= 10 ? "$i" : "0$i";
  }

  void a() {
    print('${zeroFill(10)}');
  }
}

class A1 {
  void a() {
    print("a1");
  }
}

class B with A, A1 {}

class B1 with A1, A {}

class B2 with A, A1 {
  void a() {
    print("b2");
  }
}

class C {
  void a() {
    print("a1");
  }
}

class B3 extends C with A, A1 {}

class B4 extends C with A1, A {}

class B5 extends C with A, A1 {
  void a() {
    print("b5");
  }
}

mixin X on A{
  void x(){
    print("x");
  }
}

class mixinsX extends A with X{

}

abstract class APerson {
  log(){
    debugPrint('APerson log===========');
  }

  log2(){
    debugPrint('APerson log2===========');
  }
  log3();
}

class Person implements APerson {
@override
  log() {
    // super.log();
    debugPrint('log===========');
  }

  @override
  log2() {
    // TODO: implement log2
    debugPrint('log2===========');
  }

  @override
  log3() {
    // TODO: implement log3
    debugPrint('log3===========');
  }
}

abstract class Animal {
  eat(); //抽象方法
  run(); //抽象方法
  printInfo() {
    print('我是抽象类中的一个普通方法');
  }
}

// 在子类里面必须实现抽象类里面的抽象方法
class Dog extends Animal {
  @override
  eat() {
    print('Dog is eatting something');
  }

  @override
  run() {
    print('Dog is running');
  }
}
// 在子类里面必须实现抽象类里面的抽象方法
class Cat extends Animal {
  @override
  eat() {
    // TODO: implement eat
    throw UnimplementedError();
  }

  @override
  run() {
    // TODO: implement run
    throw UnimplementedError();
  }
@override
  printInfo() {
    // TODO: implement printInfo
     super.printInfo();
    print('子类printInfo');
  }

}

class Logger {
  final String name;
  // 缓存已创建的对象
  static final Map<String, Logger> _cache = <String, Logger>{};

  factory Logger(String name) {
    print('factory = $name');
    // return Logger._internal(name);

    // 
    return _cache.putIfAbsent(
        name, () => Logger._internal(name));

  }

  // 私有的构造函数
  Logger._internal(this.name){
    print("生成新实例：$name");
  }


}


void main() {
  A a = A();
  a.a();

  // B b = new B();
  // B1 b1 = new B1();
  // B2 b2 = new B2();
  // B3 b3 = new B3();
  // B4 b4 = new B4();
  // B5 b5 = new B5();
  //
  // b.a();
  // b1.a();
  // b2.a();
  // b3.a();
  // b4.a();
  // b5.a();

  // APerson aPerson = Person();
  //
  // aPerson.log();
  //
  // aPerson.log2();
  // aPerson.log3();

  // Cat c = new Cat();
  // c.eat();
  // c.printInfo();

  // var p1 = new Logger("1");
  // var p2 = new Logger('22');
  // var p3 = new Logger('1');// 相同对象直接访问缓存
  //
  // //identical会对两个对象的地址进行比较，相同返回true，
  // //等同于 == ，好处是如果重写了==，那用identical 会更方便。
  // print(identical(p1,p3));
}
