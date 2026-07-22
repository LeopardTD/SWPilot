import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/repositories/automation_repository.dart';
import '../../infrastructure/repositories/automation_repository_impl.dart';
import 'automation_datasource_provider.dart';

/// Riverpod provider for abstract [AutomationRepository].
///
/// Binds the repository contract to its infrastructure implementation [AutomationRepositoryImpl].
final automationRepositoryProvider = Provider<AutomationRepository>((ref) {
  final dataSource = ref.watch(automationLocalDataSourceProvider);
  return AutomationRepositoryImpl(dataSource);
});
