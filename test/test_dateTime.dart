import 'package:ax_flutter_util/ax_flutter_util.dart';
import 'package:intl/intl.dart';


main() {

  void test_dateTime(){


    var format = DateFormat.E('zh');

    print('time = ${format.format(DateTime.now())}');
    print(
        'DateTime.now().format() = ${DateTime.now().format(locale: 'zh')}');

    var f = NumberFormat('###.00#', 'en_US');
    print(f.format(1234567.345678));

    print(NumberFormat('###.00#', 'zh_CN').format(1234567.345678));

    var aDateTime = DateTime.now();
    DateFormat.yMMMMEEEEd().format(aDateTime);

    print(DateFormat('yyyy-MM-ddEEEEE', 'en_US').format(aDateTime));
    print(DateFormat('yyyy-MM-ddEEEEE', 'zh_CN').format(aDateTime));
  }
  test_dateTime();
}