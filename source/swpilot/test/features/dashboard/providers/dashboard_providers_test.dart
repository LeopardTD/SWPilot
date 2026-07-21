import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swpilot/features/dashboard/data/data.dart';
import 'package:swpilot/features/dashboard/application/usecases/application.dart';
import 'package:swpilot/features/dashboard/providers/providers.dart';

void main() {
  group('Dashboard Providers DI Graph Verification', () {
    late ProviderContainer container;

    setUp(() {
      container = ProviderContainer();
    });

    tearDown(() {
      container.dispose();
    });

    test('dashboardLocalDataSourceProvider me-resolve ke DashboardLocalDataSourceImpl', () {
      final localDataSource = container.read(dashboardLocalDataSourceProvider);
      expect(localDataSource, isA<DashboardLocalDataSourceImpl>());
    });

    test('dashboardRepositoryProvider me-resolve ke DashboardRepositoryImpl', () {
      final repository = container.read(dashboardRepositoryProvider);
      expect(repository, isA<DashboardRepositoryImpl>());
    });

    test('loadDashboardUseCaseProvider me-resolve ke LoadDashboardUseCase', () {
      final useCase = container.read(loadDashboardUseCaseProvider);
      expect(useCase, isA<LoadDashboardUseCase>());
    });

    test('loadAutomationStatusUseCaseProvider me-resolve ke LoadAutomationStatusUseCase', () {
      final useCase = container.read(loadAutomationStatusUseCaseProvider);
      expect(useCase, isA<LoadAutomationStatusUseCase>());
    });

    test('loadDailyCheckInUseCaseProvider me-resolve ke LoadDailyCheckInUseCase', () {
      final useCase = container.read(loadDailyCheckInUseCaseProvider);
      expect(useCase, isA<LoadDailyCheckInUseCase>());
    });

    test('loadStatisticsUseCaseProvider me-resolve ke LoadStatisticsUseCase', () {
      final useCase = container.read(loadStatisticsUseCaseProvider);
      expect(useCase, isA<LoadStatisticsUseCase>());
    });

    test('loadScheduleUseCaseProvider me-resolve ke LoadScheduleUseCase', () {
      final useCase = container.read(loadScheduleUseCaseProvider);
      expect(useCase, isA<LoadScheduleUseCase>());
    });

    test('loadNotificationsUseCaseProvider me-resolve ke LoadNotificationsUseCase', () {
      final useCase = container.read(loadNotificationsUseCaseProvider);
      expect(useCase, isA<LoadNotificationsUseCase>());
    });

    test('refreshDashboardUseCaseProvider me-resolve ke RefreshDashboardUseCase', () {
      final useCase = container.read(refreshDashboardUseCaseProvider);
      expect(useCase, isA<RefreshDashboardUseCase>());
    });
  });
}
