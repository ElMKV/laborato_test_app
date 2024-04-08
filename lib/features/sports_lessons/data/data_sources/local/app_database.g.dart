// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  WorkoutDao? _workoutDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `workout` (`id` INTEGER, `name` TEXT, `description` TEXT, `type` TEXT, `level` TEXT, `duration` TEXT, `recommendation` TEXT, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  WorkoutDao get workoutDao {
    return _workoutDaoInstance ??= _$WorkoutDao(database, changeListener);
  }
}

class _$WorkoutDao extends WorkoutDao {
  _$WorkoutDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _workoutModelInsertionAdapter = InsertionAdapter(
            database,
            'workout',
            (WorkoutModel item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'description': item.description,
                  'type': item.type,
                  'level': item.level,
                  'duration': item.duration,
                  'recommendation': item.recommendation
                }),
        _workoutModelDeletionAdapter = DeletionAdapter(
            database,
            'workout',
            ['id'],
            (WorkoutModel item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'description': item.description,
                  'type': item.type,
                  'level': item.level,
                  'duration': item.duration,
                  'recommendation': item.recommendation
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<WorkoutModel> _workoutModelInsertionAdapter;

  final DeletionAdapter<WorkoutModel> _workoutModelDeletionAdapter;

  @override
  Future<List<WorkoutModel>> getWorkout() async {
    return _queryAdapter.queryList('SELECT * FROM workout',
        mapper: (Map<String, Object?> row) => WorkoutModel(
            id: row['id'] as int?,
            name: row['name'] as String?,
            description: row['description'] as String?,
            type: row['type'] as String?,
            level: row['level'] as String?,
            duration: row['duration'] as String?,
            recommendation: row['recommendation'] as String?));
  }

  @override
  Future<List<WorkoutModel>> getWorkoutParam(String value) async {
    return _queryAdapter.queryList('SELECT * FROM workout WHERE level = ?1',
        mapper: (Map<String, Object?> row) => WorkoutModel(
            id: row['id'] as int?,
            name: row['name'] as String?,
            description: row['description'] as String?,
            type: row['type'] as String?,
            level: row['level'] as String?,
            duration: row['duration'] as String?,
            recommendation: row['recommendation'] as String?),
        arguments: [value]);
  }

  @override
  Future<void> insertWorkout(WorkoutModel workout) async {
    await _workoutModelInsertionAdapter.insert(
        workout, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteWorkout(WorkoutModel workout) async {
    await _workoutModelDeletionAdapter.delete(workout);
  }
}
