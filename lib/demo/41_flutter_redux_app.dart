// import 'package:flutter/material.dart';
// // import 'package:flutter_redux/flutter_redux.dart';
// import 'package:redux/redux.dart';
//
// //步骤2，用于在步骤三中做消息区分与消息发送
// enum Action { Increment }
//
// //步骤1的数据共享类是count,一个基本数据类型
// //步骤3，处理数据的更新逻辑，此处是做加一操作，注意需要把新的类型返回
// int reducer(int count, action) {
//   if (action == Action.Increment) {
//     return count + 1;
//   }
//   return count;
// }
//
// class P41FlutterReduxApp extends StatelessWidget {
//   //步骤4 申明一个store,必须传入一个方法进去，其余的参数选填，这里选择初始化一下基础参数
//   final store = Store(reducer, initialState: 0);
//
//   @override
//   Widget build(BuildContext context) {
//     return StoreProvider(
//       store: store, //绑定store
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text("Title"),
//         ),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Text("You have pushed the button this many times:"),
//               //当需要使用到共享数据的时候使用StoreConnector来获取数据
//               ///  StoreConnector<int, 返回值>
//               StoreConnector<int, String>(
//                 converter: (Store store) {
//                   print('store.state.toString() = ${store.state.runtimeType}');
//                   return store.state.toString();
//                 },
//                 builder: (context, value) {
//                   print('value = ${value}');
//
//                   return Text(value);
//                 },
//               )
//             ],
//           ),
//         ),
//         floatingActionButton: StoreConnector<int, VoidCallback>(
//           converter: (Store store) {
//             return () => store.dispatch(Action.Increment); //发送数据
//           },
//           builder: (BuildContext context, VoidCallback callback) {
//             return FloatingActionButton(
//                 onPressed: callback, child: Icon(Icons.add));
//           },
//         ),
//       ),
//     );
//   }
// }
