import 'dart:convert';

void main() {
  var man1 = new man(1, 2);
  var man2 = new man(3, 4);
  var res1 = (man1 - man2).toString();
  var jsonObj = json.decode(res1);

  print('res1 = $res1');
  print('json.decode = ${jsonObj.runtimeType}');

  print('+ = ${(man1 + man2).toString()}');
}

class man {
  int a;
  int b;

  man(this.a, this.b);

  ///operator 重载运算符号,就是把 运算符号当成函数名
  man operator +(man v) {
    //这其中，左边的man作为返回类型，可写可不写
    return new man(a + v.a, b);
  }

  man operator -(man v) {
    //operator作为重载运算符的标志，必须写上，后面跟一个需要重载的运算符
    return new man(a - v.a, b);
  }

  @override
  String toString() {
    return '{"a":$a,"b":$b}';
  }
}
