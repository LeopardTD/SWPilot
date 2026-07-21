import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swpilot/core/errors/error_mapper.dart';
import 'package:swpilot/core/usecases/usecase.dart';
import 'package:swpilot/features/dashboard/providers/usecase_providers.dart';
import 'package:swpilot/features/dashboard/schedule/schedule_state.dart';

/// Pengontrol state khusus untuk memuat daftar jadwal penugasan.
class ScheduleController extends Notifier<ScheduleState> {
  @override
  ScheduleState build() {
    // Memuat data secara otomatis pada saat inisialisasi awal.
    Future.microtask(() => loadSchedules());
    return const ScheduleState.initial();
  }

  /// Memuat data daftar jadwal penugasan menggunakan [LoadScheduleUseCase].
  Future<void> loadSchedules() async {
    state = const ScheduleState.loading();
    try {
      final useCase = ref.read(loadScheduleUseCaseProvider);
      final result = await useCase(const NoParams());
      state = ScheduleState.success(result);
    } catch (e) {
      state = ScheduleState.error(ErrorMapper.mapToMessage(e));
    }
  }
}
