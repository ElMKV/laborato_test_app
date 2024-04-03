import 'package:laborato_test_app/features/sports_lessons/data/data_sources/local/app_database.dart';
import 'package:laborato_test_app/features/sports_lessons/data/models/article.dart';
import 'package:laborato_test_app/features/sports_lessons/domain/entities/article.dart';
import 'package:laborato_test_app/features/sports_lessons/domain/repository/workout_repository.dart';


class WorkoutRepositoryImpl implements WorkoutRepository {
  final AppDatabase _appDatabase;
  WorkoutRepositoryImpl(this._appDatabase);


  @override
  Future<List<ArticleEntity>> getSavedWorkouts() async {
    return _appDatabase.articleDao.getArticles();
  }

  @override
  Future<void> removeWorkout(ArticleEntity article) {
    return _appDatabase.articleDao.deleteArticle(ArticleModel.fromEntity(article));
  }

  @override
  Future<void> saveWorkout(ArticleEntity article) {
    return _appDatabase.articleDao.insertArticle(ArticleModel.fromEntity(article));
  }
}
