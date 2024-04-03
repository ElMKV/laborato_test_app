

import 'package:equatable/equatable.dart';
import 'package:laborato_test_app/features/sports_lessons/domain/entities/article.dart';

abstract class LocalWorkoutEvent extends Equatable {
  final WorkoutEntity? workout;
  const LocalWorkoutEvent({this.workout});

  @override
  List<Object?> get props => [workout];
}

class GetSavedWorkout extends LocalWorkoutEvent {
  const GetSavedWorkout();
}

class RemoveWorkout extends LocalWorkoutEvent {
  const RemoveWorkout(WorkoutEntity workout) : super(workout: workout);
}

class SaveWorkout extends LocalWorkoutEvent {
  const SaveWorkout(WorkoutEntity workout) : super(workout: workout);
}
