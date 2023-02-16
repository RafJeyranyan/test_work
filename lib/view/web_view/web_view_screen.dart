import 'package:flutter/material.dart';

class WebViewScreen extends StatelessWidget {
  const WebViewScreen({Key? key,
    required this.url
  }) : super(key: key);

  final String url;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(url),
      ),
    );
  }
}
