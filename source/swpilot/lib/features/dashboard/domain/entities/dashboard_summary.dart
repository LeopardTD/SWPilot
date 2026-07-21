import 'package:equatable/equatable.dart';
import 'package:swpilot/features/dashboard/domain/entities/automation_status.dart';
import 'package:swpilot/features/dashboard/domain/entities/daily_checkin.dart';
import 'package:swpilot/features/dashboard/domain/entities/notification_summary.dart';
import 'package:swpilot/features/dashboard/domain/entities/schedule_summary.dart';
import 'package:swpilot/features/dashboard/domain/entities/statistics_summary.dart';

/// Aggregate root domain entity for the entire Dashboard state.
class DashboardSummary extends Equatable {
  final AutomationStatus automationStatus;
  final List<DailyCheckIn> dailyCheckIns;
  final List<ScheduleSummary> scheduleSummaries;
  final StatisticsSummary statisticsSummary;
  final List<NotificationSummary> notifications;

  const DashboardSummary({
    required this.automationStatus,
    required this.dailyCheckIns,
    required this.scheduleSummaries,
    required this.statisticsSummary,
    required this.notifications,
  });

  @override
  List<Object?> get props => [
        automationStatus,
        dailyCheckIns,
        scheduleSummaries,
        statisticsSummary,
        notifications,
      ];
}
