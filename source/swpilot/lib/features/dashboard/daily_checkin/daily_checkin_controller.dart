import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swpilot/core/errors/error_mapper.dart';
import 'package:swpilot/core/usecases/usecase.dart';
import 'package:swpilot/features/dashboard/daily_checkin/daily_checkin_state.dart';
import 'package:swpilot/features/dashboard/providers/usecase_providers.dart';

/// Pengontrol state khusus untuk memuat daftar check-in harian.
class DailyCheckInController extends Notifier<DailyCheckInState> {
  @override
  DailyCheckInState build() {
    // Memuat data secara otomatis pada saat inisialisasi awal.
    Future.microtask(() => loadCheckIns());
    return const DailyCheckInState.initial();
  }

  /// Memuat data daftar check-in harian menggunakan [LoadDailyCheckInUseCase].
  Future<void> loadCheckIns() async {
    state = const DailyCheckInState.loading();
    try {
      final useCase = ref.read(loadDailyCheckInUseCaseProvider);
      final result = await useCase(const NoParams());
      state = DailyCheckInState.success(result);
    } catch (e) {
      state = DailyCheckInState.error(ErrorMapper.mapToMessage(e));
    }
  }
}
