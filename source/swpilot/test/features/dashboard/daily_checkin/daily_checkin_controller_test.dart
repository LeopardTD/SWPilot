import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swpilot/features/dashboard/application/usecases/application.dart';
import 'package:swpilot/features/dashboard/daily_checkin/daily_checkin.dart';
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

class MockLoadDailyCheckInUseCase extends LoadDailyCheckInUseCase {
  final List<DailyCheckIn> list;
  bool shouldThrow = false;
  int callCount = 0;

  MockLoadDailyCheckInUseCase(this.list) : super(FakeDashboardRepository());

  @override
  Future<List<DailyCheckIn>> call(dynamic params) async {
    callCount++;
    if (shouldThrow) {
      throw const DataNotFoundException();
    }
    return list;
  }
}

void main() {
  const checkIns = [
    DailyCheckIn(
      gameName: 'Genshin Impact',
      initials: 'GI',
      status: DailyCheckInStatus.pending,
    ),
  ];

  late MockLoadDailyCheckInUseCase mockUseCase;
  late ProviderContainer container;

  setUp(() {
    mockUseCase = MockLoadDailyCheckInUseCase(checkIns);
    container = ProviderContainer(
      overrides: [
        loadDailyCheckInUseCaseProvider.overrideWithValue(mockUseCase),
      ],
    );
  });

  tearDown(() {
    container.dispose();
  });

  group('DailyCheckInController Tests', () {
    test('initial state adalah DailyCheckInState.initial', () {
      final state = container.read(dailyCheckInControllerProvider);
      expect(state.isLoading, false);
      expect(state.data, null);
      expect(state.error, null);
    });

    test('loadCheckIns mengubah state menjadi success saat sukses dimuat', () async {
      final notifier = container.read(dailyCheckInControllerProvider.notifier);

      final loadFuture = notifier.loadCheckIns();

      expect(container.read(dailyCheckInControllerProvider).isLoading, true);

      await loadFuture;

      final finalState = container.read(dailyCheckInControllerProvider);
      expect(finalState.isLoading, false);
      expect(finalState.data, checkIns);
      expect(finalState.error, null);
      expect(mockUseCase.callCount, 2); // 1 dari inisialisasi awal (microtask), 1 dari pemanggilan manual
    });

    test('loadCheckIns mengubah state menjadi error saat gagal dimuat', () async {
      mockUseCase.shouldThrow = true;
      final notifier = container.read(dailyCheckInControllerProvider.notifier);

      final loadFuture = notifier.loadCheckIns();

      await loadFuture;

      final finalState = container.read(dailyCheckInControllerProvider);
      expect(finalState.isLoading, false);
      expect(finalState.data, null);
      expect(finalState.error, 'Data tidak ditemukan.');
    });
  });
}
