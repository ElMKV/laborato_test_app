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
import '../../widgets/article_tile.dart';

class SavedWorkouts extends HookWidget {
  const SavedWorkouts({Key ? key}) : super(key: key);

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
      actions: [
        Builder(
          builder: (context) => GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => _onAddPressed(context),
            child: Padding(
              padding: const EdgeInsets.only(right: 18.0),
              child: const Icon(Ionicons.add, color: Colors.black),
            ),
          ),
        ),
      ],
      title: const Text(S.saved_workouts, style: TextStyle(color: Colors.black)),
    );
  }

  Widget _buildBody() {
    return BlocBuilder<LocalWorkoutBloc, LocalWorkoutState>(
      builder: (context, state) {
        if (state is LocalWorkoutLoading) {
          return const Center(child: CupertinoActivityIndicator());
        } else if (state is LocalWorkoutDone) {
          return _buildArticlesList(state.articles!);
        }
        return Container();
      },
    );
  }

  Widget _buildArticlesList(List<ArticleEntity> articles) {
    if (articles.isEmpty) {
      return const Center(
          child: Text(
        S.no_saved_workouts,
        style: TextStyle(color: Colors.black),
      ));
    }

    return ListView.builder(
      itemCount: articles.length,
      itemBuilder: (context, index) {
        return WorkoutsWidget(
          article: articles[index],
          isRemovable: true,
          onRemove: (article) => _onRemoveArticle(context, article),
        );
      },
    );
  }

  void _onAddPressed(BuildContext context) {
    Navigator.pushNamed(context, '/AddLesson');
  }
  void _onRemoveArticle(BuildContext context, ArticleEntity article) {
    BlocProvider.of<LocalWorkoutBloc>(context).add(RemoveWorkout(article));
  }
}
