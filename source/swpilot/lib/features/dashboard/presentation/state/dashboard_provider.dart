import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swpilot/features/dashboard/presentation/state/dashboard_controller.dart';
import 'package:swpilot/features/dashboard/presentation/state/dashboard_state.dart';

/// Penyedia state [dashboardControllerProvider] untuk membagikan state dashboard ke UI.
final dashboardControllerProvider =
    NotifierProvider<DashboardController, DashboardState>(() {
  return DashboardController();
});
