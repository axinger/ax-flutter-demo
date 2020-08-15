// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

//class Person {
//
//  void _aa({@required  int age}){}
//
//
//  int _age = 1;
//
//  get age {
//    return _age + 1;
//  }
//
//  set age(age) {
//    _age = age;
//  }
//
//  void log() {
//    print("Person=======");
//  }
//
//  String get claimTypeStr {
//    String claimType;
//    if (claimType == null) {
//      claimType = '';
//    }
//    switch (claimType) {
//      case '0':
//        return '有责涉及死亡赔案';
//      case '1':
//        return '有责不涉及死亡赔案';
//      case '2':
//        return '无责赔案';
//      case '3':
//        return '垫付赔案';
//      case '4':
//        return '垫付救助基金';
//      default:
//        return '其它';
//    }
//  }
//
//
//}
//
//class Good {
//  void log() {
//    print("Good==");
//  }
//}
//
//abstract class Bad {
//  void log() {
//    print("Bad==");
//  }
//}
//
//abstract class Hard {
//  void log();
//
//  void log2() {
//    print('log2');
//  }
//}
//
//class StudentHard implements Hard {
//  @override
//  void log() {
//    // TODO: implement log
//  }
//
//  @override
//  void log2() {
//    // TODO: implement log2
//  }
//}
//
//class Student extends Person with Good implements Bad {
//  void log() {
//    print("Student==");
//  }
//}
//
//Iterable<int> foo2() sync* {
//  print('foo2 start');
//  for (int i = 0; i < 3; i++) {
//    print('运行了foo2，当前index：${i}');
//    yield i;
//  }
//  print('foo2 stop');
//}
//

abstract class Person {
  factory Person() => createDio();

  void test();
}

Person createDio() => throw UnsupportedError('');

class Student implements Person {
  @override
  void test() {
    print('Student = test');
  }
}

class Student2 implements Person {
  @override
  void test() {
    print('Student2 = test');
  }




}

void main() {
//  var person = Person();
//  person.test();

//  void _callBack(
//    String value,
//
//    /// 直接方法名 ,  String Function(String name) nameCallBack 一样
//    String nameCallBack(String name),
//  ) {
//    print('value = $value');
//    var call = nameCallBack('jim');
//    print('nameCallBack = $call');
//  }
//
//  _callBack('jim', (name) {
//    print(name);
//    return '$name==2';
//  });



//  void test2(Object? object) {
//
//    if(object == null){
//
//    }
//
//
//  }





//  String newValue = '18905155609';
//
// print(newValue.replaceRange(3, 3, ' ').replaceRange(8, 8, ' '));

//  print(newValue.replaceRange(8, 8, ' '));

//  DateTime birthday = DateTime.parse('2020-07-24');
//  DateTime  now = DateTime.parse('2020-06-29');
//
//int  difference = birthday.difference(now).inDays;
//  print(difference);
//
//  print(difference.abs());

//  print('四舍五入');
//  print(0.4.round());
//  print(0.5.round());
//  print('向下取整');
//  print(0.4.floor());
//  print(1.1.floor());
//  print('向上取整');
//  print(0.4.ceil());
//  print(1.1.ceil());
//  print('sign 返回-1，0或1，具体取决于数字的符号和数值');
//  print(1.1.sign);
//  print(0.sign);
//  print(-1.0.sign);
//  print('truncate 去除小数');
//  print(1.01.truncate());

//  Student();
//  student.log(); Student student =

//  String name = '';
// print("===========");
// String name ='jim';
//
//  String age ='12';

//  print((name != null) && (name?.isEmpty));
//  print((name?.isEmpty) != null ? "A" : "B");

  // var b = foo2().iterator;
  // print('还没开始调用 moveNext');
  // b.moveNext();
  // print('第${b.current}次moveNext');
  // b.moveNext();
  // print('第${b.current}次moveNext');
  // b.moveNext();
  // print('第${b.current}次moveNext');

//  Future.delayed(Duration(seconds: 2)).then((value){
//    print('then $value');
//  }).whenComplete(() {
//    print('whenComplete');
//  });
//
//  UserInfo userInfo1 =  UserInfo.fromJson({'userName':'jim','passWord':'123456'});
//  print('userInfo1 = ${userInfo1.userName}');
//
////  print('userInfo2 = ${UserInfo.sharedInstance.userName}');
//  print('userInfo3 = ${UserInfo().userName}');
//  print('修改值后========================');
//  UserInfo().userName = 'tom';
//
//  print('userInfo1 = ${userInfo1.userName}');
//
////  UserInfo userInfo2 =  UserInfo.fromJson({'userName':'tom','passWord':'123456'});
//  UserInfo userInfo2 =  UserInfo();
//  print('userInfo1 = ${userInfo1.userName}');
//  print('userInfo2 = ${userInfo2.userName}');
//  print('UserInfo() = ${UserInfo.sharedInstance.userName}');
//
//  print(identical(userInfo1, userInfo2)); //true
//  print(identical(UserInfo(), UserInfo.sharedInstance)); //true
//  print(identical(userInfo2, UserInfo.sharedInstance)); //true
//  var s1 = new UserInfo();
//  var s2 = new UserInfo();
//  print(identical(s1, s2));  // true
//  print(s1 == s2);

//  print(identical(manager3, manager4)); //true

//  Person person = Person();
//  print(person.claimTypeStr);
//  person.age = 1;
//  print(person.age);

//  testWidgets('Add and remove a todo', (WidgetTester tester) async {
//    // Build the widget
//    await tester.pumpWidget(P35TestTodoList());
//    // 往输入框中输入 hi
//    await tester.enterText(find.byType(TextField), 'hi');
//    // 点击 button 来触发事件
//    await tester.tap(find.byType(FloatingActionButton));
//    // 让 widget 重绘
//    await tester.pump();
//    // 检测 text 是否添加到 List 中
//    expect(find.text('hi'), findsOneWidget);
//
//    // 测试滑动
//    await tester.drag(find.byType(Dismissible), Offset(500.0, 0.0));
//
//    // 页面会一直刷新，直到最后一帧绘制完成
//    await tester.pumpAndSettle();
//
//    // 验证页面中是否还有 hi 这个 item
//    expect(find.text('hi'), findsNothing);
//
//  });
}
