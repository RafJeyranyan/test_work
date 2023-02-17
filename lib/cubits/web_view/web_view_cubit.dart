import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_work/cubits/web_view/web_view_state.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewCubit extends Cubit<WebViewState> {
  final String url;

  WebViewCubit({required this.url})
      : super(WebViewState(
            stage: WebViewStage.loading,
            url: url,
            controller: WebViewController())) {
    setUpController();
  }

  setUpController() {
    state.controller.setJavaScriptMode(JavaScriptMode.unrestricted);
    state.controller.loadRequest(Uri.parse(state.url));

  }
}
