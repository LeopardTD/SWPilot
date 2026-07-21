import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swpilot/features/dashboard/application/usecases/application.dart';
import 'package:swpilot/features/dashboard/domain/domain.dart';
import 'package:swpilot/features/dashboard/providers/usecase_providers.dart';
import 'package:swpilot/features/dashboard/schedule/schedule.dart';

class FakeDashboardRepository implements DashboardRepository {
  @override
  Future<DashboardSummary> getDashboardSummary() => throw UnimplementedError();

  @override
  Future<AutomationStatus> getAutomationStatus() => throw UnimplementedError();

  @override
  Future<List<DailyCheckIn>> getDailyCheckIns() => throw UnimplementedError();

  @override
  Future<StatisticsSummary> getStatisticsSummary() => throw UnimplementedError();

  @override
  Future<List<ScheduleSummary>> getScheduleSummaries() => throw UnimplementedError();

  @override
  Future<List<NotificationSummary>> getNotificationSummaries() => throw UnimplementedError();

  @override
  Future<DashboardSummary> refreshDashboard() => throw UnimplementedError();
}

class MockLoadScheduleUseCase extends LoadScheduleUseCase {
  final List<ScheduleSummary> schedules;
  bool shouldThrow = false;
  int callCount = 0;

  MockLoadScheduleUseCase(this.schedules) : super(FakeDashboardRepository());

  @override
  Future<List<ScheduleSummary>> call(dynamic params) async {
    callCount++;
    if (shouldThrow) {
      throw const DataNotFoundException();
    }
    return schedules;
  }
}

void main() {
  final now = DateTime(2026, 7, 21, 7, 0);
  final schedules = [
    ScheduleSummary(
      taskName: 'Daily Check-in',
      nextRun: now,
      status: ScheduleStatus.scheduled,
    ),
  ];

  late MockLoadScheduleUseCase mockUseCase;
  late ProviderContainer container;

  setUp(() {
    mockUseCase = MockLoadScheduleUseCase(schedules);
    container = ProviderContainer(
      overrides: [
        loadScheduleUseCaseProvider.overrideWithValue(mockUseCase),
      ],
    );
  });

  tearDown(() {
    container.dispose();
  });

  group('ScheduleController Tests', () {
    test('initial state adalah ScheduleState.initial', () {
      final state = container.read(scheduleControllerProvider);
      expect(state.isLoading, false);
      expect(state.data, null);
      expect(state.error, null);
    });

    test('loadSchedules mengubah state menjadi success saat sukses dimuat', () async {
      final notifier = container.read(scheduleControllerProvider.notifier);

      final loadFuture = notifier.loadSchedules();

      expect(container.read(scheduleControllerProvider).isLoading, true);

      await loadFuture;

      final finalState = container.read(scheduleControllerProvider);
      expect(finalState.isLoading, false);
      expect(finalState.data, schedules);
      expect(finalState.error, null);
      expect(mockUseCase.callCount, 2); // 1 dari inisialisasi awal (microtask), 1 dari pemanggilan manual
    });

    test('loadSchedules mengubah state menjadi error saat gagal dimuat', () async {
      mockUseCase.shouldThrow = true;
      final notifier = container.read(scheduleControllerProvider.notifier);

      final loadFuture = notifier.loadSchedules();

      await loadFuture;

      final finalState = container.read(scheduleControllerProvider);
      expect(finalState.isLoading, false);
      expect(finalState.data, null);
      expect(finalState.error, 'Data tidak ditemukan.');
    });
  });
}
