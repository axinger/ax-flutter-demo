abstract class Order {
  Order() {
    print('Order 构造函数');
  }

  void order() {
    print('abstract eat');
  }
}

mixin OrderA on Order {
  orderA() {
    print('Sing sing');
  }

  @override
  void order() {
    super.order();
    print('OrderA order');
  }
}

mixin OrderB on Order {
  // class 没有构造函数的也可以混入
  // with 混入的对象,不能有构造函数,使用用 mixin 可以进行检测
  // Dance(){
  //
  // }
  orderB(String name) {
    print('Dance dance = $name');
  }

  @override
  void order() {
    /// 这个关键,假如没有,多个with 不会执行 前面的
    super.order();
    print('OrderB order');

  }
}

mixin Code {
  code() {
    print('Code code');
  }
}

class Student extends Order with OrderA, OrderB {}

void main() {
  var student = Student();
  student.order();
  // student.eat2();
}
