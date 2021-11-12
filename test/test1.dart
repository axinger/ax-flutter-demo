void main()  {
  void test1() {
    Map<String, dynamic> map = Map();
    // Map<String,dynamic>map = Map();
    String? name = map['name'];
    String? name2 = name?.substring(0, 2);
    print('null safe name = ${name}');
    print('null safe name2 = ${name2}');
// name2 = null;
  }


  // test1();


  void test2() {
    Map<String, String> map = Map();
    // map['name'] = 'jim';
    String? name = map['name'];
    // String? name2 = name?.substring(0, 2);
    print('null safe name = ${name??'uuu'}');
    // print('null safe name2 = ${name2}');
  }

  test2();
}
