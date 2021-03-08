import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  @override
  _WebViewPageState createState() => _WebViewPageState();
}

/// 加载网络的
class _WebViewPageState extends State<WebViewPage> {
  WebViewController? _controller;
  String _title = "webview";

  @override
  Widget build(BuildContext context) {
//    String url = 'https://test-open.zking.com/app/b2c/#/particulars/ZKICATM_0101FGB/1/?token=FCE91358A310908ED1BD2CA5C44B9E42&channelCode=DP_WXMP&terminalId=APP&accountType=1&agentId=P121335g7789';
//    String url = 'https://flutterchina.club/';
    String url = 'https://www.toutiao.com/';
    return Scaffold(
      appBar: AppBar(
        title: Text("$_title"),
      ),
      body: SafeArea(
        child: WebView(
          initialUrl: url,
          //JS执行模式 是否允许JS执行
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (controller) {
            _controller = controller;
          },
          onPageFinished: (url) {
            _controller?.evaluateJavascript("document.title").then((result) {
              setState(() {
                _title = result;
              });
            });
          },
          navigationDelegate: (NavigationRequest request) {
            print('request.url = ${request.url}');

            if (request.url.startsWith("myapp://")) {
              print("即将打开 ${request.url}");

              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
          javascriptChannels: <JavascriptChannel>[
            JavascriptChannel(
                name: "share",
                onMessageReceived: (JavascriptMessage message) {
                  print("参数： ${message.message}");
                }),
          ].toSet(),
        ),
      ),
    );
  }
}
