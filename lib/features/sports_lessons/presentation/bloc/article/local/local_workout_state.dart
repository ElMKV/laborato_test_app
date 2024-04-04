import 'package:equatable/equatable.dart';
import 'package:laborato_test_app/core/constants/strings.dart';

import '../../../../domain/entities/workout.dart';

abstract class LocalWorkoutState {
  final PageState pageState;

  const LocalWorkoutState(this.pageState);
}

class LocalWorkoutLoading extends LocalWorkoutState {
  const LocalWorkoutLoading(PageState pageState) : super(pageState);
}

class LocalWorkoutDone extends LocalWorkoutState {
  const LocalWorkoutDone(PageState pageState) : super(pageState);
}

class PageState {
  final List<WorkoutEntity>? workout;
  final List<String> typeWorkout = S.types;
  final List<String> lvlWorkout = S.lvls;
  final List<String> durationWorkout = S.durations;

  final String? name;
  final String? desc;
  final String? rec;

  final String? type;
  final String? lvl;

  final String? durations;

  PageState({
    this.workout = const [],
    this.type,
    this.lvl,
    this.durations,
    this.name,
    this.desc,
    this.rec,
  });

  PageState copyWith({
    List<WorkoutEntity>? workout,
    String? type,
    String? lvl,
    String? durations,
    String? name,
    String? desc,
    String? rec,
  }) {
    return PageState(
      workout: workout ?? this.workout,
      type: type ?? this.type,
      lvl: lvl ?? this.lvl,
      durations: durations ?? this.durations,
      name: name ?? this.name,
      desc: desc ?? this.desc,
      rec: rec ?? this.rec,
    );
  }
}
