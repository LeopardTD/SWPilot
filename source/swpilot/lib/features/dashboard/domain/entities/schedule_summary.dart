import 'package:equatable/equatable.dart';

/// Represents the status of a scheduled task.
enum ScheduleStatus {
  scheduled,
  running,
  paused,
}

/// Domain entity representing a scheduled task run summary.
class ScheduleSummary extends Equatable {
  final String taskName;
  final DateTime nextRun;
  final ScheduleStatus status;

  const ScheduleSummary({
    required this.taskName,
    required this.nextRun,
    required this.status,
  });

  @override
  List<Object?> get props => [taskName, nextRun, status];
}
