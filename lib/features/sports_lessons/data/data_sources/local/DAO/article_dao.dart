import 'package:floor/floor.dart';
import 'package:laborato_test_app/features/sports_lessons/data/models/article.dart';

@dao
abstract class ArticleDao {
  @Insert()
  Future<void> insertArticle(ArticleModel article);

  @delete
  Future<void> deleteArticle(ArticleModel article);

  @Query('SELECT * FROM articles')
  Future<List<ArticleModel>> getArticles();
}
