import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../domain/entities/article.dart';

class WorkoutsWidget extends StatelessWidget {
  final WorkoutEntity? workout;
  final bool? isRemovable;
  final void Function(WorkoutEntity workout)? onRemove;

  const WorkoutsWidget({
    Key? key,
    this.workout,
    this.isRemovable = false,
    this.onRemove,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.only(
          start: 14, end: 14, bottom: 10, top: 10),
      height: MediaQuery.of(context).size.width / 2,
      child: Row(
        children: [
          _buildTitleAndDescription(),
          _buildRemovableArea(),
        ],
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
          Text(
            workout!.name ?? '',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w200),
          ),
          // Description
          Expanded(
            child: SingleChildScrollView(

              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  workout!.description ?? '',
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
                  workout!.type!,
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                ),
                const Icon(Icons.timeline_outlined, size: 18),
                Text(
                  workout!.level!,
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                ),
                const Icon(Icons.schedule_outlined, size: 18),
                Text(
                  workout!.duration!,
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
    if (isRemovable!) {
      return GestureDetector(
        onTap: _onRemove,
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Icon(Icons.remove_circle_outline, color: Colors.red),
        ),
      );
    }
    return Container();
  }

  void _onRemove() {
    if (onRemove != null) {
      onRemove!(workout!);
    }
  }
}
