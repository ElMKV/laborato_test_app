import 'package:flutter/material.dart';
import 'package:laborato_test_app/features/sports_lessons/presentation/pages/add_new_lesson/add_new_lesson.dart';
import 'package:laborato_test_app/features/sports_lessons/presentation/pages/saved_workout/saved_workout.dart';

class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {

      case '/':
        return _materialRoute(const SavedWorkouts());
      case '/AddLesson':
        return _materialRoute(const AddNewLesson());

      default:
        return _materialRoute(const SavedWorkouts());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
