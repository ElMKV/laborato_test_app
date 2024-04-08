import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ionicons/ionicons.dart';
import 'package:laborato_test_app/core/constants/strings.dart';
import '../../../../../injection_container.dart';
import '../../../domain/entities/workout.dart';
import '../../bloc/article/local/local_workout_bloc.dart';
import '../../bloc/article/local/local_workout_event.dart';
import '../../bloc/article/local/local_workout_state.dart';
import '../../widgets/workout_tile.dart';

class SavedWorkouts extends HookWidget {
  const SavedWorkouts({Key? key}) : super(key: key);

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
      automaticallyImplyLeading: false,
      actions: [
        Builder(
          builder: (context) => GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => _onAddPressed(context),
            child: const Padding(
              padding: EdgeInsets.only(right: 18.0),
              child: Icon(Ionicons.add, color: Colors.black),
            ),
          ),
        ),
      ],
      title: const Text(S.app_name, style: TextStyle(color: Colors.black)),
    );
  }

  Widget _buildBody() {
    return BlocBuilder<LocalWorkoutBloc, LocalWorkoutState>(
      builder: (context, state) {
        if (state is LocalWorkoutLoading) {
          return const Center(child: CupertinoActivityIndicator());
        } else if (state is LocalWorkoutDone) {
          return Column(
            children: [
              _buildChips(state),
              _buildWorkoutList(state.pageState.workout!, state),
            ],
          );
        }
        return Container();
      },
    );
  }

  Widget _buildChips(LocalWorkoutState state) {
    return Center(
      child: SizedBox(
        height: 100,
        child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: state.pageState.lvlWorkout.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: InputChip(
                  onSelected: (bool value) {
                    _onChipPressed(context, value, index);
                  },
                  label: Text(
                    state.pageState.lvlWorkout[index],
                    style: TextStyle(
                        color: state.pageState.indexChip == index
                            ? Colors.white
                            : Colors.black),
                  ),
                  backgroundColor: state.pageState.indexChip == index
                      ? Colors.black
                      : Colors.white,
                ),
              );
            }),
      ),
    );
  }

  Widget _buildWorkoutList(
      List<WorkoutEntity> workout, LocalWorkoutState state) {
    if (workout.isEmpty) {
      return const Text(
        S.no_saved_workouts,
        style: TextStyle(color: Colors.black),
      );
    }
    return Expanded(
      child: ListView.builder(
        itemCount: workout.length,
        itemBuilder: (context, index) {
         return WorkoutsWidget(
           workout: workout[index],
           onRemove: (workout) => _onRemoveWorkout(context, workout),
           id: index,
         );
        },
      ),
    );
  }

  void _onAddPressed(BuildContext context) {
    Navigator.pushNamed(context, '/AddLesson');
  }

  void _onRemoveWorkout(BuildContext context, WorkoutEntity workout) {
    BlocProvider.of<LocalWorkoutBloc>(context).add(RemoveWorkout(workout));
  }

  void _onChipPressed(BuildContext context, bool value, int index) {
    BlocProvider.of<LocalWorkoutBloc>(context).add(GetSavedWorkoutParam(index));
  }
}
