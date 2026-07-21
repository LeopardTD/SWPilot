import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swpilot/core/errors/error_mapper.dart';
import 'package:swpilot/core/usecases/usecase.dart';
import 'package:swpilot/features/dashboard/automation_status/automation_status_state.dart';
import 'package:swpilot/features/dashboard/providers/usecase_providers.dart';

/// Pengontrol state khusus untuk memuat status otomatisasi.
class AutomationStatusController extends Notifier<AutomationStatusState> {
  @override
  AutomationStatusState build() {
    // Memuat data secara otomatis pada saat inisialisasi awal.
    Future.microtask(() => loadStatus());
    return const AutomationStatusState.initial();
  }

  /// Memuat data status mesin otomatisasi menggunakan [LoadAutomationStatusUseCase].
  Future<void> loadStatus() async {
    state = const AutomationStatusState.loading();
    try {
      final useCase = ref.read(loadAutomationStatusUseCaseProvider);
      final result = await useCase(const NoParams());
      state = AutomationStatusState.success(result);
    } catch (e) {
      state = AutomationStatusState.error(ErrorMapper.mapToMessage(e));
    }
  }
}
