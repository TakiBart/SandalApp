import 'dart:async';

import 'package:Sandal/strings.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'Styles.dart';
import 'colors.dart';


class ConfessionPage extends StatelessWidget {
  final Completer<WebViewController> _controller =  Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(strings['confessionSectionTitle'],
            style: Styles.titleTextStyle,
          ),
          iconTheme: IconThemeData(
              color: colors['appbarIconTheme']
          ),),
        body: WebView(
          initialUrl: strings['doodleLink'],
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController controller){
            _controller.complete(controller);
          },
        )
    );
  }
}