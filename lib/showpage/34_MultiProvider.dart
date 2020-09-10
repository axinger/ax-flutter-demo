import 'package:ax_flutter_util/ax_flutter_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddModel extends ChangeNotifier {
  int _age1;
  int _age2;

  AddModel({int age1, int age2})
      : _age1 = age1,
        _age2 = age2;

  int get age1 => _age1;

  /// add 和 add2 同时改变 _age
  add1Age1() {
    _age1++;
    notifyListeners();
  }

  int get age2 => _age2;

  addAge2() {
    _age2++;
    notifyListeners();
  }
}

class PlusModel extends ChangeNotifier {
  int _age;

  PlusModel({int age}) : _age = age;

  get age => _age;

  /// add 和 add2 同时改变 _age
  add() {
    _age++;
    notifyListeners();
  }

  add2() {
    _age++;
    notifyListeners();
  }
}

class P34Provider extends StatefulWidget {
  @override
  _P34ProviderState createState() => _P34ProviderState();
}

class _P34ProviderState extends State<P34Provider> {
  AddModel userModel = AddModel(age1: 10, age2: 20);

  @override
  Widget build(BuildContext context) {
    //如果状态管理放在顶层 MaterialApp 之上，它的作用域是全局，任何界面都可以获取;

    return Scaffold(
      appBar: AppBar(
        title: Text('Provider'),
      ),
      body: ChangeNotifierProvider<AddModel>.value(
        value: userModel,
        child: Column(
          children: <Widget>[
            FlatButton(
              child: Text('下一页'),
              onPressed: () {
//                push(context: context, widget: NextPage());
                push(context: context, widget: Consumer3());


              },
            ),

            Text('无论是点击那个Button都会引起Consumer1和Consumer2的重绘，'
                '这明显与我们使用Provider的初衷是违背的。'
                '而在实际的使用场景中，这种情况会带来比预想更差的UI表现'),
            FlatButton(
              child: Text('add1'),
              onPressed: () {
                userModel.add1Age1();
              },
            ),
            Consumer1(),

            ///  Selector<AddModel,int> 第一个泛型 selector ,第二个泛型 builder 的值
            Selector<AddModel, int>(
                builder: (BuildContext context, int data, Widget child) {
              print('Selector1=============');
              return Text(
                  //获取数据
                  'Selector1 : ${data.toString()}');
            }, selector: (BuildContext context, AddModel counterProvider) {
              //这个地方返回具体的值，对应builder中的data
              return counterProvider.age1;
            }),
            Divider(
              color: Colors.red,
            ),

            Consumer2(),
            Selector<AddModel, int>(
                builder: (BuildContext context, int data, Widget child) {
              print('Selector2=========');
              return Text(
                  //获取数据
                  'Selector2 : ${data.toString()}');
            }, selector: (BuildContext context, AddModel counterProvider) {
              //这个地方返回具体的值，对应builder中的data
              return counterProvider.age2;
            }),
            Divider(
              color: Colors.red,
            ),

            Divider(
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}

class NextPage extends StatefulWidget {
  @override
  _NextPageState createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> {

  @override
  Widget build(BuildContext context) {
//    print(' context.read<AddModel>() =  ${context.read<AddModel>()}');
//
//    AddModel bloc = Provider.of<AddModel>(context);
//    print('bloc =  $bloc');
    return Scaffold(
      appBar: AppBar(
        title: Text('push 子页面'),
      ),
      body: Column(
        children: [
//          Consumer<AddModel>(
//            builder: (BuildContext context, AddModel value, Widget child) {
//              return child;
//            },
//            child: FlatButton(
//              child: Text('add2'),
//              onPressed: () {
//                context.read<AddModel>().add1Age1();
//              },
//            ),
//          ),

          FlatButton(
            child: Text('add2'),
            onPressed: () {
              print('read =  ${  context.read<AddModel>()}');
//              context?.read<AddModel>()?.add1Age1();
//              context?.watch<AddModel>()?.add1Age1();
            },
          ),

        ],
      ),
    );
  }
}

class Consumer1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Consumer1'),
        Consumer<AddModel>(builder: (context, value, child) {
          print('Consumer1 收到消息');
          return Column(
            children: [
              Text('Consumer1 = ${value.age1}'),
            ],
          );
        }),
//        Text('局部刷新<Selector>'),
//        Selector<UserModel, int>(
//
//          selector: (ctx, model) => model.age,
//
//          builder: (ctx, value, child) {
//            print('Selector 1 刷新');
//
//            return Row(
//              mainAxisAlignment: MainAxisAlignment.center,
//              children: <Widget>[
//                Text('Selector<Model,int>次数：' + value.toString()),
//                OutlineButton(
//                  onPressed: () {
//                    context.read<UserModel>().add();
//                  },
//                  child: Icon(Icons.add),
//                )
//              ],
//            );
//          },
//          shouldRebuild: (m1, m2) {
//            print('s1：$m1 $m2 ${m1 != m2 ? '不相等，本次刷新' : '数据相等，本次不刷新'}');
//            return m1 != m2;
//          },
//        ),
      ],
    );
  }
}

class Consumer2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AddModel _model = context.select<AddModel, AddModel>((value) => value);

    return Column(
      children: [
        Text('Consumer2'),
        Consumer<AddModel>(builder: (context, value, child) {
          print('Consumer2 收到消息');
          return Column(
            children: [
              FlatButton(
                child: Text('add2,在子页面中'),
                onPressed: () {
                  value.addAge2();
                },
              ),

              Text('Consumer2 = ${value.age2}'),
            ],
          );
        }),
      ],
    );
  }
}
class Consumer3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AddModel _model = context.select<AddModel, AddModel>((value) => value);

    return Scaffold(
      body: Column(
        children: [
          Text('Consumer2'),
          Consumer<AddModel>(builder: (context, value, child) {
            print('Consumer2 收到消息');
            return Column(
              children: [
                FlatButton(
                  child: Text('add2,在子页面中'),
                  onPressed: () {
                    value.addAge2();
                  },
                ),

                Text('Consumer2 = ${value.age2}'),
              ],
            );
          }),
        ],
      ),
    );
  }
}
class P34MultiProvider extends StatefulWidget {
  @override
  _P34MultiProviderState createState() => _P34MultiProviderState();
}

class _P34MultiProviderState extends State<P34MultiProvider> {
  PlusModel _counter = PlusModel(age: 1);
  AddModel userModel = AddModel(age1: 2);

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
                Consumer<PlusModel>(
                  builder: (context, value, child) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'userModel: ${userModel.age1.toString()}',
                          style: TextStyle(backgroundColor: Colors.red),
                        ),
                        Text(
                            'MultiProvider 和 context.read<Counter>\n不要再同一个 widget中,会报错'),
                        Text(
                          '显示值-context.watch: ${context.watch<PlusModel>().age}',
                          style: TextStyle(backgroundColor: Colors.red),
                        ),
                        Text(
                          '显示值-直接取值:${value.age}',
                        ),
                        Text(
                          '显示值-Provider.of:${Provider.of<PlusModel>(context, listen: false).age.toString()}',
                          style: TextStyle(backgroundColor: Colors.red),
                        ),
                      ],
                    );
                  },
                ),
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
