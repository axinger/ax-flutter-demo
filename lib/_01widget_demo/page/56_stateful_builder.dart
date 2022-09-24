import 'package:ax_flutter_util/ax_flutter_util.dart';
import 'package:flutter/material.dart';

class P56StatefulBuilder extends StatefulWidget {
  @override
  _P56StatefulBuilderState createState() => _P56StatefulBuilderState();
}

class _P56StatefulBuilderState extends State<P56StatefulBuilder> {
  var name1 = 'name1';
  var name2 = 'name2';
  StateSetter? _stateSetter;

  @override
  Widget build(BuildContext context) {
    print('局部刷新 = build');
    return Scaffold(
      appBar: AppBar(
        title: Text('局部刷新'),
        actions: [
          TextButton(
              onPressed: () {
                _stateSetter!(() {
                  name1 = '${100.random}';
                  name2 = '${100.random}';
                });
              },
              child: Text('刷新')),
        ],
      ),
      body: Column(
        children: [
          Text(name1),
          StatefulBuilder(
            builder: (BuildContext context, StateSetter stateSetter) {
              print('局部刷新 = StatefulBuilder');

              _stateSetter = stateSetter;
              return Text(
                name2,
              );
            },
          )
        ],
      ),
    );
  }
}
