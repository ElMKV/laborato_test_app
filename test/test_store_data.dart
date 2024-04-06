import 'package:flutter_test/flutter_test.dart';
import 'package:laborato_test_app/core/constants/strings.dart';
import 'package:laborato_test_app/features/sports_lessons/data/data_sources/local/DAO/article_dao.dart';
import 'package:laborato_test_app/features/sports_lessons/data/data_sources/local/app_database.dart';
import 'package:laborato_test_app/features/sports_lessons/data/models/workout.dart';
import 'package:laborato_test_app/features/sports_lessons/data/repository/workout_repository_impl.dart';
import 'package:laborato_test_app/features/sports_lessons/domain/entities/workout.dart';
import 'package:laborato_test_app/features/sports_lessons/domain/repository/workout_repository.dart';
import 'package:laborato_test_app/features/sports_lessons/domain/usecases/get_saved_workout.dart';
import 'package:laborato_test_app/injection_container.dart';
import 'package:get_it/get_it.dart';

void main() {
  late WorkoutRepositoryImpl localStorage;
  late AppDatabase sl;

  //Workout
  final List<WorkoutModel> workout = [
    WorkoutModel(
        id: 1,
        name: 'test name',
        description: 'test description',
        level: S.lvls.first,
        duration: S.durations.first,
        type: S.types.first,
        recommendation: 'test recommendation')
  ];

  setUp(() async {
    sl = await $FloorAppDatabase.databaseBuilder('app_database.db').build();
    localStorage = WorkoutRepositoryImpl(sl);
  });

  group('should testing database', () {
    test('should save a workout in database', () async {
      await localStorage.saveWorkout(workout.first);
      await localStorage.getSavedWorkouts().then((value) {
        expect(workout, value);
      });
    });
    test('should delete a workout from database', () async {
      await localStorage.removeWorkout(workout.first);
      final List<WorkoutEntity> database =
          await localStorage.getSavedWorkouts();
      expect(database.length, 0);
    });
  });
}
