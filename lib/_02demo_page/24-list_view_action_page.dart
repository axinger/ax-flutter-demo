// import 'dart:math';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// // import 'package:slide_item/slide_item.dart';
//
// class ListViewActionPage extends StatefulWidget {
//   ListViewActionPage({Key? key, this.title=''}) : super(key: key);
//   final String title;
//
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class Item {
//   Color color;
//   int index;
//
//   Item(this.color, this.index);
// }
//
// class _MyHomePageState extends State<ListViewActionPage> {
//   List<Item> itemList=<Item>[];
//
//   @override
//   void initState() {
//     super.initState();
//     Random random = Random();
//     itemList = List.generate(
//         30,
//         (index) => Item(
//             Color.fromARGB(255, random.nextInt(255), random.nextInt(255),
//                 random.nextInt(255)),
//             index));
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("第三方侧滑"),
//       ),
//       body: SlideConfiguration(
//         config: SlideConfig(
//             slideOpenAnimDuration: Duration(milliseconds: 200),
//             slideCloseAnimDuration: Duration(milliseconds: 400),
//             deleteStep1AnimDuration: Duration(milliseconds: 250),
//             deleteStep2AnimDuration: Duration(milliseconds: 300),
//             supportElasticity: true,
//             closeOpenedItemOnTouch: true,
// //            slideProportion: 0.2,
//             slideWidth: 80,
//             actionOpenCloseThreshold: 0.3,
//             backgroundColor: Colors.white),
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: ListView.builder(
//             itemCount: itemList.length,
//             itemBuilder: (_, index) => Builder(
//               builder: (_) {
//                 print('debug -> build at builder $index');
//                 return SlideItem(
//                   slidable: true,
//                   indexInList: index,
//                   child: GestureDetector(
//                     child: Container(
//                       decoration: BoxDecoration(
//                         border: Border.all(color: Colors.green),
//                       ),
//                       child: Column(
//                         children: <Widget>[
//                           Row(
//                             children: <Widget>[
//                               Icon(Icons.person_outline),
//                               Text('index ${itemList[index].index}')
//                             ],
//                           ),
//                           Container(
//                             height: (itemList[index].index % 6 + 3) * 14.0,
//                             color: itemList[index].color,
//                           )
//                         ],
//                       ),
//                     ),
//                     onTap: () {
//                       print('debug -> click at item ${itemList[index].index}');
//                     },
//                   ),
//
//                   /// 右边侧滑
//                   actions: <SlideAction>[
//                     SlideAction(
//                       actionWidget: Container(
//                         child: Icon(Icons.add_circle_outline),
//                         color: Colors.blue,
//                       ),
//                       tapCallback: (_) {
//                         print('debug -> click at delete ${_.indexInList}');
//                       },
//                       isDeleteButton: true,
//                     ),
//                     SlideAction(
//                       actionWidget: Container(
//                         child: Icon(Icons.delete),
//                         color: Colors.blue,
//                       ),
//                       tapCallback: (_) {
//                         print('debug -> click at delete ${_.indexInList}');
//                         _.delete().then((_) {
//                           print('debug -> ${itemList[index].index} removed');
//                           setState(() {
//                             itemList.removeAt(index);
//                           });
//                         });
//                       },
//                       isDeleteButton: false,
//                     ),
//                   ],
//
//                   /// 左边侧滑
//                   leftActions: <SlideAction>[
//                     SlideAction(
//                         actionWidget: Container(
//                           child: Icon(Icons.adjust),
//                           color: Colors.blueGrey,
//                         ),
//                         tapCallback: (_) {
//                           print('debug -> click at adjust ${_.indexInList}');
//                         }),
//                   ],
//                 );
//               },
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
