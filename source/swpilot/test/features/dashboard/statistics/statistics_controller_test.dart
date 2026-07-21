import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swpilot/features/dashboard/application/usecases/application.dart';
import 'package:swpilot/features/dashboard/domain/domain.dart';
import 'package:swpilot/features/dashboard/providers/usecase_providers.dart';
import 'package:swpilot/features/dashboard/statistics/statistics.dart';

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

class MockLoadStatisticsUseCase extends LoadStatisticsUseCase {
  final StatisticsSummary statistics;
  bool shouldThrow = false;
  int callCount = 0;

  MockLoadStatisticsUseCase(this.statistics) : super(FakeDashboardRepository());

  @override
  Future<StatisticsSummary> call(dynamic params) async {
    callCount++;
    if (shouldThrow) {
      throw const DataNotFoundException();
    }
    return statistics;
  }
}

void main() {
  const statistics = StatisticsSummary(
    successfulRuns: 10,
    failedRuns: 2,
    todayTasks: 12,
    successRate: 0.83,
  );

  late MockLoadStatisticsUseCase mockUseCase;
  late ProviderContainer container;

  setUp(() {
    mockUseCase = MockLoadStatisticsUseCase(statistics);
    container = ProviderContainer(
      overrides: [
        loadStatisticsUseCaseProvider.overrideWithValue(mockUseCase),
      ],
    );
  });

  tearDown(() {
    container.dispose();
  });

  group('StatisticsController Tests', () {
    test('initial state adalah StatisticsState.initial', () {
      final state = container.read(statisticsControllerProvider);
      expect(state.isLoading, false);
      expect(state.data, null);
      expect(state.error, null);
    });

    test('loadStatistics mengubah state menjadi success saat sukses dimuat', () async {
      final notifier = container.read(statisticsControllerProvider.notifier);

      final loadFuture = notifier.loadStatistics();

      expect(container.read(statisticsControllerProvider).isLoading, true);

      await loadFuture;

      final finalState = container.read(statisticsControllerProvider);
      expect(finalState.isLoading, false);
      expect(finalState.data, statistics);
      expect(finalState.error, null);
      expect(mockUseCase.callCount, 2); // 1 dari inisialisasi awal (microtask), 1 dari pemanggilan manual
    });

    test('loadStatistics mengubah state menjadi error saat gagal dimuat', () async {
      mockUseCase.shouldThrow = true;
      final notifier = container.read(statisticsControllerProvider.notifier);

      final loadFuture = notifier.loadStatistics();

      await loadFuture;

      final finalState = container.read(statisticsControllerProvider);
      expect(finalState.isLoading, false);
      expect(finalState.data, null);
      expect(finalState.error, 'Data tidak ditemukan.');
    });
  });
}
