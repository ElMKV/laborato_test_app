import 'package:laborato_test_app/features/sports_lessons/domain/entities/article.dart';

abstract class WorkoutRepository {
  // Database Methods
  Future<List<ArticleEntity>> getSavedWorkouts();

  Future<void> saveWorkout(ArticleEntity article);

  Future<void> removeWorkout(ArticleEntity article);
}
