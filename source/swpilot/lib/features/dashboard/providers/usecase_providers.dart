import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swpilot/features/dashboard/application/usecases/application.dart';
import 'package:swpilot/features/dashboard/providers/repository_provider.dart';

/// Penyedia ketergantungan untuk [LoadDashboardUseCase].
final loadDashboardUseCaseProvider = Provider<LoadDashboardUseCase>((ref) {
  final repository = ref.watch(dashboardRepositoryProvider);
  return LoadDashboardUseCase(repository);
});

/// Penyedia ketergantungan untuk [LoadAutomationStatusUseCase].
final loadAutomationStatusUseCaseProvider = Provider<LoadAutomationStatusUseCase>((ref) {
  final repository = ref.watch(dashboardRepositoryProvider);
  return LoadAutomationStatusUseCase(repository);
});

/// Penyedia ketergantungan untuk [LoadDailyCheckInUseCase].
final loadDailyCheckInUseCaseProvider = Provider<LoadDailyCheckInUseCase>((ref) {
  final repository = ref.watch(dashboardRepositoryProvider);
  return LoadDailyCheckInUseCase(repository);
});

/// Penyedia ketergantungan untuk [LoadStatisticsUseCase].
final loadStatisticsUseCaseProvider = Provider<LoadStatisticsUseCase>((ref) {
  final repository = ref.watch(dashboardRepositoryProvider);
  return LoadStatisticsUseCase(repository);
});

/// Penyedia ketergantungan untuk [LoadScheduleUseCase].
final loadScheduleUseCaseProvider = Provider<LoadScheduleUseCase>((ref) {
  final repository = ref.watch(dashboardRepositoryProvider);
  return LoadScheduleUseCase(repository);
});

/// Penyedia ketergantungan untuk [LoadNotificationsUseCase].
final loadNotificationsUseCaseProvider = Provider<LoadNotificationsUseCase>((ref) {
  final repository = ref.watch(dashboardRepositoryProvider);
  return LoadNotificationsUseCase(repository);
});

/// Penyedia ketergantungan untuk [RefreshDashboardUseCase].
final refreshDashboardUseCaseProvider = Provider<RefreshDashboardUseCase>((ref) {
  final repository = ref.watch(dashboardRepositoryProvider);
  return RefreshDashboardUseCase(repository);
});
