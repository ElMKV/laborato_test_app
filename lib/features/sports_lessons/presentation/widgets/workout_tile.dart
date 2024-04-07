import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:laborato_test_app/core/constants/strings.dart';
import '../../domain/entities/workout.dart';

class WorkoutsWidget extends StatelessWidget {
  final WorkoutEntity? workout;
  final void Function(WorkoutEntity workout)? onRemove;

  const WorkoutsWidget({
    Key? key,
    this.workout,
    this.onRemove,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 2,
        child: Container(
          padding: const EdgeInsetsDirectional.only(
              start: 14, end: 14, bottom: 10, top: 10),
          height: MediaQuery.of(context).size.height/2,
          child: Row(
            children: [
              _buildTitleAndDescription(),
              _buildRemovableArea(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTitleAndDescription() {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Name
          Expanded(
            child: Text(
              workout!.name ?? '',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w200),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Text(S.desc, style: TextStyle(fontWeight: FontWeight.bold),),
          // Description
          Expanded(
            flex: 2,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  workout!.description ?? '',
                ),
              ),
            ),
          ),
          Text(S.recommendation, style: TextStyle(fontWeight: FontWeight.bold),),
          Expanded(
            flex: 2,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  workout!.recommendation ?? '',
                ),
              ),
            ),
          ),

          // Datetime
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Icon(Icons.info_outlined, size: 18),
                Text(
                  workout!.type ?? '--',
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                ),
                const Icon(Icons.timeline_outlined, size: 18),
                Text(
                  workout!.level ?? '--',
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                ),
                const Icon(Icons.schedule_outlined, size: 18),
                Text(
                  workout!.duration ?? '--',
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRemovableArea() {
      return GestureDetector(
        onTap: _onRemove,
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Icon(Icons.remove_circle_outline, color: Colors.red),
        ),
      );

  }

  void _onRemove() {
    if (onRemove != null) {
      onRemove!(workout!);
    }
  }
}
