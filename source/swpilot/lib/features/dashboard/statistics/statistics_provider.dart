import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swpilot/features/dashboard/statistics/statistics_controller.dart';
import 'package:swpilot/features/dashboard/statistics/statistics_state.dart';

/// Penyedia state [statisticsControllerProvider] untuk membagikan ringkasan statistik ke UI.
final statisticsControllerProvider =
    NotifierProvider<StatisticsController, StatisticsState>(() {
  return StatisticsController();
});
