import 'package:equatable/equatable.dart';

/// Domain entity representing consolidated dashboard run statistics.
class StatisticsSummary extends Equatable {
  final int successfulRuns;
  final int failedRuns;
  final int todayTasks;
  final double successRate; // Represented as decimal (e.g. 0.95 for 95%)

  const StatisticsSummary({
    required this.successfulRuns,
    required this.failedRuns,
    required this.todayTasks,
    required this.successRate,
  });

  @override
  List<Object?> get props => [
        successfulRuns,
        failedRuns,
        todayTasks,
        successRate,
      ];
}
