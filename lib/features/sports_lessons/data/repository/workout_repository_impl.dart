import 'package:laborato_test_app/features/sports_lessons/data/data_sources/local/app_database.dart';
import 'package:laborato_test_app/features/sports_lessons/data/models/workout.dart';
import 'package:laborato_test_app/features/sports_lessons/domain/entities/workout.dart';
import 'package:laborato_test_app/features/sports_lessons/domain/repository/workout_repository.dart';


class WorkoutRepositoryImpl implements WorkoutRepository {
  final AppDatabase _appDatabase;
  WorkoutRepositoryImpl(this._appDatabase);


  @override
  Future<List<WorkoutEntity>> getSavedWorkouts() async {
    return _appDatabase.workoutDao.getWorkout();
  }

  @override
  Future<void> removeWorkout(WorkoutEntity workout) {
    return _appDatabase.workoutDao.deleteWorkout(WorkoutModel.fromEntity(workout));
  }

  @override
  Future<void> saveWorkout(WorkoutEntity workout) {
    return _appDatabase.workoutDao.insertWorkout(WorkoutModel.fromEntity(workout));
  }
}
