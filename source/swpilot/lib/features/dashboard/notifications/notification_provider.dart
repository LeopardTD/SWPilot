import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swpilot/features/dashboard/notifications/notification_controller.dart';
import 'package:swpilot/features/dashboard/notifications/notification_state.dart';

/// Penyedia state [notificationControllerProvider] untuk membagikan daftar notifikasi ke UI.
final notificationControllerProvider =
    NotifierProvider<NotificationController, NotificationState>(() {
  return NotificationController();
});
