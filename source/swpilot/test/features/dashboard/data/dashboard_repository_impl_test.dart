import 'package:flutter_test/flutter_test.dart';
import 'package:swpilot/features/dashboard/data/datasources/dashboard_local_data_source.dart';
import 'package:swpilot/features/dashboard/data/repositories/dashboard_repository_impl.dart';
import 'package:swpilot/features/dashboard/domain/domain.dart';

class MockDashboardLocalDataSource implements DashboardLocalDataSource {
  final DashboardSummary summary;
  bool shouldThrowRawError = false;
  bool shouldThrowDashboardError = false;

  MockDashboardLocalDataSource(this.summary);

  void _checkAndThrow() {
    if (shouldThrowRawError) {
      throw Exception('Raw Database Error');
    }
    if (shouldThrowDashboardError) {
      throw const DataNotFoundException('Dashboard data not found mock error');
    }
  }

  @override
  Future<DashboardSummary> getDashboardSummary() async {
    _checkAndThrow();
    return summary;
  }

  @override
  Future<AutomationStatus> getAutomationStatus() async {
    _checkAndThrow();
    return summary.automationStatus;
  }

  @override
  Future<List<DailyCheckIn>> getDailyCheckIns() async {
    _checkAndThrow();
    return summary.dailyCheckIns;
  }

  @override
  Future<StatisticsSummary> getStatisticsSummary() async {
    _checkAndThrow();
    return summary.statisticsSummary;
  }

  @override
  Future<List<ScheduleSummary>> getScheduleSummaries() async {
    _checkAndThrow();
    return summary.scheduleSummaries;
  }

  @override
  Future<List<NotificationSummary>> getNotificationSummaries() async {
    _checkAndThrow();
    return summary.notifications;
  }

  @override
  Future<void> saveDashboardSummary(DashboardSummary summary) async {
    _checkAndThrow();
  }

  @override
  Future<void> saveAutomationStatus(AutomationStatus status) async {
    _checkAndThrow();
  }

  @override
  Future<void> saveDailyCheckIns(List<DailyCheckIn> checkIns) async {
    _checkAndThrow();
  }

  @override
  Future<void> saveStatisticsSummary(StatisticsSummary statistics) async {
    _checkAndThrow();
  }

  @override
  Future<void> saveScheduleSummaries(List<ScheduleSummary> schedules) async {
    _checkAndThrow();
  }

  @override
  Future<void> saveNotificationSummaries(List<NotificationSummary> notifications) async {
    _checkAndThrow();
  }
}

void main() {
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

  late MockDashboardLocalDataSource mockDataSource;
  late DashboardRepositoryImpl repository;

  setUp(() {
    mockDataSource = MockDashboardLocalDataSource(summary);
    repository = DashboardRepositoryImpl(mockDataSource);
  });

  group('DashboardRepositoryImpl - Success Cases', () {
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

  group('DashboardRepositoryImpl - Error Cases', () {
    test('throws StorageException when raw exception is thrown from data source', () async {
      mockDataSource.shouldThrowRawError = true;
      expect(
        () => repository.getDashboardSummary(),
        throwsA(isA<StorageException>()),
      );
      expect(
        () => repository.getAutomationStatus(),
        throwsA(isA<StorageException>()),
      );
      expect(
        () => repository.getDailyCheckIns(),
        throwsA(isA<StorageException>()),
      );
      expect(
        () => repository.getStatisticsSummary(),
        throwsA(isA<StorageException>()),
      );
      expect(
        () => repository.getScheduleSummaries(),
        throwsA(isA<StorageException>()),
      );
      expect(
        () => repository.getNotificationSummaries(),
        throwsA(isA<StorageException>()),
      );
      expect(
        () => repository.refreshDashboard(),
        throwsA(isA<StorageException>()),
      );
    });

    test('rethrows DashboardException directly when data source throws DashboardException', () async {
      mockDataSource.shouldThrowDashboardError = true;
      expect(
        () => repository.getDashboardSummary(),
        throwsA(isA<DataNotFoundException>()),
      );
    });
  });
}
