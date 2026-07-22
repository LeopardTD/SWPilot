import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../infrastructure/datasources/automation_local_datasource.dart';

/// Riverpod provider for [AutomationLocalDataSource].
///
/// Instantiates in-memory local data source for the automation module.
final automationLocalDataSourceProvider = Provider<AutomationLocalDataSource>((ref) {
  return AutomationLocalDataSource();
});
