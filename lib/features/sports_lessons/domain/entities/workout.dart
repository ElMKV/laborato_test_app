import 'package:equatable/equatable.dart';

class WorkoutEntity extends Equatable {
  final int? id;
  final String? name;
  final String? description;
  final String? type;
  final String? level;
  final String? duration;
  final String? recommendation;

  const WorkoutEntity({
    this.id,
    this.name,
    this.description,
    this.type,
    this.level,
    this.duration,
    this.recommendation,
  });

  @override
  List<Object?> get props {
    return [
      id,
      name,
      description,
      type,
      level,
      duration,
      recommendation,
    ];
  }
}
