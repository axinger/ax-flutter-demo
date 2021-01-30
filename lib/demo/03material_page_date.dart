import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MaterialPageDate extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MaterialPage1();
  }
}

class _MaterialPage1 extends State<MaterialPageDate> {
  bool _checkbox_value = false;
  var _checkboxListTile_value = false;
  int _Radio_value = 0;

  var _RadioListTile_value = 0;

  var _Switch_value = false;

  double _Slider_value = 0.0;

  DateTime selectDateTime = DateTime.now();

  TimeOfDay selectTime = TimeOfDay.now();

  _selectDateFunc() async {
    DateTime dateTime = await showDatePicker(
      context: context,
      firstDate: DateTime(1900),
      initialDate: selectDateTime,
      lastDate: DateTime(2100),
    );

    if (dateTime == null) {
      return;
    }

//    MaterialLocalizations localizations = MaterialLocalizations.of(context);
//    String formattedTime = localizations.formatFullDate(dateTime);
//    print("formattedTime");
//    print("formattedTime = $formattedTime");

    setState(() {
      selectDateTime = dateTime;
    });
  }

  _selectTimeFunc() async {
    TimeOfDay timeOfDay = await showTimePicker(
      context: context,
      initialTime: selectTime,
    );
    if (timeOfDay == null) {
      return;
    }

    setState(() {
      debugPrint("timeOfDay = $timeOfDay");
      selectTime = timeOfDay;
    });
  }

  static String formatTimeOfDayalUse24Hour(TimeOfDay timeOfDay, context) {
    MaterialLocalizations localizations = MaterialLocalizations.of(context);
    String formattedTime =
        localizations.formatTimeOfDay(timeOfDay, alwaysUse24HourFormat: true);
    return formattedTime;
  }

  /// 模拟异步加载用户信息
  _getUserInfo() async {
    await Future.delayed(new Duration(seconds: 1));
    return "我是用户";
  }

  _getUserInfo3() async {
//    await new Future.delayed(new Duration(seconds: 1)).then((onValue) {
//      print("onValue = $onValue");
//      return "异步结果--2";
//    });

    return Future.delayed(Duration(milliseconds: 1000), () {
      return "异步结果--3";
    });
  }

  /// 异步 await 阻塞,比如等 内容输出后,才会输出2
  _loadUserInfo() async {
    print("_loadUserInfo--1:${new DateTime.now()}");
    print("内容 = ${await _getUserInfo3()}");
    print("_loadUserInfo--2:${new DateTime.now()}");
  }

  /// 异步,最后输出 异步内容
  _loadUserInfo2() {
    print("异步类型2--1:${new DateTime.now()}");
    _getUserInfo().then((onValue) {
      print(onValue);
    });
    print("异步类型2--2:${new DateTime.now()}");
  }

  @override
  Widget build(BuildContext context) {
    _loadUserInfo();
//    _loadUserInfo2();

    return Scaffold(
      appBar: AppBar(
        title: Text("按钮组件"),
      ),
      body: Column(
        /// 垂直对齐
//            mainAxisAlignment: MainAxisAlignment.start,
//
//            /// 水平对齐
//            crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('比例视图'),
          Container(
            color: Colors.red,
            height: 50.0,
            child: AspectRatio(
              aspectRatio: 2, //横纵比 长宽比
              child: SizedBox(
                width: 10,
                height: 10,
                child: Container(
                  color: Colors.orange,
                ),
              ),
            ),
          ),

          Checkbox(
//              tristate: true,
            value: _checkbox_value,
            activeColor: Colors.red,
            checkColor: Colors.orange,
            focusColor: Colors.red,
            hoverColor: Colors.red,
            onChanged: (value) {
              _checkbox_value = value;
              setState(() {});
            },
          ),
          CheckboxListTile(
            title: Text("A"),
            subtitle: Text("a-subtitle"),
            secondary: Icon(Icons.home),
            selected: _checkboxListTile_value,
            value: _checkboxListTile_value,
            isThreeLine: false,
            onChanged: (value) {
              setState(() {
                _checkboxListTile_value = value;
              });
            },
          ),

          Row(
            children: <Widget>[
              /// 单选
              Radio(
                value: 0,
                groupValue: _Radio_value,
                activeColor: Colors.red,
                onChanged: (int value) {
                  setState(() {
                    _Radio_value = value;
                  });
                },
              ),

              Radio(
                value: 1,
                groupValue: _Radio_value,
                activeColor: Colors.red,
                onChanged: (int value) {
                  setState(() {
                    _Radio_value = value;
                  });
                },
              ),
            ],
          ),

          ///用row 显示不出来
          /// 含有文字单选
          Column(
            children: <Widget>[
              /// 单选
              RadioListTile(
                title: Text("男"),
                subtitle: Text("男-sub"),
                selected: _RadioListTile_value == 0,
                secondary: Icon(Icons.filter_1),
                value: 0,
                groupValue: _RadioListTile_value,
                activeColor: Colors.red,
                onChanged: (int value) {
                  setState(() {
                    _RadioListTile_value = value;
                  });
                },
              ),

              RadioListTile(
                title: Text("女"),
                subtitle: Text("女-sub"),
                secondary: Icon(Icons.filter_2),
                selected: _RadioListTile_value == 1,
                value: 1,
                groupValue: _RadioListTile_value,
                activeColor: Colors.red,
                onChanged: (int value) {
                  setState(() {
                    _RadioListTile_value = value;
                  });
                },
              ),
            ],
          ),

          Switch(
            value: _Switch_value,
            onChanged: (value) {
              setState(() {
                _Switch_value = value;
              });
              debugPrint(value.toString());
            },
          ),

          SwitchListTile(
            title: Text("SwitchListTile"),
            subtitle: Text("SwitchListTile-sub"),
            secondary: Icon(Icons.remove_red_eye),
            selected: _Switch_value,
            value: _Switch_value,
            onChanged: (value) {
              setState(() {
                _Switch_value = value;
              });
              debugPrint(value.toString());
            },
          ),

          Slider(
            value: _Slider_value,
            activeColor: Colors.red,
            inactiveColor: Colors.grey,
            min: 0.0,
            max: 10.0,
            divisions: 10,

            ///  divisions 才能有值
            label: _Slider_value.toString(),
            onChanged: (value) {
              setState(() {
                _Slider_value = value;
              });
              debugPrint(value.toString());
            },
          ),

          FlatButton(
            child: Text("日期选择"),
            onPressed: () {
              _selectDateFunc();
            },
            splashColor: Colors.red,
            color: Colors.green,
            textColor: Colors.white,
          ),

          Text(
//              DateFormat.yMMMd().format(selectDateTime),

//              DateFormat("yyyy-MM-dd").format(selectDateTime),

            formatDate(selectDateTime, [yyyy, '-', mm, '-', dd]),
//           DateTime.fromMillisecondsSinceEpoch(selectDateTime.millisecondsSinceEpoch).toString(),
          ),

          FlatButton(
            child: Text("时间选择"),
            onPressed: () {
              _selectTimeFunc();
            },
            splashColor: Colors.red,
            color: Colors.green,
            textColor: Colors.white,
          ),

          Text(
            selectTime.format(context),
//           DateTime.fromMillisecondsSinceEpoch(selectDateTime.millisecondsSinceEpoch).toString(),
          ),

          Text(
            formatTimeOfDayalUse24Hour(selectTime, context),
//           DateTime.fromMillisecondsSinceEpoch(selectDateTime.millisecondsSinceEpoch).toString(),
          ),
        ],
      ),
    );
  }
}
