import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swpilot/features/dashboard/data/data.dart';
import 'package:swpilot/features/dashboard/domain/domain.dart';
import 'package:swpilot/features/dashboard/providers/local_data_source_provider.dart';

/// Penyedia ketergantungan untuk [DashboardRepository].
final dashboardRepositoryProvider = Provider<DashboardRepository>((ref) {
  final localDataSource = ref.watch(dashboardLocalDataSourceProvider);
  return DashboardRepositoryImpl(localDataSource);
});
