import 'package:ax_flutter_plugin/ax_flutter_plugin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MaterialPagePlugin extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MaterialPage();
  }
}

class _MaterialPage extends State<MaterialPagePlugin> {
  String name = '1';
  String allValue = '1';

  String show_oc_text = '';

  // 需要设置Scaffold的key才能弹出SnackBar
  var _scaffoldkey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('插件-测试'),
      ),
      // 设置key处理SnackBar，这里一定要设置，否则弹窗不显示
      key: _scaffoldkey,
      body: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(show_oc_text.toString()),
                  FlatButton(
                    child: Text('存储数据_oc'),
                    onPressed: () {
                      KeyChain.set(key: 'name', value: 'tom').then((onValue) {
                        print('onValue == ${onValue.toString()}');
                      });
                    },
                  ),
                  FlatButton(
                    child: Text('读取数据_oc'),
                    onPressed: () {
                      KeyChain.get(key: 'name').then((onValue) {
                        print('读取数据onValue == ${onValue.toString()}');
                        Object? object;

                        print(' >>>>>>>> ${object??''}');

                        setState(() {
                          show_oc_text = onValue;
                        });
                      });
                    },
                  ),
                  FlatButton(
                    child: Text('清除数据_oc'),
                    onPressed: () {
                      KeyChain.remove(key: 'name').then((onValue) {
                        print('移除数据 onValue == ${onValue.toString()}');
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
