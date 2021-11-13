main() {
  void test_list1() {
    ///https://blog.csdn.net/huang173507029/article/details/106606424/

    print(
      '数组 firstWhere 含有orElse',
    );
    var list = [1, 2, 3];

    /// 如果未查找到所制定条件的元素，进入orElse参数
    var firstWhere = list.firstWhere((v) => v > 100, orElse: () {
      print('orElse=====');
      return -1;
    });
    print('firstWhere = $firstWhere');
  }

  test_list1();
}
