import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_work/core/style.dart';
import 'package:test_work/cubits/home/home_cubit.dart';

import '../dummy/dummy_screen.dart';
import '../error/error_screen.dart';
import '../loading/loading_screen.dart';
import '../web_view/web_view_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeScreenCubit>
      (create: (_) => HomeScreenCubit(),
    child: BlocBuilder<HomeScreenCubit, HomeScreenState>(
      builder: (context,state){
        switch (state.stage){
          case HomeScreenStage.loading :
            return const LoadingScreen();
          case HomeScreenStage.dummy :
            return const DummyScreen();
          case HomeScreenStage.webView:
            return  WebViewScreen(url: state.url!,);
          case HomeScreenStage.error:
            return  ErrorScreen(errorMessage: state.errorMessage!,);
        }

      },
    ),);
  }
}
