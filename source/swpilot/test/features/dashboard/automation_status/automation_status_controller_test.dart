import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swpilot/features/dashboard/application/usecases/application.dart';
import 'package:swpilot/features/dashboard/automation_status/automation_status.dart';
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

class MockLoadAutomationStatusUseCase extends LoadAutomationStatusUseCase {
  final AutomationStatus status;
  bool shouldThrow = false;
  int callCount = 0;

  MockLoadAutomationStatusUseCase(this.status) : super(FakeDashboardRepository());

  @override
  Future<AutomationStatus> call(dynamic params) async {
    callCount++;
    if (shouldThrow) {
      throw const DataNotFoundException();
    }
    return status;
  }
}

void main() {
  final now = DateTime(2026, 7, 21, 7, 0);
  final status = AutomationStatus(isActive: true, lastExecution: now, nextSchedule: now);

  late MockLoadAutomationStatusUseCase mockUseCase;
  late ProviderContainer container;

  setUp(() {
    mockUseCase = MockLoadAutomationStatusUseCase(status);
    container = ProviderContainer(
      overrides: [
        loadAutomationStatusUseCaseProvider.overrideWithValue(mockUseCase),
      ],
    );
  });

  tearDown(() {
    container.dispose();
  });

  group('AutomationStatusController Tests', () {
    test('initial state adalah AutomationStatusState.initial', () {
      final state = container.read(automationStatusControllerProvider);
      expect(state.isLoading, false);
      expect(state.data, null);
      expect(state.error, null);
    });

    test('loadStatus mengubah state menjadi success saat sukses dimuat', () async {
      final notifier = container.read(automationStatusControllerProvider.notifier);

      final loadFuture = notifier.loadStatus();

      expect(container.read(automationStatusControllerProvider).isLoading, true);

      await loadFuture;

      final finalState = container.read(automationStatusControllerProvider);
      expect(finalState.isLoading, false);
      expect(finalState.data, status);
      expect(finalState.error, null);
      expect(mockUseCase.callCount, 2); // 1 dari inisialisasi awal (microtask), 1 dari pemanggilan manual
    });

    test('loadStatus mengubah state menjadi error saat gagal dimuat', () async {
      mockUseCase.shouldThrow = true;
      final notifier = container.read(automationStatusControllerProvider.notifier);

      final loadFuture = notifier.loadStatus();

      await loadFuture;

      final finalState = container.read(automationStatusControllerProvider);
      expect(finalState.isLoading, false);
      expect(finalState.data, null);
      expect(finalState.error, 'Data tidak ditemukan.');
    });
  });
}
