import 'package:laborato_test_app/features/sports_lessons/domain/entities/workout.dart';

abstract class WorkoutRepository {
  // Database Methods
  Future<List<WorkoutEntity>> getSavedWorkouts();

  Future<List<WorkoutEntity>> getSavedWorkoutsParam(String value);

  Future<void> saveWorkout(WorkoutEntity workout);

  Future<void> removeWorkout(WorkoutEntity workout);
}
