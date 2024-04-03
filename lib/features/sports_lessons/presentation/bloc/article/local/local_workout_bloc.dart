

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laborato_test_app/features/sports_lessons/domain/entities/article.dart';
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
    WorkoutEntity workoutEntity = WorkoutEntity(id: 3, name: 'Спина', description: 'Приложение должно иметь минимум два экрана: один для отображения списка упражнений и один для добавления/редактирования упражнения Приложение должно иметь минимум два экрана: один для отображения списка упражнений и один для добавления/редактирования упражнения. Приложение должно иметь минимум два экрана: один для отображения списка упражнений и один для добавления/редактирования упражнения Приложение должно иметь минимум два экрана: один для отображения списка упражнений и один для добавления/редактирования упражнения.', type: 'Кардио', level: 'Начальный', duration: '1 час', recommendation: '5 раз по 5');

    await _saveWorkoutUseCase(params: workoutEntity);

    final workouts = await _getSavedWorkoutUseCase();
    emit(LocalWorkoutDone(workouts));
  }

  void onRemoveWorkout(RemoveWorkout removeWorkout, Emitter<LocalWorkoutState> emit) async {
    await _removeWorkoutUseCase(params: removeWorkout.workout);
    final Workout = await _getSavedWorkoutUseCase();
    emit(LocalWorkoutDone(Workout));
  }

  void onSaveWorkout(SaveWorkout saveWorkout, Emitter<LocalWorkoutState> emit) async {
    await _saveWorkoutUseCase(params: saveWorkout.workout);
    final Workout = await _getSavedWorkoutUseCase();
    emit(LocalWorkoutDone(Workout));
  }
}
