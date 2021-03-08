abstract class Order {
  Order() {
    print('Order 构造函数');
  }

  void order() {
    print('abstract eat');
  }
}

class OrderClassA implements Order {
  orderA() {
    print('Sing sing');
  }

  @override
  void order() {
    print('OrderClassA');
  }
}
class OrderClassB implements Order {
  orderA() {
    print('Sing sing');
  }

  @override
  void order() {
    print('OrderClassB');
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
  print('compare =  ${Comparable.compare('1.8', '1.9')}');
  print('compare =  ${Comparable.compare('1.9', '1.10')}');
  print('compareTo =  ${ '1.9'.compareTo('1.10')}');
  print('=== ${1.9 < 1.10}');
  print('=== ${1.8 < 1.9}');

  test1(order: OrderClassA());
  test1(order: OrderClassB());
}
void test1({required Order order}){
  print('test1');
  order.order();
  print('runtimeType = ${order.runtimeType}');

  if(order.runtimeType == OrderClassA){
    (order as OrderClassA).orderA();
  }

  if(order is OrderClassA){
    order.orderA();
  }

}