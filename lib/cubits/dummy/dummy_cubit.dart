import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_work/core/consts/app_consts.dart';

import '../../core/api/client.dart';
import 'dummy_state.dart';

class DummyScreenCubit extends Cubit<DummyScreenState> {
  DummyScreenCubit()
      : super(const DummyScreenState(stage: DummyScreenStage.loading)) {
    load();
  }

  load() async {
    final NewsApi api = NewsApi(Dio());
    final response = await api.fetchNews();
    if(response != null){
      emit(state.copyWith(stage: DummyScreenStage.display,articles: response.articles ?? []));
    }

  }

}


