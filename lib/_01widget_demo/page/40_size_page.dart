// import 'package:binding_helper/binding_helper.dart';
// import 'package:flutter/material.dart';
//
// class P40SizePage extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     return _MinePage();
//   }
// }
//
// class _MinePage extends State<P40SizePage> {
//   GlobalKey qrBgKey = GlobalKey();
//   ValueNotifier<double> _valueNotifier = ValueNotifier(0.0);
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//
// //    WidgetsBinding.instance.addPostFrameCallback(_onAfterRendering);
//   }
//
//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//   }
//
//   @override
//   void didUpdateWidget(P40SizePage oldWidget) {
// //    WidgetsBinding.instance.addPostFrameCallback(_onAfterRendering);
//     super.didUpdateWidget(oldWidget);
//   }
//
//   void _onAfterRendering(Duration timeStamp) {
//     //这里编写获取元素大小和位置的方法
//
//     Size? size0 = qrBgKey?.currentContext?.size;
//
// //    final topLeftPosition = box.localToGlobal(Offset.zero);
// //    return topLeftPosition.dy;
//
//     print('size0 = $size0');
//
// //    RenderObject
//
//     var box = qrBgKey.currentContext?.findRenderObject();
//     Size? size1 = (box as RenderBox)?.size;
//     Offset? topLeftPosition = box?.localToGlobal(Offset.zero);
//
//     print('size1 = $size1');
//     print('topLeftPosition.dy = ${topLeftPosition?.dy}');
//     print(
//         'MediaQuery.of(context).padding.top= ${MediaQuery.of(context).padding.top}');
// //    const double kToolbarHeight = 56.0;
// //    print('MediaQueryData.fromWindow(window).padding.top= ${MediaQueryData.fromWindow(window).padding.top}');
//     _valueNotifier.value = topLeftPosition?.dy ??0 -kToolbarHeight - MediaQuery.of(context).padding.top + (size1?.height??0);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     WidgetsBinding.instance?.addPostFrameCallback(_onAfterRendering);
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('尺寸'),
//       ),
//       body: Stack(
//         overflow: Overflow.visible,
//         children: <Widget>[
//           Row(
//             children: <Widget>[
//               Container(
//                 color: Colors.blue,
//                 child: Column(
//                   children: <Widget>[
//                     Container(
//                       margin: EdgeInsets.only(top: 30, right: 20),
//                       key: qrBgKey,
//                       width: 50,
//                       height: 50,
//                       color: Colors.orange,
//                     )
//                   ],
//                 ),
//               ),
//               RectProvider(
//                   child: Container(
//                     margin: EdgeInsets.only(top: 30, right: 20),
//                     width: 50,
//                     height: 50,
//                     color: Colors.red,
//                   ),
//                   onGetRect: (Rect rect) {
//                     print('rect == ${rect.toString()}');
//                   }),
//             ],
//           ),
//
// //          Positioned(
// //              top: 150,
// //              left: 0,
// //              child: Container(
// //
// //                width: 100,
// //                height: 100,
// //                color: Colors.green,
// //              ), ),
//
//           Row(
//             children: <Widget>[
//               ValueListenableBuilder<double>(
//                 valueListenable: _valueNotifier,
//                 builder: (BuildContext context, value, Widget? child) {
//                   print('value = $value');
//                   return Positioned(
//                       top: value,
//                       left: 0,
//                       width: 100,
//                       height: 100,
//                       child: Container(
//                         width: 100,
//                         height: 100,
//                         color: Colors.green,
//                       ));
//                 },
//               ),
//             ],
//           ),
//
// //            Image.asset('assets/红包1.png'),
//         ],
//       ),
//     );
//   }
// }
