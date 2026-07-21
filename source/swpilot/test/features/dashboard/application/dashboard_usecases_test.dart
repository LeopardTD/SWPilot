import 'package:flutter_test/flutter_test.dart';
import 'package:swpilot/core/usecases/usecase.dart';
import 'package:swpilot/features/dashboard/application/usecases/application.dart';
import 'package:swpilot/features/dashboard/domain/domain.dart';

class MockDashboardRepository implements DashboardRepository {
  final DashboardSummary summary;
  bool shouldThrowError = false;

  MockDashboardRepository(this.summary);

  @override
  Future<DashboardSummary> getDashboardSummary() async {
    if (shouldThrowError) throw const DataNotFoundException();
    return summary;
  }

  @override
  Future<AutomationStatus> getAutomationStatus() async {
    if (shouldThrowError) throw const DataNotFoundException();
    return summary.automationStatus;
  }

  @override
  Future<List<DailyCheckIn>> getDailyCheckIns() async {
    if (shouldThrowError) throw const DataNotFoundException();
    return summary.dailyCheckIns;
  }

  @override
  Future<StatisticsSummary> getStatisticsSummary() async {
    if (shouldThrowError) throw const DataNotFoundException();
    return summary.statisticsSummary;
  }

  @override
  Future<List<ScheduleSummary>> getScheduleSummaries() async {
    if (shouldThrowError) throw const DataNotFoundException();
    return summary.scheduleSummaries;
  }

  @override
  Future<List<NotificationSummary>> getNotificationSummaries() async {
    if (shouldThrowError) throw const DataNotFoundException();
    return summary.notifications;
  }

  @override
  Future<DashboardSummary> refreshDashboard() async {
    if (shouldThrowError) throw const DataNotFoundException();
    return summary;
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

  late MockDashboardRepository mockRepository;

  setUp(() {
    mockRepository = MockDashboardRepository(summary);
  });

  group('Dashboard Use Cases - Success', () {
    test('LoadDashboardUseCase memanggil getDashboardSummary dan mengembalikan data', () async {
      final useCase = LoadDashboardUseCase(mockRepository);
      final result = await useCase(const NoParams());
      expect(result, summary);
    });

    test('LoadAutomationStatusUseCase memanggil getAutomationStatus dan mengembalikan data', () async {
      final useCase = LoadAutomationStatusUseCase(mockRepository);
      final result = await useCase(const NoParams());
      expect(result, automation);
    });

    test('LoadDailyCheckInUseCase memanggil getDailyCheckIns dan mengembalikan data', () async {
      final useCase = LoadDailyCheckInUseCase(mockRepository);
      final result = await useCase(const NoParams());
      expect(result, [checkin]);
    });

    test('LoadStatisticsUseCase memanggil getStatisticsSummary dan mengembalikan data', () async {
      final useCase = LoadStatisticsUseCase(mockRepository);
      final result = await useCase(const NoParams());
      expect(result, stats);
    });

    test('LoadScheduleUseCase memanggil getScheduleSummaries dan mengembalikan data', () async {
      final useCase = LoadScheduleUseCase(mockRepository);
      final result = await useCase(const NoParams());
      expect(result, [schedule]);
    });

    test('LoadNotificationsUseCase memanggil getNotificationSummaries dan mengembalikan data', () async {
      final useCase = LoadNotificationsUseCase(mockRepository);
      final result = await useCase(const NoParams());
      expect(result, [notif]);
    });

    test('RefreshDashboardUseCase memanggil refreshDashboard dan mengembalikan data', () async {
      final useCase = RefreshDashboardUseCase(mockRepository);
      final result = await useCase(const NoParams());
      expect(result, summary);
    });
  });

  group('Dashboard Use Cases - Exception Propagation', () {
    test('merambatkan DashboardException dari repository', () async {
      mockRepository.shouldThrowError = true;
      final useCase = LoadDashboardUseCase(mockRepository);
      expect(
        () => useCase(const NoParams()),
        throwsA(isA<DataNotFoundException>()),
      );
    });
  });
}
