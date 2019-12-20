import 'package:flutter/material.dart';

//import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_native_web/flutter_native_web.dart';

class IPython extends StatefulWidget {
  static const route = "/ipython";

  @override
  _IPythonState createState() => _IPythonState();
}

class _IPythonState extends State<IPython> {
  WebController webController;
  FlutterNativeWeb flutterWebView;

  _IPythonState() {
    flutterWebView = FlutterNativeWeb(
      onWebCreated: onWebCreated,
    );
  }

  void onWebCreated(webController) {
    this.webController = webController;
    this.webController.loadUrl("https://facebook.com");
    this.webController.onPageStarted.listen((url) => print("Loading $url"));
    this
        .webController
        .onPageFinished
        .listen((url) => print("Finished loading $url"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("IPython"),
      ),
      body: new Container(
        child: flutterWebView,
        height: 300.0,
        width: 500.0,
      ),
    );
  }
}
