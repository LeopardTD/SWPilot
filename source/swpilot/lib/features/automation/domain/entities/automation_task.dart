import 'package:equatable/equatable.dart';
import '../enums/automation_status.dart';
import '../enums/automation_task_type.dart';
import '../value_objects/automation_id.dart';
import '../value_objects/task_name.dart';

/// Represents a single automation task entity in the domain.
class AutomationTask extends Equatable {
  final AutomationId id;
  final TaskName name;
  final String description;
  final AutomationStatus status;
  final AutomationTaskType type;
  final DateTime createdAt;

  const AutomationTask({
    required this.id,
    required this.name,
    required this.description,
    required this.status,
    this.type = AutomationTaskType.generic,
    required this.createdAt,
  });

  AutomationTask copyWith({
    AutomationId? id,
    TaskName? name,
    String? description,
    AutomationStatus? status,
    AutomationTaskType? type,
    DateTime? createdAt,
  }) {
    return AutomationTask(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      status: status ?? this.status,
      type: type ?? this.type,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  List<Object?> get props => [id, name, description, status, type, createdAt];
}
