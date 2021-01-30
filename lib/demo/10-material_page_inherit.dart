import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

//
//class MaterialPageInheritedWidget extends StatefulWidget {
//  @override
//  State<StatefulWidget> createState() {
//    return _MaterialPage1();
//  }
//}
//
//class _MaterialPage1 extends State<MaterialPageInheritedWidget> {
//  int _count = 0;
//
//  VoidCallback _count_callback (){
//    setState(() {
//      _count+=1;
//    });
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return MyInheritedWidget(
//      count: _count,
//      callback: (){
//        setState(() {
//          _count+=1;
//
//        });
//      },
//      child: Scaffold(
//        appBar: AppBar(
//          title: Text("InheritedWidget"),
//        ),
//        floatingActionButton: FloatingActionButton(
//
//          child: Icon(Icons.add),
//          onPressed: _count_callback,
//
//        ),
//
//        body: MyInheritedWidget(count: _count,callback: _count_callback,),
//      ),
//    );
//  }
//}
//
//class ContainerWrapper extends StatelessWidget {
//
//  @override
//  Widget build(BuildContext context) {
//
//    final int count = MyInheritedWidget.of(context).count;
//    final VoidCallback callback = MyInheritedWidget.of(context).callback;
//
//    return ActionChip(
//      label: Text(count.toString()),
//      onPressed: callback,
//    );
//
//  }
//}
//
//
//class MyInheritedWidget extends InheritedWidget {
//  final int count;
//  final VoidCallback callback;
//  final Widget child;
//
//  MyInheritedWidget({this.count, this.callback, this.child})
//      : super(child: child);
//
//  /// 是否重建
//  @override
//  bool updateShouldNotify(InheritedWidget oldWidget) {
//    return true;
//  }
//
//  static MyInheritedWidget of(BuildContext context){
//    return context.dependOnInheritedWidgetOfExactType(aspect: MyInheritedWidget);
////    return context.inheritFromWidgetOfExactType( MyInheritedWidget);
//  }
//}

class MaterialPageInheritedWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _InheritedWidgetTestContainerState();
  }
}

class _InheritedWidgetTestContainerState
    extends State<MaterialPageInheritedWidget> {
  MyInheritedTestModel inheritedTestModel;

  _initData() {
    inheritedTestModel = MyInheritedTestModel(0);
  }

  @override
  void initState() {
    _initData();
    super.initState();
    print("2222222222222222");
  }

  /// 子控件要做的事情,都放在外部,
  _incrementCount() {
    setState(() {
//      inheritedTestModel =  InheritedTestModel(inheritedTestModel.count + 1);
      inheritedTestModel.count++;
    });
  }

  _reduceCount() {
    setState(() {
//      inheritedTestModel =  InheritedTestModel(inheritedTestModel.count - 1);
      inheritedTestModel.count--;
    });
  }

  @override
  Widget build(BuildContext context) {
    ///MyInheritedWidget 内部有TestWidgetA 等子控件,所以子控件通过context可以获得父类MyInheritedWidget
    return MyInheritedWidget(

        /// 这里赋值,子空间需要等到的值
        inheritedTestModel: inheritedTestModel,
        increment: _incrementCount,
        reduce: _reduceCount,
        child: Scaffold(
          appBar: AppBar(
            title: Text('InheritedWidgetTest'),
          ),
          body: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),

                /// text 内部排版了
                child: Text(
//                  '我们常使用的\nTheme.of(context).textTheme\nMediaQuery.of(context).size等\n就是通过InheritedWidget实现的',
                  '我们常使用的Theme.of(context).textThemeMediaQuery.of(context).size等就是通过InheritedWidget实现的',
                  style: TextStyle(fontSize: 20.0),
                  textAlign: TextAlign.left,
                ),
              ),

              Padding(
                padding: EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
                child: Text(
                    "MyInheritedWidget 内部有TestWidgetA 等子控件,所以子控件通过context可以获得父类MyInheritedWidget"),
              ),

              /// 这个 直接调用子控件,不需要传参 ,
              /// ＋号
              TestWidgetA(),

              /// 文本
              TestWidgetB(),

              /// 减号
              TestWidgetC(
                callBack: (value) {
                  print("value == ${value}");
                  setState(() {
//      inheritedTestModel =  InheritedTestModel(inheritedTestModel.count - 1);
//                  inheritedTestModel.count--;
                  });
                },
              ),
            ],
          ),
        ));
  }
}

class MyInheritedTestModel {
  int count;

//  const InheritedTestModel(this.count);
  MyInheritedTestModel(this.count);
}

/// 使用第三方的model
class InheritedTestModel2 extends Model {
  int _count;

  int get count => _count;

  addCoount() {
    _count += 1;
    notifyListeners();
  }
}

class MyInheritedWidget extends InheritedWidget {
  //数据
  final MyInheritedTestModel inheritedTestModel;

  //点击+号的方法
  final Function() increment;

  //点击-号的方法
  final Function() reduce;

  MyInheritedWidget({
    Key key,
    @required this.inheritedTestModel,
    @required this.increment,
    @required this.reduce,
    @required Widget child,
  }) : super(key: key, child: child);

  /// 根据上下文 获得 MyInheritedWidget 包装一下方法,统一调用
  static MyInheritedWidget of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MyInheritedWidget>();
  }

  //是否重建widget就取决于数据是否相同
  @override
  bool updateShouldNotify(MyInheritedWidget oldWidget) {
    return inheritedTestModel != oldWidget.inheritedTestModel;
  }
}

class TestWidgetA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /// 根据 context 获得 TestWidgetA 包在外层的 MyInheritedWidget extends InheritedWidget
    final MyInheritedWidget myInheritedWidget = MyInheritedWidget.of(context);

    final MyInheritedTestModel myInheritedTestModel =
        myInheritedWidget.inheritedTestModel;

    print('TestWidgetA 中count的值:  ${myInheritedTestModel.count}');
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
      child: RaisedButton(
          textColor: Colors.black,
          child: Text('+ 改变model值,中间控件获取model最新值'),
          onPressed: myInheritedWidget.increment),
    );
  }
}

/// 把执行的事件 回调出去
class TestWidgetB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MyInheritedWidget inheritedContext = MyInheritedWidget.of(context);

    final inheritedTestModel = inheritedContext.inheritedTestModel;

    print('TestWidgetB 中count的值:  ${inheritedTestModel.count}');

    return Padding(
      padding: const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
      child: Text(
        '当前count:${inheritedTestModel.count}',
        style: TextStyle(fontSize: 20.0),
      ),
    );
  }
}

/// 直接修改 model的值,然后回调
class TestWidgetC extends StatelessWidget {
  void Function(int value) callBack;

  TestWidgetC({
    @required this.callBack,
  });

  @override
  Widget build(BuildContext context) {
    final MyInheritedWidget myInheritedWidget = MyInheritedWidget.of(context);

    final MyInheritedTestModel inheritedTestModel =
        myInheritedWidget.inheritedTestModel;

    print('TestWidgetC 中count的值:  ${inheritedTestModel.count}');

    return Padding(
      padding: const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
      child: RaisedButton(
        textColor: Colors.black,
        child: Text('- 改变model值,中间控件获取model最新值'),
//        onPressed: myInheritedWidget.reduce,
        onPressed: () {
          inheritedTestModel.count--;
          this.callBack(inheritedTestModel.count);
        },
      ),
    );
  }
}
