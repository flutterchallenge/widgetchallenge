import 'package:flutter/material.dart';
import 'package:flutterchallenge/widgets/forms.dart';
import 'package:flutterchallenge/widgets/spacer.dart';
import 'package:flutterchallenge/widgets/page_webview.dart';

import 'widgets/clipper.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Challenge',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        'spacer': (context) => AlignmentWithSpacer(),
        'clipper': (context) => MyCustomClipper(),
        'form': (context) => Forms(),
        'webview': (context) => MyWebView3()
      },
      home: MyHomePage(title: 'Flutter Challenge'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: ListView(
          children: <Widget>[
            ListTile(
              title: Text("Spacer"),
              subtitle: Text("Mange the space between the widget with spacer"),
              onTap: () => Navigator.pushNamed(context, "spacer"),
            ),
            ListTile(
              title: Text("Custom Clipper"),
              subtitle: Text("Mange the space between the widget with spacer"),
              onTap: () => Navigator.pushNamed(context, "clipper"),
            ),
            ListTile(
              title: Text("Forms"),
              subtitle: Text("Form types with different widgets and validation"),
              onTap: () => Navigator.pushNamed(context, "form"),
            ),
            ListTile(
              title: Text("WebView"),
              subtitle: Text("All Webview details in depth"),
              onTap: () => Navigator.pushNamed(context, "webview"),
            )
          ],
        ));
  }
}
