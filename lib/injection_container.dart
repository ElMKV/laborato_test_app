import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:laborato_test_app/features/sports_lessons/data/data_sources/local/app_database.dart';
import 'package:laborato_test_app/features/sports_lessons/data/repository/workout_repository_impl.dart';
import 'package:laborato_test_app/features/sports_lessons/domain/repository/workout_repository.dart';
import 'package:laborato_test_app/features/sports_lessons/domain/usecases/get_saved_workout.dart';
import 'package:laborato_test_app/features/sports_lessons/domain/usecases/remove_workout.dart';
import 'package:laborato_test_app/features/sports_lessons/domain/usecases/save_workout.dart';
import 'package:laborato_test_app/features/sports_lessons/presentation/bloc/article/local/local_workout_bloc.dart';


final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  final database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  sl.registerSingleton<AppDatabase>(database);
  // Dio
  sl.registerSingleton<Dio>(Dio());


  // Repository
  sl.registerLazySingleton<WorkoutRepository>(() => WorkoutRepositoryImpl(sl()));

  // Use cases

  sl.registerLazySingleton(() => GetSavedWorkoutUseCase(sl()));

  sl.registerLazySingleton(() => SaveWorkoutUseCase(sl()));

  sl.registerLazySingleton(() => RemoveWorkoutUseCase(sl()));

  // Blocs

  sl.registerFactory<LocalWorkoutBloc>(() => LocalWorkoutBloc(sl(), sl(), sl()));
}
