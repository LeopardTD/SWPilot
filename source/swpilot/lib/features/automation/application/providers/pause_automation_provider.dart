import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../usecases/pause_automation_use_case.dart';
import 'automation_repository_provider.dart';

/// Riverpod provider for [PauseAutomationUseCase].
final pauseAutomationUseCaseProvider = Provider<PauseAutomationUseCase>((ref) {
  final repository = ref.watch(automationRepositoryProvider);
  return PauseAutomationUseCase(repository);
});
