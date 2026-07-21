import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swpilot/core/errors/error_mapper.dart';
import 'package:swpilot/core/usecases/usecase.dart';
import 'package:swpilot/features/dashboard/presentation/state/dashboard_state.dart';
import 'package:swpilot/features/dashboard/providers/usecase_providers.dart';
import 'package:swpilot/services/logger/logger_service.dart';

/// Pengontrol state untuk Dashboard yang mengorkestrasi pemanggilan Use Cases.
class DashboardController extends Notifier<DashboardState> {
  @override
  DashboardState build() {
    // Memuat data secara otomatis pada saat inisialisasi awal.
    Future.microtask(() => loadDashboard());
    return const DashboardState.initial();
  }

  /// Memuat data ringkasan dashboard menggunakan [LoadDashboardUseCase].
  Future<void> loadDashboard() async {
    state = const DashboardState.loading();
    try {
      final loadUseCase = ref.read(loadDashboardUseCaseProvider);
      final result = await loadUseCase(const NoParams());
      state = DashboardState.success(result);
    } catch (e) {
      state = DashboardState.error(ErrorMapper.mapToMessage(e));
    }
  }

  /// Menyegarkan data ringkasan dashboard menggunakan [RefreshDashboardUseCase].
  Future<void> refreshDashboard() async {
    final previousData = state.data;
    state = DashboardState.refreshing(previousData);
    try {
      final refreshUseCase = ref.read(refreshDashboardUseCaseProvider);
      final result = await refreshUseCase(const NoParams());
      state = DashboardState.success(result);
    } catch (e) {
      state = DashboardState.error(ErrorMapper.mapToMessage(e), data: previousData);
      if (previousData != null) {
        LoggerService.debug('Cache Restored');
        state = DashboardState.success(previousData);
      }
    }
  }
}
