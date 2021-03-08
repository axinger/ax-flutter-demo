

class Person {
  final String? name;

  Person({this.name}) {
    print('Person 构造函数');
  }


  void eat() {
    print('Person eat = $name');
  }
}

mixin Dance {
  // class 没有构造函数的也可以混入
  // with 混入的对象,不能有构造函数,使用用 mixin 可以进行检测
  // Dance(){
  //
  // }
  dance(String name) {
    print('Dance dance = $name');
  }
}

mixin Sing {
  sing() {
    print('Sing sing');
  }
}

mixin Code {
  code() {
    print('Code code');
  }
}

class Student extends Person with Dance, Sing {
  final String? name2;

  // 需要重写构造函数,赋值给父类
  // 子类不会自动调用父类构造函数
  Student({this.name2}) : super(name: name2) {}

  @override
  void eat() {
    super.eat();
    print('子类调用父类值 = override');

  }
  void eat2() {
    super.eat();
    print('子类调用父类值 = ${super.name}');
  }
}

class Teacher extends Person with Sing, Code {}

void main() {
  // Student student = Student(name2: 'food');
  Student? student;
  student?.dance('jim');

  // student.eat();
  // student.eat2();
}
