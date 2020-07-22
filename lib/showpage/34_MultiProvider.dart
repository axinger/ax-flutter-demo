import 'package:ax_flutter_util/ax_flutter_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class P34MultiProvider extends StatefulWidget {
  @override
  _P34MultiProviderState createState() => _P34MultiProviderState();
}

// 定义对象 extends ChangeNotifier
class Counter extends ChangeNotifier {
  //1
  int _count;

  Counter(this._count);

  void add() {
    _count++;
    notifyListeners(); //2
  }

  get count => _count; //3
}

class UserModel extends ChangeNotifier {
  int _age;
  String _name;

  UserModel({int age, String name})
      : _age = age,
        _name = name;

  set age(age) {
    _age = age;
//    _age++;
    notifyListeners();
  }

  get age => _age;

  set name(name) {
    _name = name;
    notifyListeners();
  }

  add() {
    _age++;
  }

  get name => _name;
}

class P34Provider extends StatefulWidget {
  @override
  _P34ProviderState createState() => _P34ProviderState();
}

class _P34ProviderState extends State<P34Provider> {
  UserModel userModel = UserModel(age: 2);

  @override
  Widget build(BuildContext context) {
    //如果状态管理放在顶层 MaterialApp 之上，它的作用域是全局，任何界面都可以获取;

    return ChangeNotifierProvider<UserModel>.value(
//        create: (_) => userModel,
        value: userModel,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Provider'),
          ),
          body: Column(
            children: <Widget>[
//              Text('显示值 ${userModel.age.toString()}'),
              ProviderSub(),
              FlatButton(
                child: Text('直接改变值'),
                onPressed: () {
//                  print(userModel.age);
                  userModel.add();
                },
              ),
            ],
          ),
        ));
  }
}

class ProviderSub extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<UserModel>(builder: (context, value, child) {
      print(value.age);
      return Text(Provider.of<UserModel>(context).age.toString());
    });
  }
}

class _P34MultiProviderState extends State<P34MultiProvider> {
  Counter _counter = Counter(2);
  UserModel userModel = UserModel(age: 2);

  @override
  Widget build(BuildContext context) {
    /// MultiProvider 和 context.read<Counter> 不要再同一个 widget中,会报错
    /// 或者直接使用 定义属性
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => _counter),
        ChangeNotifierProvider(create: (context) => userModel),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text('Provider'),
          actions: <Widget>[
            FlatButton(
              child: Text("单个"),
              onPressed: () {
                push(context: context, widget: P34Provider());
              },
            ),
          ],
        ),
        body: Row(
//          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Consumer<Counter>(
                  builder: (context, value, child) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'userModel: ${userModel.age.toString()}',
                          style: TextStyle(backgroundColor: Colors.red),
                        ),
                        Text(
                            'MultiProvider 和 context.read<Counter>\n不要再同一个 widget中,会报错'),
                        Text(
                          '显示值-context.watch: ${context.watch<Counter>().count.toString()}',
                          style: TextStyle(backgroundColor: Colors.red),
                        ),
                        Text(
                          '显示值-直接取值:${value.count.toString()}',
                        ),
                        Text(
                          '显示值-Provider.of:${Provider.of<Counter>(context, listen: false).count.toString()}',
                          style: TextStyle(backgroundColor: Colors.red),
                        ),
                      ],
                    );
                  },
                ),
                Test1VIew(),
                FlatButton(
                  child: Text("直接改变值"),
                  onPressed: () {
                    _counter.add();
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class Test1VIew extends StatefulWidget {
  @override
  _Test1VIewState createState() => _Test1VIewState();
}

class _Test1VIewState extends State<Test1VIew> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        FlatButton(
          child: Text("Provider.of 改变值"),
          onPressed: () {
            Provider.of<Counter>(context, listen: false).add();
          },
        ),
        FlatButton(
          child: Text("context.read 改变值"),
          onPressed: () {
            context.read<Counter>().add();
          },
        ),
      ],
    );
  }
}
