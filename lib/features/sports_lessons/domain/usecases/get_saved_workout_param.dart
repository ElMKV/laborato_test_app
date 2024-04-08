import 'package:laborato_test_app/core/usecase/usecase.dart';
import 'package:laborato_test_app/features/sports_lessons/domain/entities/workout.dart';
import 'package:laborato_test_app/features/sports_lessons/domain/repository/workout_repository.dart';

class GetSavedWorkoutParamUseCase implements UseCase<void, String> {
  final WorkoutRepository _workoutRepository;

  GetSavedWorkoutParamUseCase(this._workoutRepository);
  @override
  Future<List<WorkoutEntity>> call({String? params}) {
    return _workoutRepository.getSavedWorkoutsParam(params!);
  }
}
