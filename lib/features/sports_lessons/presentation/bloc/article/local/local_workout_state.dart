import 'package:equatable/equatable.dart';

import '../../../../domain/entities/article.dart';

abstract class LocalWorkoutState extends Equatable {
  final List<ArticleEntity>? articles;

  const LocalWorkoutState({this.articles});

  @override
  List<Object> get props => [articles!];
}

class LocalWorkoutLoading extends LocalWorkoutState {
  const LocalWorkoutLoading();
}

class LocalWorkoutDone extends LocalWorkoutState {
  const LocalWorkoutDone(List<ArticleEntity> articles) : super(articles: articles);
}
