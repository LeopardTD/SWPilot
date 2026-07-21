import 'package:equatable/equatable.dart';

/// Represents the status and run schedule info of the automation engine.
class AutomationStatus extends Equatable {
  final bool isActive;
  final DateTime? lastExecution;
  final DateTime? nextSchedule;

  const AutomationStatus({
    required this.isActive,
    this.lastExecution,
    this.nextSchedule,
  });

  @override
  List<Object?> get props => [isActive, lastExecution, nextSchedule];
}
