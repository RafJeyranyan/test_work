import 'package:equatable/equatable.dart';
import 'package:webview_flutter/webview_flutter.dart';

enum WebViewStage {
  loading,
  display,
}

class WebViewState extends Equatable {
  final WebViewStage stage;

  final String url;

  final WebViewController controller;

  const WebViewState(
      {required this.stage, required this.url, required this.controller});

  WebViewState copyWith({
    WebViewStage? stage,
    String? url,
    WebViewController? controller,
  }) {
    return WebViewState(
      stage: stage ?? this.stage,
      url: url ?? this.url,
      controller: controller ?? this.controller,
    );
  }

  @override
  List<Object?> get props => [stage, url, controller];
}
