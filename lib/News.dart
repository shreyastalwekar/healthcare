import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class News extends StatefulWidget {
  @override
  createState() => _NewsState();
}

class _NewsState extends State<News> {
  final _key = UniqueKey();

  _NewsState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Expanded(
          child: WebView(
            key: _key,
            javascriptMode: JavascriptMode.unrestricted,
            initialUrl: 'https://www.medicalnewstoday.com/',
          ),
        )
      ],
    ));
  }
}
