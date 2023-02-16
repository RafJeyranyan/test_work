import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_work/core/style.dart';
import 'package:test_work/view/loading/loading_screen.dart';

import '../../core/api/entities.dart';
import '../../cubits/dummy/dummy_cubit.dart';
import '../../cubits/dummy/dummy_state.dart';
import 'articles/article_card.dart';
import 'articles/article_screen.dart';

class DummyScreen extends StatelessWidget {
  const DummyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DummyScreenCubit>(
        create: (_) => DummyScreenCubit(),
        child: BlocBuilder<DummyScreenCubit, DummyScreenState>(
          builder: (context, state) {
            switch (state.stage) {
              case DummyScreenStage.loading:
                return const LoadingScreen();
              case DummyScreenStage.display:
                return DisplayDummyScreen(
                  articles: state.articles!,
                );
            }
          },
        ));
  }
}

class DisplayDummyScreen extends StatelessWidget {
  final List<Articles> articles;

  const DisplayDummyScreen({Key? key, required this.articles})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: ListView.builder(
            itemCount: articles.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                ArticleScreen(article: articles[index])));
                      },
                      child: ArticleCard(
                        article: articles[index],
                      )),
                  const Divider(
                    thickness: 3,
                  ),
                ],
              );
            }),
      ),
    );
  }
}
