import 'package:floor/floor.dart';
import 'package:laborato_test_app/features/sports_lessons/data/data_sources/local/DAO/article_dao.dart';
import 'package:laborato_test_app/features/sports_lessons/data/models/article.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'dart:async';
part 'app_database.g.dart';

@Database(version: 1, entities: [ArticleModel])
abstract class AppDatabase extends FloorDatabase {
  ArticleDao get articleDao;
}
