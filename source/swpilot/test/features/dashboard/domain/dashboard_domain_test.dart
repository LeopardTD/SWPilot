import 'package:flutter_test/flutter_test.dart';
import 'package:swpilot/features/dashboard/domain/domain.dart';

/// Implementasi Mock untuk verifikasi kontrak antarmuka DashboardRepository.
class MockDashboardRepository implements DashboardRepository {
  final DashboardSummary summary;

  MockDashboardRepository(this.summary);

  @override
  Future<DashboardSummary> getDashboardSummary() async => summary;

  @override
  Future<AutomationStatus> getAutomationStatus() async => summary.automationStatus;

  @override
  Future<List<DailyCheckIn>> getDailyCheckIns() async => summary.dailyCheckIns;

  @override
  Future<StatisticsSummary> getStatisticsSummary() async => summary.statisticsSummary;

  @override
  Future<List<ScheduleSummary>> getScheduleSummaries() async => summary.scheduleSummaries;

  @override
  Future<List<NotificationSummary>> getNotificationSummaries() async => summary.notifications;

  @override
  Future<DashboardSummary> refreshDashboard() async => summary;
}

void main() {
  group('Dashboard Exceptions', () {
    test('should hold correct message and format representation', () {
      const exception = DataNotFoundException('Not found message');
      expect(exception.message, 'Not found message');
      expect(exception.toString(), 'DashboardException: Not found message');
    });

    test('should have default messages', () {
      expect(const DataNotFoundException().message, 'Dashboard data not found.');
      expect(const StorageException().message, 'Storage operation failed.');
      expect(const NetworkException().message, 'Network request failed.');
    });
  });

  group('Dashboard Entities', () {
    final now = DateTime(2026, 7, 21, 7, 0);

    test('AutomationStatus supports value equality', () {
      final status1 = AutomationStatus(
        isActive: true,
        lastExecution: now,
        nextSchedule: now.add(const Duration(minutes: 5)),
      );
      final status2 = AutomationStatus(
        isActive: true,
        lastExecution: now,
        nextSchedule: now.add(const Duration(minutes: 5)),
      );
      final status3 = AutomationStatus(
        isActive: false,
        lastExecution: now,
        nextSchedule: null,
      );

      expect(status1, status2);
      expect(status1, isNot(status3));
    });

    test('DailyCheckIn supports value equality', () {
      const checkin1 = DailyCheckIn(
        gameName: 'Genshin Impact',
        initials: 'GI',
        status: DailyCheckInStatus.completed,
      );
      const checkin2 = DailyCheckIn(
        gameName: 'Genshin Impact',
        initials: 'GI',
        status: DailyCheckInStatus.completed,
      );
      const checkin3 = DailyCheckIn(
        gameName: 'Honkai: Star Rail',
        initials: 'HSR',
        status: DailyCheckInStatus.pending,
      );

      expect(checkin1, checkin2);
      expect(checkin1, isNot(checkin3));
    });

    test('ScheduleSummary supports value equality', () {
      final schedule1 = ScheduleSummary(
        taskName: 'Claim Rewards',
        nextRun: now,
        status: ScheduleStatus.scheduled,
      );
      final schedule2 = ScheduleSummary(
        taskName: 'Claim Rewards',
        nextRun: now,
        status: ScheduleStatus.scheduled,
      );
      final schedule3 = ScheduleSummary(
        taskName: 'Refresh Notes',
        nextRun: now,
        status: ScheduleStatus.paused,
      );

      expect(schedule1, schedule2);
      expect(schedule1, isNot(schedule3));
    });

    test('NotificationSummary supports value equality', () {
      final notif1 = NotificationSummary(
        type: NotificationType.success,
        message: 'Daily check-in done',
        timestamp: now,
      );
      final notif2 = NotificationSummary(
        type: NotificationType.success,
        message: 'Daily check-in done',
        timestamp: now,
      );
      final notif3 = NotificationSummary(
        type: NotificationType.information,
        message: 'System loaded',
        timestamp: now,
      );

      expect(notif1, notif2);
      expect(notif1, isNot(notif3));
    });

    test('StatisticsSummary supports value equality', () {
      const stats1 = StatisticsSummary(
        successfulRuns: 10,
        failedRuns: 1,
        todayTasks: 11,
        successRate: 0.909,
      );
      const stats2 = StatisticsSummary(
        successfulRuns: 10,
        failedRuns: 1,
        todayTasks: 11,
        successRate: 0.909,
      );
      const stats3 = StatisticsSummary(
        successfulRuns: 5,
        failedRuns: 5,
        todayTasks: 10,
        successRate: 0.5,
      );

      expect(stats1, stats2);
      expect(stats1, isNot(stats3));
    });

    test('DashboardSummary supports value equality', () {
      final automation = AutomationStatus(isActive: true, lastExecution: now, nextSchedule: now);
      const checkin = DailyCheckIn(gameName: 'GI', initials: 'GI', status: DailyCheckInStatus.pending);
      final schedule = ScheduleSummary(taskName: 'Task', nextRun: now, status: ScheduleStatus.scheduled);
      const stats = StatisticsSummary(successfulRuns: 1, failedRuns: 0, todayTasks: 1, successRate: 1.0);
      final notif = NotificationSummary(type: NotificationType.information, message: 'Ready', timestamp: now);

      final summary1 = DashboardSummary(
        automationStatus: automation,
        dailyCheckIns: [checkin],
        scheduleSummaries: [schedule],
        statisticsSummary: stats,
        notifications: [notif],
      );

      final summary2 = DashboardSummary(
        automationStatus: automation,
        dailyCheckIns: [checkin],
        scheduleSummaries: [schedule],
        statisticsSummary: stats,
        notifications: [notif],
      );

      expect(summary1, summary2);
    });
  });

  group('DashboardRepository Contract', () {
    final now = DateTime(2026, 7, 21, 7, 0);
    final automation = AutomationStatus(isActive: true, lastExecution: now, nextSchedule: now);
    const checkin = DailyCheckIn(gameName: 'GI', initials: 'GI', status: DailyCheckInStatus.pending);
    final schedule = ScheduleSummary(taskName: 'Task', nextRun: now, status: ScheduleStatus.scheduled);
    const stats = StatisticsSummary(successfulRuns: 1, failedRuns: 0, todayTasks: 1, successRate: 1.0);
    final notif = NotificationSummary(type: NotificationType.information, message: 'Ready', timestamp: now);

    final summary = DashboardSummary(
      automationStatus: automation,
      dailyCheckIns: [checkin],
      scheduleSummaries: [schedule],
      statisticsSummary: stats,
      notifications: [notif],
    );

    final repository = MockDashboardRepository(summary);

    test('getDashboardSummary returns expected value', () async {
      final result = await repository.getDashboardSummary();
      expect(result, summary);
    });

    test('getAutomationStatus returns expected value', () async {
      final result = await repository.getAutomationStatus();
      expect(result, automation);
    });

    test('getDailyCheckIns returns expected value', () async {
      final result = await repository.getDailyCheckIns();
      expect(result, [checkin]);
    });

    test('getStatisticsSummary returns expected value', () async {
      final result = await repository.getStatisticsSummary();
      expect(result, stats);
    });

    test('getScheduleSummaries returns expected value', () async {
      final result = await repository.getScheduleSummaries();
      expect(result, [schedule]);
    });

    test('getNotificationSummaries returns expected value', () async {
      final result = await repository.getNotificationSummaries();
      expect(result, [notif]);
    });

    test('refreshDashboard returns expected value', () async {
      final result = await repository.refreshDashboard();
      expect(result, summary);
    });
  });
}
