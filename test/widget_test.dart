import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:laborato_test_app/core/constants/strings.dart';
import 'package:laborato_test_app/features/sports_lessons/data/models/workout.dart';
import 'package:laborato_test_app/features/sports_lessons/presentation/widgets/workout_tile.dart';

void main() {
  testWidgets('finds a Text widgets', (tester) async {
    final List<WorkoutModel> workout = [
      WorkoutModel(
          id: 1,
          name: 'test name',
          description: 'test description',
          level: S.lvls.first,
          duration: S.durations.first,
          type: S.types.first,
          recommendation: 'test recommendation')
    ];
    // Build an App with a Text widget that displays the letter 'H'.
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
          body: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          return WorkoutsWidget(
            workout: workout[index],
            id: index,
          );
        },
      )),
    ));

    // Find a widget that displays the letter 'H'.
    expect(find.text(workout.first.name!), findsOneWidget);
    expect(find.text(workout.first.description!), findsOneWidget);
    expect(find.text(workout.first.level!), findsOneWidget);
    expect(find.text(workout.first.duration!), findsOneWidget);
    expect(find.text(workout.first.type!), findsOneWidget);
    expect(find.text(workout.first.recommendation!), findsOneWidget);
  });
}
