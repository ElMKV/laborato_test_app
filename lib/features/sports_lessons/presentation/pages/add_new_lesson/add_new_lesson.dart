import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ionicons/ionicons.dart';
import 'package:laborato_test_app/core/constants/strings.dart';
import 'package:selector_wheel/selector_wheel.dart';
import '../../../../../injection_container.dart';
import '../../../domain/entities/workout.dart';
import '../../bloc/article/local/local_workout_bloc.dart';
import '../../bloc/article/local/local_workout_event.dart';
import '../../bloc/article/local/local_workout_state.dart';

class AddNewLesson extends HookWidget {
  const AddNewLesson({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<LocalWorkoutBloc>(),
      child: Scaffold(
        appBar: _buildAppBar(),
        body: BlocBuilder<LocalWorkoutBloc, LocalWorkoutState>(
          builder: (context, state) {
            return _buildForm(context, state);
          },
        ),
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
      title:
          const Text(S.add_new_workouts, style: TextStyle(color: Colors.black)),
    );
  }

  Widget _buildForm(context, LocalWorkoutState state) {
    Size size = MediaQuery.of(context).size;
    double width = size.width;
    double height = size.height;
    return Container(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                decoration: const InputDecoration(hintText: S.name),
                onChanged: (value) {
                  _nameChange(context, value);
                },
              ),
              TextField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: const InputDecoration(hintText: S.desc),
                onChanged: (value) {
                  _descChange(context, value);
                },
              ),
              TextField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: const InputDecoration(hintText: S.recommendation),
                onChanged: (value) {
                  _recChange(context, value);
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //type workout
                  const FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(
                      S.type,
                    ),
                  ),
                  SizedBox(
                      height: 50,
                      child: SelectorWheel(
                        width: 70,
                        childHeight: 26,

                        childCount: state.pageState.typeWorkout.length,
                        convertIndexToValue: (int index) {
                          List<String> type = state.pageState.typeWorkout;
                          final value = type[index];
                          return SelectorWheelValue(
                              label: value, value: value, index: index);
                        },
                        onValueChanged: (SelectorWheelValue<String> value) {
                          _onTypeChange(context, value);
                        },
                      )),
                  //lvl workout
                  const FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(
                      S.lvl,
                    ),
                  ),
                  SizedBox(
                      height: 50,
                      child: SelectorWheel(
                        childHeight: 26,
                        width: 120.0,
                        childCount: state.pageState.lvlWorkout.length,
                        highlightBorderRadius: BorderRadius.circular(4),
                        convertIndexToValue: (int index) {
                          List<String> lvl = state.pageState.lvlWorkout;

                          final value = lvl[index];

                          return SelectorWheelValue(
                              label: value, value: value, index: index);
                        },
                        onValueChanged: (SelectorWheelValue<String> value) {
                          _onLvlChange(context, value);
                        },
                      )),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              //duration workout
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(
                      S.duration,
                    ),
                  ),
                  SizedBox(
                      height: 50,
                      child: SelectorWheel(
                        childHeight: 26,
                        width: 100.0,
                        childCount: state.pageState.durationWorkout.length,
                        convertIndexToValue: (int index) {
                          List<String> durationWorkout =
                              state.pageState.durationWorkout;

                          final value = durationWorkout[index];

                          return SelectorWheelValue(
                              label: value, value: value, index: index);
                        },
                        onValueChanged: (SelectorWheelValue<String> value) {
                          _onDurationsChange(context, value);
                        },
                      )),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              CupertinoButton(
                onPressed: () {
                  _onSaveButtonTapped(context);
                },
                color: Colors.black,
                child: const Text(S.save),
              )
            ],
          ),
        ));
  }

  void _onSaveButtonTapped(context) {
    BlocProvider.of<LocalWorkoutBloc>(context)
        .add(const SaveWorkout(WorkoutEntity()));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        backgroundColor: Colors.black,
        content: Text(S.save_success),
      ),
    );
  }

  void _onTypeChange(context, SelectorWheelValue<String> value) {
    BlocProvider.of<LocalWorkoutBloc>(context).add(TypeChange(value.value));
  }

  void _onLvlChange(context, SelectorWheelValue<String> value) {
    BlocProvider.of<LocalWorkoutBloc>(context).add(LvlChange(value.value));
  }

  void _onDurationsChange(context, SelectorWheelValue<String> value) {
    BlocProvider.of<LocalWorkoutBloc>(context)
        .add(DurationsChange(value.value));
  }

  void _nameChange(context, String value) {
    BlocProvider.of<LocalWorkoutBloc>(context).add(NameChange(value));
  }

  void _descChange(context, String value) {
    BlocProvider.of<LocalWorkoutBloc>(context).add(DescChange(value));
  }

  void _recChange(context, String value) {
    BlocProvider.of<LocalWorkoutBloc>(context).add(RecChange(value));
  }
}

void _onBackButtonTapped(BuildContext context) {
  // pushNamed is trigger to get local store
  Navigator.pushNamed(context, '/');
}
