import 'package:equatable/equatable.dart';
import 'automation_task.dart';

/// Domain entity representing the outcome of a pipeline validation and preparation process.
class PipelineResult extends Equatable {
  final AutomationTask task;
  final bool isReady;
  final String message;
  final DateTime timestamp;

  const PipelineResult({
    required this.task,
    required this.isReady,
    required this.message,
    required this.timestamp,
  });

  @override
  List<Object?> get props => [task, isReady, message, timestamp];
}
