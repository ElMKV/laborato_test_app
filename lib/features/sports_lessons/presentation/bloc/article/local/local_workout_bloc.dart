

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laborato_test_app/features/sports_lessons/domain/usecases/get_saved_workout.dart';
import 'package:laborato_test_app/features/sports_lessons/domain/usecases/remove_workout.dart';
import 'package:laborato_test_app/features/sports_lessons/domain/usecases/save_workout.dart';
import 'package:laborato_test_app/features/sports_lessons/presentation/bloc/article/local/local_workout_event.dart';
import 'package:laborato_test_app/features/sports_lessons/presentation/bloc/article/local/local_workout_state.dart';

class LocalWorkoutBloc extends Bloc<LocalWorkoutEvent, LocalWorkoutState> {
  final GetSavedWorkoutUseCase _getSavedWorkoutUseCase;
  final SaveWorkoutUseCase _saveWorkoutUseCase;
  final RemoveWorkoutUseCase _removeWorkoutUseCase;

  LocalWorkoutBloc(this._getSavedWorkoutUseCase, this._saveWorkoutUseCase, this._removeWorkoutUseCase)
      : super(const LocalWorkoutLoading()) {
    on<GetSavedWorkout>(onGetSavedWorkout);
    on<RemoveWorkout>(onRemoveWorkout);
    on<SaveWorkout>(onSaveWorkout);
  }

  void onGetSavedWorkout(GetSavedWorkout event, Emitter<LocalWorkoutState> emit) async {
    final workouts = await _getSavedWorkoutUseCase();
    emit(LocalWorkoutDone(workouts));
  }

  void onRemoveWorkout(RemoveWorkout removeWorkout, Emitter<LocalWorkoutState> emit) async {
    await _removeWorkoutUseCase(params: removeWorkout.article);
    final Workout = await _getSavedWorkoutUseCase();
    emit(LocalWorkoutDone(Workout));
  }

  void onSaveWorkout(SaveWorkout saveWorkout, Emitter<LocalWorkoutState> emit) async {
    await _saveWorkoutUseCase(params: saveWorkout.article);
    final Workout = await _getSavedWorkoutUseCase();
    emit(LocalWorkoutDone(Workout));
  }
}
