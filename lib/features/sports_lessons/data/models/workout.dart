import 'package:floor/floor.dart';
import 'package:laborato_test_app/core/constants/constants.dart';
import 'package:laborato_test_app/features/sports_lessons/domain/entities/workout.dart';

@Entity(tableName: 'workout', primaryKeys: ['id'])
class WorkoutModel extends WorkoutEntity {
  const WorkoutModel({
    int? id,
    String? name,
    String? description,
    String? type,
    String? level,
    String? duration,
    String? recommendation,
  }) : super(
          id: id,
          name: name,
          description: description,
          type: type,
          level: level,
          duration: duration,
          recommendation: recommendation,
        );

  factory WorkoutModel.fromJson(Map<String, dynamic> map) {
    return WorkoutModel(
      name: map['name'] ?? "",
      description: map['description'] ?? "",
      type: map['type'] ?? "",
      level: map['level'] ?? "",
      duration: map['duration'] ?? "",
      recommendation: map['recommendation'] ?? "",
    );
  }

  factory WorkoutModel.fromEntity(WorkoutEntity entity) {
    return WorkoutModel(
        id: entity.id,
        name: entity.name,
        description: entity.description,
        type: entity.type,
        level: entity.level,
        duration: entity.duration,
        recommendation: entity.recommendation);
  }
}
