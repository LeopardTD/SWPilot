import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swpilot/core/errors/error_mapper.dart';
import 'package:swpilot/core/usecases/usecase.dart';
import 'package:swpilot/features/dashboard/notifications/notification_state.dart';
import 'package:swpilot/features/dashboard/providers/usecase_providers.dart';

/// Pengontrol state khusus untuk memuat daftar notifikasi dan log aktivitas sistem secara asinkron.
class NotificationController extends Notifier<NotificationState> {
  @override
  NotificationState build() {
    // Memuat data secara otomatis pada saat inisialisasi awal.
    Future.microtask(() => loadNotifications());
    return const NotificationState.initial();
  }

  /// Memuat data daftar notifikasi menggunakan [LoadNotificationsUseCase].
  Future<void> loadNotifications() async {
    state = const NotificationState.loading();
    try {
      final useCase = ref.read(loadNotificationsUseCaseProvider);
      final result = await useCase(const NoParams());
      state = NotificationState.success(result);
    } catch (e) {
      state = NotificationState.error(ErrorMapper.mapToMessage(e));
    }
  }
}
