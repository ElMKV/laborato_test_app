

import 'package:equatable/equatable.dart';
import 'package:laborato_test_app/features/sports_lessons/domain/entities/article.dart';

abstract class LocalWorkoutEvent extends Equatable {
  final ArticleEntity? article;
  const LocalWorkoutEvent({this.article});

  @override
  List<Object?> get props => [article];
}

class GetSavedWorkout extends LocalWorkoutEvent {
  const GetSavedWorkout();
}

class RemoveWorkout extends LocalWorkoutEvent {
  const RemoveWorkout(ArticleEntity article) : super(article: article);
}

class SaveWorkout extends LocalWorkoutEvent {
  const SaveWorkout(ArticleEntity article) : super(article: article);
}
