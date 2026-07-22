import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../usecases/stop_automation_use_case.dart';
import 'automation_repository_provider.dart';

/// Riverpod provider for [StopAutomationUseCase].
final stopAutomationUseCaseProvider = Provider<StopAutomationUseCase>((ref) {
  final repository = ref.watch(automationRepositoryProvider);
  return StopAutomationUseCase(repository);
});
