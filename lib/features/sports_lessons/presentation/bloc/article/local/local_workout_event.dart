import 'package:equatable/equatable.dart';
import 'package:laborato_test_app/features/sports_lessons/domain/entities/workout.dart';

abstract class LocalWorkoutEvent extends Equatable {
  final WorkoutEntity? workout;

  const LocalWorkoutEvent({this.workout});

  @override
  List<Object?> get props => [workout];
}

class GetSavedWorkout extends LocalWorkoutEvent {
  const GetSavedWorkout();
}

class GetSavedWorkoutParam extends LocalWorkoutEvent {
 final int value;

  const GetSavedWorkoutParam(this.value);
}

class RemoveWorkout extends LocalWorkoutEvent {
  const RemoveWorkout(WorkoutEntity workout) : super(workout: workout);
}

class SaveWorkout extends LocalWorkoutEvent {
  const SaveWorkout(WorkoutEntity workout) : super(workout: workout);
}

class TypeChange extends LocalWorkoutEvent {
  final String type;

  const TypeChange(this.type);
}

class LvlChange extends LocalWorkoutEvent {
  final String lvl;

  const LvlChange(this.lvl);
}

class DurationsChange extends LocalWorkoutEvent {
  final String duration;

  const DurationsChange(this.duration);
}

class NameChange extends LocalWorkoutEvent {
  final String name;

  const NameChange(this.name);
}

class DescChange extends LocalWorkoutEvent {
  final String desc;

  const DescChange(this.desc);
}

class RecChange extends LocalWorkoutEvent {
  final String rec;

  const RecChange(this.rec);
}
