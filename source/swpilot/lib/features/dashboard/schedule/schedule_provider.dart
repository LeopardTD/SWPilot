import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swpilot/features/dashboard/schedule/schedule_controller.dart';
import 'package:swpilot/features/dashboard/schedule/schedule_state.dart';

/// Penyedia state [scheduleControllerProvider] untuk membagikan daftar jadwal ke UI.
final scheduleControllerProvider =
    NotifierProvider<ScheduleController, ScheduleState>(() {
  return ScheduleController();
});
