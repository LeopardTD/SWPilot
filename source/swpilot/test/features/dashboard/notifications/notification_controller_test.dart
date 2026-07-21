import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swpilot/features/dashboard/application/usecases/application.dart';
import 'package:swpilot/features/dashboard/domain/domain.dart';
import 'package:swpilot/features/dashboard/providers/usecase_providers.dart';
import 'package:swpilot/features/dashboard/notifications/notifications.dart';

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

class MockLoadNotificationsUseCase extends LoadNotificationsUseCase {
  final List<NotificationSummary> notifications;
  bool shouldThrow = false;
  int callCount = 0;

  MockLoadNotificationsUseCase(this.notifications) : super(FakeDashboardRepository());

  @override
  Future<List<NotificationSummary>> call(dynamic params) async {
    callCount++;
    if (shouldThrow) {
      throw const DataNotFoundException();
    }
    return notifications;
  }
}

void main() {
  final now = DateTime(2026, 7, 21, 7, 0);
  final notifications = [
    NotificationSummary(
      type: NotificationType.success,
      message: 'Daily Check-in completed',
      timestamp: now,
    ),
  ];

  late MockLoadNotificationsUseCase mockUseCase;
  late ProviderContainer container;

  setUp(() {
    mockUseCase = MockLoadNotificationsUseCase(notifications);
    container = ProviderContainer(
      overrides: [
        loadNotificationsUseCaseProvider.overrideWithValue(mockUseCase),
      ],
    );
  });

  tearDown(() {
    container.dispose();
  });

  group('NotificationController Tests', () {
    test('initial state adalah NotificationState.initial', () {
      final state = container.read(notificationControllerProvider);
      expect(state.isLoading, false);
      expect(state.data, null);
      expect(state.error, null);
    });

    test('loadNotifications mengubah state menjadi success saat sukses dimuat', () async {
      final notifier = container.read(notificationControllerProvider.notifier);

      final loadFuture = notifier.loadNotifications();

      expect(container.read(notificationControllerProvider).isLoading, true);

      await loadFuture;

      final finalState = container.read(notificationControllerProvider);
      expect(finalState.isLoading, false);
      expect(finalState.data, notifications);
      expect(finalState.error, null);
      expect(mockUseCase.callCount, 2); // 1 dari inisialisasi awal (microtask), 1 dari pemanggilan manual
    });

    test('loadNotifications mengubah state menjadi error saat gagal dimuat', () async {
      mockUseCase.shouldThrow = true;
      final notifier = container.read(notificationControllerProvider.notifier);

      final loadFuture = notifier.loadNotifications();

      await loadFuture;

      final finalState = container.read(notificationControllerProvider);
      expect(finalState.isLoading, false);
      expect(finalState.data, null);
      expect(finalState.error, 'Data tidak ditemukan.');
    });
  });
}
