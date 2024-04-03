import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laborato_test_app/config/routes/routes.dart';
import 'package:laborato_test_app/config/theme/app_themes.dart';
import 'package:laborato_test_app/core/constants/strings.dart';
import 'package:laborato_test_app/features/sports_lessons/presentation/bloc/article/local/local_workout_bloc.dart';
import 'package:laborato_test_app/features/sports_lessons/presentation/bloc/article/local/local_workout_event.dart';
import 'package:laborato_test_app/features/sports_lessons/presentation/pages/saved_article/saved_article.dart';

import 'injection_container.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LocalWorkoutBloc>(
      create: (context) => sl()..add(const GetSavedWorkout()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme(),
        title: S.app_name,
        onGenerateRoute: AppRoutes.onGenerateRoutes,
        home: const SavedWorkouts(),
      ),
    );
  }
}
