import 'package:ax_flutter_demo/event/login_success_event.dart';
import 'package:ax_flutter_demo/event/update_user_info_event.dart';
import 'package:ax_flutter_demo/global_const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class P26TestEventPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MaterialPage();
  }
}

class _MaterialPage extends State<P26TestEventPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    EVENT_BUS.on<UpdateUserInfoEvent>().listen((event) {
      print("UpdateUserInfoEvent =监听== " + event.name);
//      EVENT_BUS.destroy();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("event"),
      ),
      body: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Column(
                children: <Widget>[
                  FlatButton(
                    child: Text("发送事件1"),
                    onPressed: () {
                      print(EVENT_BUS);

                      EVENT_BUS.fire(UpdateUserInfoEvent(name: "jim"));
                    },
                  ),
                  FlatButton(
                    child: Text("发送事件2"),
                    onPressed: () {
                      EVENT_BUS.fire(LoginSuccessEvent(name: "tom"));
                    },
                  ),
                  FlatButton(
                    child: Text("监听事件2"),
                    onPressed: () {
                      EVENT_BUS.on<LoginSuccessEvent>().listen((event) {
                        print("LoginSuccessEvent =监听= " + event.name);
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
