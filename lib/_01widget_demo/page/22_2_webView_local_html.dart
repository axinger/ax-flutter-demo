import 'dart:convert';

import 'package:ax_flutter_util/ax_flutter_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

class LocalHtmlPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TestPage();
  }
}

class _TestPage extends State<LocalHtmlPage> {
  Future<String> _getFile() async {
    return await rootBundle.loadString('assets/files/index.html');
  }

  WebViewController? _webViewController;

  @override
  void initState() {
    super.initState();
  }

  // Set<JavascriptChannel> _javascriptChannels(BuildContext context) {
  //   return [
  //     /// 在h5中注册一个方法,原生也可以调用
  //     JavascriptChannel(
  //       name: 'show_native_alert',
  //       onMessageReceived: (JavascriptMessage message) {
  //         print("message.message == ${message.message}");
  //         showCupertinoAlert(context: context, title: message.message);
  //       },
  //     ),
  //     JavascriptChannel(
  //       name: 'alert',
  //       onMessageReceived: (JavascriptMessage message) {
  //         print("message.message == ${message.message}");
  //         showCupertinoAlert(context: context, title: message.message);
  //       },
  //     ),
  //   ].toSet();
  // }
  //
  // /// Flutter calls JS
  // Future<String> postMessageToJs(String channel, String jsCode) {
  //   if (_webViewController == null) {
  //     return Future.value('');
  //   }
  //   return _webViewController?.evaluateJavascript('${channel}.postMessage(${jsCode});') ?? Future.value('');
  // }

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize();
//     return Scaffold(
//       appBar: AppBar(
//         brightness: Brightness.light,
//         title: Text("加载本地html和js交互"),
//         centerTitle: true,
//       ),
//       persistentFooterButtons: <Widget>[
//         TextButton(
//           // color: Colors.blueGrey,
//           child: Text('调用js方法'),
//           onPressed: () {
//             /// 调用js方法,给js方法传参
//             _webViewController?.evaluateJavascript("nativeCallJsMethod('jim')");
//           },
//         ),
//         TextButton(
//           // color: Colors.blueGrey,
//           child: Text('调用自己注册的js方法'),
//           onPressed: () {
//             /// 调用js方法,给js方法传参
//             _webViewController?.evaluateJavascript('alert.postMessage("tom");');
//           },
//         ),
//       ],
//       body: FutureBuilder<String>(
//         future: _getFile(),
//         builder: (context, snapshot) {
// //          snapshot.connectionState
//           if (snapshot.hasData) {
//             return WebView(
//               javascriptMode: JavascriptMode.unrestricted,
//               javascriptChannels: _javascriptChannels(context),
//               initialUrl: Uri.dataFromString(snapshot.data ?? '', mimeType: 'text/html', encoding: Encoding.getByName('utf-8')).toString(),
//               // 加载的url
//
//               navigationDelegate: (NavigationRequest request) {
//                 if (request.url.startsWith('https://www.youtube.com/')) {
// //                  print('blocking navigation to $request}');
//                   return NavigationDecision.prevent;
//                 }
// //                print('allowing navigation to $request');
//                 return NavigationDecision.navigate;
//               },
//
//               onPageFinished: (String value) {
//                 // webview 页面加载调用
//               },
//               onWebViewCreated: (WebViewController controller) {
//                 _webViewController = controller;
//               },
//             );
//           } else if (snapshot.hasError) {
//             return Scaffold(
//               body: Center(
//                 child: Text("${snapshot.error}"),
//               ),
//             );
//           }
//           return Scaffold(
//             body: Center(child: CircularProgressIndicator()),
//           );
//         },
//       ),
//     );
  }
}
