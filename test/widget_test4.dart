import 'package:rxdart/rxdart.dart';

abstract class Person {

  Person() {
    print('Person 构造函数');
  }

  void eat() {
    print('abstract eat');
  }
}

mixin Dance on Person {
  // class 没有构造函数的也可以混入
  // with 混入的对象,不能有构造函数,使用用 mixin 可以进行检测
  // Dance(){
  //
  // }
  dance(String name) {
    print('Dance dance = $name');
  }
  @override
  void eat() {
    // TODO: implement eat
    super.eat();
    print('Dance eat');
  }
}

mixin Sing on Person{
  sing() {
    print('Sing sing');
  }
  @override
  void eat() {
    // TODO: implement eat
    super.eat();
    print('Sing eat');
  }
}

mixin Code {
  code() {
    print('Code code');
  }
}

class Student extends Person with Dance,Sing {

}

class Teacher extends Person with Sing, Code {}

void main() {
  Student student = Student();
  student.dance('jim');

  student.eat();
  // student.eat2();
}
