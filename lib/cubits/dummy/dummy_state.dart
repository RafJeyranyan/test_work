import 'package:equatable/equatable.dart';

import '../../core/api/entities.dart';

enum DummyScreenStage {
  loading,
  display,
  // error,
}

class DummyScreenState extends Equatable {
  final DummyScreenStage stage;
  final List<Articles>? articles;

  const DummyScreenState({required this.stage, this.articles});

  DummyScreenState copyWith({DummyScreenStage? stage, List<Articles>? articles}) {
    return DummyScreenState(
      stage: stage ?? this.stage,
      articles: articles ?? this.articles,
    );
  }

  @override
  List<Object?> get props => [stage, articles];
}
