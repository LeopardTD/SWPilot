import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swpilot/core/errors/error_mapper.dart';
import 'package:swpilot/core/usecases/usecase.dart';
import 'package:swpilot/features/dashboard/providers/usecase_providers.dart';
import 'package:swpilot/features/dashboard/statistics/statistics_state.dart';

/// Pengontrol state khusus untuk memuat ringkasan statistik.
class StatisticsController extends Notifier<StatisticsState> {
  @override
  StatisticsState build() {
    // Memuat data secara otomatis pada saat inisialisasi awal.
    Future.microtask(() => loadStatistics());
    return const StatisticsState.initial();
  }

  /// Memuat data ringkasan statistik menggunakan [LoadStatisticsUseCase].
  Future<void> loadStatistics() async {
    state = const StatisticsState.loading();
    try {
      final useCase = ref.read(loadStatisticsUseCaseProvider);
      final result = await useCase(const NoParams());
      state = StatisticsState.success(result);
    } catch (e) {
      state = StatisticsState.error(ErrorMapper.mapToMessage(e));
    }
  }
}
