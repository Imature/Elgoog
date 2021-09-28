import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleDetail extends StatefulWidget {
  final articleUrl;

  ArticleDetail({this.articleUrl});

  @override
  _ArticleDetailState createState() => _ArticleDetailState();
}

class _ArticleDetailState extends State<ArticleDetail> {
  final Completer<WebViewController> _completer =
      Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Elgoog")
          ],
        ),
        actions: [
          Opacity(opacity: 0, child: Container(padding: EdgeInsets.symmetric(horizontal: 16), child: Icon(Icons.save),))
        ],
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        child: WebView(
          initialUrl: widget.articleUrl,
          onWebViewCreated: ((WebViewController webViewController) {
            _completer.complete(webViewController);
          }),
        ),
      ),
    );
  }
}
