import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MyWebView extends StatefulWidget {
  @override
  _MyWebViewState createState() => _MyWebViewState();
}

class _MyWebViewState extends State<MyWebView> {
  String url = "http://yubarajpoudel.com";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Profile"),
        ),
        body: WebView(
          initialUrl: url,
          javascriptMode: JavascriptMode.unrestricted,
          onPageFinished: (url) {
            print("Loaded $url");
          },
        ));
  }
}

class MyWebView2 extends StatefulWidget {
  @override
  _MyWebView2State createState() => _MyWebView2State();
}

class _MyWebView2State extends State<MyWebView2> {
  WebViewController _controller;
  String _inital = "Press button to change color";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("$_inital"),
        ),
        body: WebView(
          onWebViewCreated: (webViewController) {
            _controller = webViewController;
            _loadHtmlFromAssets();
          },
          javascriptMode: JavascriptMode.unrestricted,
          javascriptChannels: Set.from([
            JavascriptChannel(
                name: "colorChanged",
                onMessageReceived: (JavascriptMessage result) {
                  print("message ${result.message}");
                  setState(() {
                    _inital = "Color changed to ${result.message}";
                  });
                }),
          ]),
        ));
  }

  _loadHtmlFromAssets() async {
    String fileText =
        await rootBundle.loadString('assets/pages/samplepage.html');
    _controller.loadUrl(Uri.dataFromString(fileText,
            mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
        .toString());
  }
}

class MyWebView3 extends StatefulWidget {
  @override
  _MyWebView3State createState() => _MyWebView3State();
}

class _MyWebView3State extends State<MyWebView3> {
  @override
  Widget build(BuildContext context) {
    List urls = [
      "https://flutter.dev/",
      "https://google.com/",
      "https://github.com/yubarajpoudel"
    ];
    List titles = ["flutter site", "google site", "author site"];
    return Scaffold(
      appBar: AppBar(
        title: Text("Webview 3"),
      ),
      body: ListView.builder(
          itemCount: 3,
          itemBuilder: (item, index) {
            return Container(
                height: 200.0,
                child: ListTile(
                    title: Text(titles[index]),
                    subtitle: WebView(
                      initialUrl: urls[index],
                      gestureRecognizers: Set()
                        ..add(Factory<VerticalDragGestureRecognizer>(
                            () => VerticalDragGestureRecognizer())),
                    )));
          }),
    );
  }
}
