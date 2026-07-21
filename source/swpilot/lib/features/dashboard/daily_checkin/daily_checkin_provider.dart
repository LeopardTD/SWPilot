import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swpilot/features/dashboard/daily_checkin/daily_checkin_controller.dart';
import 'package:swpilot/features/dashboard/daily_checkin/daily_checkin_state.dart';

/// Penyedia state [dailyCheckInControllerProvider] untuk membagikan status check-in ke UI.
final dailyCheckInControllerProvider =
    NotifierProvider<DailyCheckInController, DailyCheckInState>(() {
  return DailyCheckInController();
});
