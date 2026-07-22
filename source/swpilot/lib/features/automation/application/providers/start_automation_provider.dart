import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../usecases/start_automation_use_case.dart';
import 'automation_repository_provider.dart';

/// Riverpod provider for [StartAutomationUseCase].
final startAutomationUseCaseProvider = Provider<StartAutomationUseCase>((ref) {
  final repository = ref.watch(automationRepositoryProvider);
  return StartAutomationUseCase(repository);
});
