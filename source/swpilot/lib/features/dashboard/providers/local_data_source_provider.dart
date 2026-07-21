import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swpilot/features/dashboard/data/data.dart';

/// Penyedia ketergantungan untuk [DashboardLocalDataSource].
final dashboardLocalDataSourceProvider = Provider<DashboardLocalDataSource>((ref) {
  return const DashboardLocalDataSourceImpl();
});
