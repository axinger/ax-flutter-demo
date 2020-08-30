class Utils {
  /// 必应的图片
  static List<String> netIms({
    int count = 10,
    int width = 200,
    int height = 200,
    String key = 'rand',
  }) {
    return List.generate(count, (index) {
      return 'https://bing.ioliu.cn/v1/rand?key=$key${index + 1}&w=$width&h=$height';
    });
  }
}
