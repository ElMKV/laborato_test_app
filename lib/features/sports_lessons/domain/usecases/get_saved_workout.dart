
import 'package:laborato_test_app/core/usecase/usecase.dart';
import 'package:laborato_test_app/features/sports_lessons/domain/entities/article.dart';
import 'package:laborato_test_app/features/sports_lessons/domain/repository/workout_repository.dart';

class GetSavedWorkoutUseCase implements UseCase<List<ArticleEntity>, void> {
  final WorkoutRepository _workoutRepository;

  GetSavedWorkoutUseCase(this._workoutRepository);
  @override
  Future<List<ArticleEntity>> call({void params}) {
    return _workoutRepository.getSavedWorkouts();
  }
}
