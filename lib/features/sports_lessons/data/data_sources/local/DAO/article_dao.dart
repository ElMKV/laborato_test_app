import 'package:floor/floor.dart';
import 'package:laborato_test_app/features/sports_lessons/data/models/workout.dart';

@dao
abstract class WorkoutDao {
  @Insert()
  Future<void> insertWorkout(WorkoutModel workout);

  @delete
  Future<void> deleteWorkout(WorkoutModel workout);

  @Query('SELECT * FROM workout')
  Future<List<WorkoutModel>> getWorkout();
}
