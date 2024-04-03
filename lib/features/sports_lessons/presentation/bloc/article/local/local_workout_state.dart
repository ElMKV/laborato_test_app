import 'package:equatable/equatable.dart';

import '../../../../domain/entities/article.dart';

abstract class LocalWorkoutState extends Equatable {
  final List<WorkoutEntity>? workout;

  const LocalWorkoutState({this.workout});

  @override
  List<Object> get props => [workout!];
}

class LocalWorkoutLoading extends LocalWorkoutState {
  const LocalWorkoutLoading();
}

class LocalWorkoutDone extends LocalWorkoutState {
  const LocalWorkoutDone(List<WorkoutEntity> workout) : super(workout: workout);
}
