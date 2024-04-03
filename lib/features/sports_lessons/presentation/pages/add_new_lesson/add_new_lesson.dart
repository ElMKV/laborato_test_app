import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ionicons/ionicons.dart';
import 'package:laborato_test_app/core/constants/strings.dart';
import '../../../../../injection_container.dart';
import '../../../domain/entities/article.dart';
import '../../bloc/article/local/local_workout_bloc.dart';
import '../../bloc/article/local/local_workout_event.dart';
import '../../bloc/article/local/local_workout_state.dart';
import '../../widgets/workout_tile.dart';

class AddNewLesson extends HookWidget {
  const AddNewLesson({Key ? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<LocalWorkoutBloc>()..add(const GetSavedWorkout()),
      child: Scaffold(
        appBar: _buildAppBar(),
        body: _buildBody(),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      leading: Builder(
        builder: (context) => GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => _onBackButtonTapped(context),
          child: const Icon(Ionicons.chevron_back, color: Colors.black),
        ),
      ),
      title: const Text(S.add_new_workouts, style: TextStyle(color: Colors.black)),
    );
  }

  Widget _buildBody() {
    return BlocBuilder<LocalWorkoutBloc, LocalWorkoutState>(
      builder: (context, state) {
        if (state is LocalWorkoutLoading) {
          return const Center(child: CupertinoActivityIndicator());
        } else if (state is LocalWorkoutDone) {
          return _buildArticlesList(state.workout!);
        }
        return Container();
      },
    );
  }

  Widget _buildArticlesList(List<WorkoutEntity> workout) {
    return Text('form');
  }

  void _onBackButtonTapped(BuildContext context) {
    Navigator.pop(context);
  }

}
