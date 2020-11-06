import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:share/share.dart';

class ArticleView extends StatefulWidget {
  final String url;
  final String title;

  ArticleView({@required this.url,this.title});

  @override
  _ArticleViewState createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    final RenderBox box = context.findRenderObject();
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(icon: Icon(Icons.share_rounded), onPressed: (){
            Share.share('${widget.title} : ${widget.url}',
              subject: 'Do Check Out',
              //sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size
            );
          }),
        ],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Daily'),
            Text(
              'News',
              style: TextStyle(color: Colors.red),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Container(
          child: WebView(
            initialUrl: widget.url,
            onWebViewCreated: (WebViewController webViewController) {
              _controller.complete(webViewController);
            },
          ),
        ),
      ),
    );
  }
}
