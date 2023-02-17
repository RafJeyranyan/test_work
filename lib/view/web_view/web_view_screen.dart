import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_work/cubits/web_view/web_view_cubit.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../cubits/web_view/web_view_state.dart';

class WebViewScreen extends StatelessWidget {
   const WebViewScreen({Key? key,
    required this.url
  }) : super(key: key);

  final String url;

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        body: BlocProvider<WebViewCubit>(
          create: (_)=> WebViewCubit(url: url),
          child: BlocBuilder<WebViewCubit,WebViewState>(
            builder: (context,state) {
              return WillPopScope(
                  onWillPop: () async{
                    if(await state.controller.canGoBack()){
                      state.controller.goBack();
                      return false;
                    }
                    return false;
                  },
                  child: WebViewWidget(controller: state.controller));
            },
          ),
        ),
      ),
    );
  }
}
