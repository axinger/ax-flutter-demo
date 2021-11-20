import 'package:flutter/services.dart';

class TestTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    String nValue = newValue.text;
    String oValue = oldValue.text;
    //当前所选择的文字区域
    TextSelection nSelection = newValue.selection;

    final int start = newValue.selection.start;
    final int end = newValue.selection.end;

    final int old_start = oldValue.selection.start;
    final int old_end = oldValue.selection.end;

    print('nValue = $nValue '
        'oValue = $oValue '
        'start = $start '
        'end = $end '
        'old_start = $old_start '
        'old_end = $old_end ');

//    List list = [];
//    String phone = '';
//    for (var i = 0; i < nValue.length; i++) {
//      list.add(nValue[i]);
//    }
//    if (list.length > 3) {
//      if (list[3] != ' ') {
//        list.insert(3, ' ');
//        nSelection = TextSelection.fromPosition(TextPosition(
//            affinity: TextAffinity.downstream, offset: nValue.length + 1));
//      }
//    }
//    if (list.length > 8) {
//      if (list[8] != ' ') {
//        list.insert(8, ' ');
//        nSelection = TextSelection.fromPosition(TextPosition(
//            affinity: TextAffinity.downstream, offset: nValue.length + 1));
//      }
//    }
//    list.forEach((item) {
//      phone += item;
//    });
//    //处理删除事件
//    if (nValue.length < oValue.length) {
//      if (nValue.endsWith(" ")) {
//        phone = nValue.substring(0, nValue.length - 1);
//        nSelection = TextSelection.fromPosition(TextPosition(
//            affinity: TextAffinity.downstream, offset: phone.length));
//      }
//    }
    return TextEditingValue(text: nValue, selection: nSelection, composing: TextRange.empty);
  }
}
