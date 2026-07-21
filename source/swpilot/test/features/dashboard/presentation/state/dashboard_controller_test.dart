import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swpilot/features/dashboard/application/usecases/application.dart';
import 'package:swpilot/features/dashboard/presentation/state/state.dart';
import 'package:swpilot/features/dashboard/domain/domain.dart';
import 'package:swpilot/features/dashboard/providers/usecase_providers.dart';

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

class MockLoadDashboardUseCase extends LoadDashboardUseCase {
  final DashboardSummary summary;
  bool shouldThrow = false;
  int callCount = 0;

  MockLoadDashboardUseCase(this.summary) : super(FakeDashboardRepository());

  @override
  Future<DashboardSummary> call(dynamic params) async {
    callCount++;
    if (shouldThrow) {
      throw const DataNotFoundException();
    }
    return summary;
  }
}

class MockRefreshDashboardUseCase extends RefreshDashboardUseCase {
  final DashboardSummary summary;
  bool shouldThrow = false;
  int callCount = 0;

  MockRefreshDashboardUseCase(this.summary) : super(FakeDashboardRepository());

  @override
  Future<DashboardSummary> call(dynamic params) async {
    callCount++;
    if (shouldThrow) {
      throw const DataNotFoundException();
    }
    return summary;
  }
}

void main() {
  final now = DateTime(2026, 7, 21, 7, 0);
  final summary = DashboardSummary(
    automationStatus: AutomationStatus(isActive: true, lastExecution: now, nextSchedule: now),
    dailyCheckIns: const [],
    scheduleSummaries: const [],
    statisticsSummary: const StatisticsSummary(successfulRuns: 1, failedRuns: 0, todayTasks: 1, successRate: 1.0),
    notifications: const [],
  );

  late MockLoadDashboardUseCase mockLoadUseCase;
  late MockRefreshDashboardUseCase mockRefreshUseCase;
  late ProviderContainer container;

  setUp(() {
    mockLoadUseCase = MockLoadDashboardUseCase(summary);
    mockRefreshUseCase = MockRefreshDashboardUseCase(summary);

    container = ProviderContainer(
      overrides: [
        loadDashboardUseCaseProvider.overrideWithValue(mockLoadUseCase),
        refreshDashboardUseCaseProvider.overrideWithValue(mockRefreshUseCase),
      ],
    );
  });

  tearDown(() {
    container.dispose();
  });

  group('DashboardController Tests', () {
    test('initial state adalah DashboardState.initial', () {
      final controllerState = container.read(dashboardControllerProvider);
      expect(controllerState.isLoading, false);
      expect(controllerState.data, null);
      expect(controllerState.error, null);
    });

    test('loadDashboard mengubah state menjadi success saat sukses dimuat', () async {
      final notifier = container.read(dashboardControllerProvider.notifier);
      
      final loadFuture = notifier.loadDashboard();
      
      // State harus bertransisi ke loading
      expect(container.read(dashboardControllerProvider).isLoading, true);

      await loadFuture;

      final finalState = container.read(dashboardControllerProvider);
      expect(finalState.isLoading, false);
      expect(finalState.data, summary);
      expect(finalState.error, null);
      // Di-call 2 kali: 1 dari microtask saat inisialisasi, 1 dari pemanggilan manual loadDashboard()
      expect(mockLoadUseCase.callCount, 2); 
    });

    test('loadDashboard mengubah state menjadi error saat gagal dimuat', () async {
      mockLoadUseCase.shouldThrow = true;
      final notifier = container.read(dashboardControllerProvider.notifier);
      
      final loadFuture = notifier.loadDashboard();

      await loadFuture;

      final finalState = container.read(dashboardControllerProvider);
      expect(finalState.isLoading, false);
      expect(finalState.data, null);
      expect(finalState.error, 'Data tidak ditemukan.');
    });

    test('refreshDashboard mengubah state menjadi success saat sukses disegarkan', () async {
      final notifier = container.read(dashboardControllerProvider.notifier);
      
      final refreshFuture = notifier.refreshDashboard();
      
      expect(container.read(dashboardControllerProvider).isRefreshing, true);

      await refreshFuture;

      final finalState = container.read(dashboardControllerProvider);
      expect(finalState.isLoading, false);
      expect(finalState.isRefreshing, false);
      expect(finalState.data, summary);
      expect(finalState.error, null);
      expect(mockRefreshUseCase.callCount, 1);
    });

    test('refreshDashboard mengubah state menjadi error lalu memulihkan cache jika gagal', () async {
      mockRefreshUseCase.shouldThrow = true;
      final notifier = container.read(dashboardControllerProvider.notifier);
      
      // Pastikan ada data sebelumnya
      await notifier.loadDashboard();
      final originalData = container.read(dashboardControllerProvider).data;
      expect(originalData, isNotNull);

      final refreshFuture = notifier.refreshDashboard();
      
      expect(container.read(dashboardControllerProvider).isRefreshing, true);

      await refreshFuture;

      final finalState = container.read(dashboardControllerProvider);
      expect(finalState.isLoading, false);
      expect(finalState.isRefreshing, false);
      expect(finalState.data, originalData);
      expect(finalState.error, null); // dipulihkan ke success(previousData)
      expect(mockRefreshUseCase.callCount, 1);
    });
  });
}
