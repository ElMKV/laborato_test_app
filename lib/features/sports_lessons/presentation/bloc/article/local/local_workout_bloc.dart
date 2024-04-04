import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laborato_test_app/core/constants/strings.dart';
import 'package:laborato_test_app/features/sports_lessons/domain/entities/workout.dart';
import 'package:laborato_test_app/features/sports_lessons/domain/usecases/get_saved_workout.dart';
import 'package:laborato_test_app/features/sports_lessons/domain/usecases/remove_workout.dart';
import 'package:laborato_test_app/features/sports_lessons/domain/usecases/save_workout.dart';
import 'package:laborato_test_app/features/sports_lessons/presentation/bloc/article/local/local_workout_event.dart';
import 'package:laborato_test_app/features/sports_lessons/presentation/bloc/article/local/local_workout_state.dart';

class LocalWorkoutBloc extends Bloc<LocalWorkoutEvent, LocalWorkoutState> {
  final GetSavedWorkoutUseCase _getSavedWorkoutUseCase;
  final SaveWorkoutUseCase _saveWorkoutUseCase;
  final RemoveWorkoutUseCase _removeWorkoutUseCase;

  LocalWorkoutBloc(this._getSavedWorkoutUseCase, this._saveWorkoutUseCase,
      this._removeWorkoutUseCase)
      : super(LocalWorkoutLoading(PageState(
            type: S.types.first,
            lvl: S.lvls.first,
            durations: S.durations.first))) {
    on<GetSavedWorkout>(onGetSavedWorkout);
    on<RemoveWorkout>(onRemoveWorkout);
    on<SaveWorkout>(onSaveWorkout);
    on<TypeChange>(onTypeChange);
    on<LvlChange>(onLvlChange);
    on<DurationsChange>(onDurationsChange);
    on<NameChange>(onNameChange);
    on<DescChange>(onDescChange);
    on<RecChange>(onRecChange);
  }

  void onGetSavedWorkout(
      GetSavedWorkout event, Emitter<LocalWorkoutState> emit) async {
    final workout = await _getSavedWorkoutUseCase();
    emit(LocalWorkoutDone(state.pageState.copyWith(workout: workout)));
  }

  void onRemoveWorkout(
      RemoveWorkout removeWorkout, Emitter<LocalWorkoutState> emit) async {
    await _removeWorkoutUseCase(params: removeWorkout.workout);
    final workout = await _getSavedWorkoutUseCase();
    emit(LocalWorkoutDone(state.pageState.copyWith(workout: workout)));
  }

  void onSaveWorkout(
      SaveWorkout saveWorkout, Emitter<LocalWorkoutState> emit) async {
    await _saveWorkoutUseCase(
        params: WorkoutEntity(
            name: state.pageState.name,
            description: state.pageState.desc,
            level: state.pageState.lvl,
            duration: state.pageState.durations,
            type: state.pageState.type,
            recommendation: state.pageState.rec));
    final workout = await _getSavedWorkoutUseCase();
    emit(LocalWorkoutDone(state.pageState.copyWith(workout: workout)));
  }

  void onTypeChange(TypeChange onTypeChange, Emitter<LocalWorkoutState> emit) {
    emit(LocalWorkoutDone(state.pageState.copyWith(type: onTypeChange.type)));
  }

  void onLvlChange(LvlChange onLvlChange, Emitter<LocalWorkoutState> emit) {
    emit(LocalWorkoutDone(state.pageState.copyWith(lvl: onLvlChange.lvl)));
  }

  void onDurationsChange(
      DurationsChange onDurationsChange, Emitter<LocalWorkoutState> emit) {
    emit(LocalWorkoutDone(
        state.pageState.copyWith(durations: onDurationsChange.duration)));
  }

  void onNameChange(
      NameChange onNameChange, Emitter<LocalWorkoutState> emit) {
    print(onNameChange.name);
    emit(LocalWorkoutDone(
        state.pageState.copyWith(name: onNameChange.name)));
  }

  void onDescChange(
      DescChange onDescChange, Emitter<LocalWorkoutState> emit) {
    emit(LocalWorkoutDone(
        state.pageState.copyWith(desc: onDescChange.desc)));
  }

  void onRecChange(
      RecChange onRecChange, Emitter<LocalWorkoutState> emit) {
    emit(LocalWorkoutDone(
        state.pageState.copyWith(rec: onRecChange.rec)));
  }
}
