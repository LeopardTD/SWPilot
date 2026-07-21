import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swpilot/features/dashboard/automation_status/automation_status_controller.dart';
import 'package:swpilot/features/dashboard/automation_status/automation_status_state.dart';

/// Penyedia state [automationStatusControllerProvider] untuk membagikan status otomatisasi ke UI.
final automationStatusControllerProvider =
    NotifierProvider<AutomationStatusController, AutomationStatusState>(() {
  return AutomationStatusController();
});
