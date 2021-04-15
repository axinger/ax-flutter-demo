# 禁止安卓 alert 返回键 pop
```dart
Future<bool> showPermissionAlert(BuildContext context) async {
    return showDialog<bool>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return  WillPopScope(
              onWillPop: () async => false,//重点此举
              child: AlertDialog(
                title: Text('Allow the app to always use your location'),
                content: SingleChildScrollView(
                  child: ListBody(
                    children: <Widget>[
                      Text('Something'),
                    ],
                  ),
                ),
                actions: <Widget>[
                  FlatButton(
                    child: Text('doSomething'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
                ],
              )
          );
        });
  }
```

# Container 满屏宽
```dart
 Container(
          color: widget.bgColors,

          /// Container 满屏宽
          alignment: Alignment.center,
        ),
```
# 显示影藏控件 Visibility 和 Offstage

# plugin 依赖加载图片
plugin 取名字不要用-,用_;
```dart
Image.asset('url',package: 'yaml中的name',)
```

# 定义回调函数
```dart
/// 指定参数
Function({String name,int age}) completeCallback;
/// 可以无限传参
Function callback;
```

# PublishSubject
PublishSubject是一个普通的广播StreamController，
但有一种情况是例外的：当stream返回一个Observable而不是一个Stream时。

# BehaviorSubject
BehaviorSubject也是一个广播StreamController，它返回一个Observable而不是一个Stream。
与PublishSubject的主要区别在于BehaviorSubject还将最后发送的事件发送给 [刚刚订阅的监听器]。


# ReplaySubject
ReplaySubject也是一个广播StreamController，它返回一个Observable而不是一个Stream。
默认情况下，ReplaySubject将Stream已经发出的所有事件作为第一个事件发送到任何新的监听器。

# Column crossAxisAlignment 为内容对齐方式,
```dart
 Column(
          crossAxisAlignment: CrossAxisAlignment.center,)
```
# 数字操作
```dart
  print('四舍五入');
  print(0.4.round());
  print(0.5.round());
  print('向下取整');
  print(0.4.floor());
  print(1.1.floor());
  print('向上取整');
  print(0.4.ceil());
  print(1.1.ceil());
  print('sign 返回-1，0或1，具体取决于数字的符号和数值');
  print(1.1.sign);
  print(0.sign);
  print(-1.0.sign);
  print('truncate 去除小数');
  print(1.01.truncate());
```

### 通过key去获取到控件的BuildContext,而我们知道BuildContext的实现其实是Element,
### 而Element持有RenderObject,所以我们知道的RenderObject,实际上获取到的就是RenderBox,
### 那么通过RenderBox我们就可以获取大小跟位置.

```dart
 showSizes() {
    RenderBox renderBoxRed = fileListKey.currentContext.findRenderObject();
    print(renderBoxRed.size);
  }

  showPositions() {
    RenderBox renderBoxRed = fileListKey.currentContext.findRenderObject();
    print(renderBoxRed.localToGlobal(Offset.zero));
  }

```
```dart
void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.custom

  /// 自定义遮罩
    ..maskType = EasyLoadingMaskType.custom
    ..indicatorSize = 45
    ..radius = 10.0
    ..progressColor = Colors.yellow
    ..backgroundColor = Colors.black54
    ..indicatorColor = Colors.yellow
    ..textColor = Colors.yellow

  /// 自定义遮罩 背景色
    ..maskColor = Colors.black54

  /// 是否可以点击
    ..userInteractions = false;
}
```

## 计算文字宽度
```dart
  /// 计算文件宽度
  double paintWidthWithTextStyle(String text, TextStyle style) {
    var textPainter = TextPainter(
        text: TextSpan(text: text, style: style),
        maxLines: 1,
        textDirection: TextDirection.rtl)
      ..layout(minWidth: 0, maxWidth: double.infinity);
    return textPainter.size.width;
  }
```

##  String substringManipulation(String substring) 回调
```dart

  void _selectionAwareTextManipulation(
    String value,
    String substringManipulation(String substring),
  ) {
    print('value = $value');
    print('substringManipulation = ${substringManipulation('jim')}');
  }

  _selectionAwareTextManipulation('tom', (substring) {
    print('substring =$substring');

    return substring*2;
  });
```

## 参数回调
```dart
  void _callBack(
    String value,

    /// 直接方法名 ,  String Function(String name) nameCallBack 一样
    String nameCallBack(String name),
  ) {
    print('value = $value');
    var call = nameCallBack('jim');
    print('nameCallBack = $call');
  }

  _callBack('jim', (name) {
    print(name);
    return '$name==2';
  });
```

## 重新父类属性 get方法
```dart
class Person {
  String name;

  Person({this.name});
}

class Student extends Person {
  @override
  // TODO: implement name
//  String get name => super.name;
 String get name => 'jim';
}
```

## 取余
```dart
  print('向下整数取余 ${3~/2}'); // 1 取整);
  print('取余 ${3%2}'); // 1 取整);

  print('向下整数取余 ${3.6~/2}'); // 1 取整);
  print('取余 ${3.6%2}'); // 1.6 取整);
```


## 不可变数组
```dart
List<String> list = List.unmodifiable(["2"]);
try{
list.add('3');
}catch(e){
print('添加数据 $e');
}
```

## type 判断 两种方式  is 和 as
```dart
// 方式1
 if(order.runtimeType == OrderClassA){
    (order as OrderClassA).orderA();
  }
//方式二
  if(order is OrderClassA){
    order.orderA();
  }
  
```