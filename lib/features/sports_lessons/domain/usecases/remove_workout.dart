import 'package:laborato_test_app/core/usecase/usecase.dart';
import 'package:laborato_test_app/features/sports_lessons/domain/entities/workout.dart';
import 'package:laborato_test_app/features/sports_lessons/domain/repository/workout_repository.dart';

class RemoveWorkoutUseCase implements UseCase<void, WorkoutEntity> {
  final WorkoutRepository _workoutRepository;

  RemoveWorkoutUseCase(this._workoutRepository);
  @override
  Future<void> call({WorkoutEntity? params}) {
    return _workoutRepository.removeWorkout(params!);
  }
}
