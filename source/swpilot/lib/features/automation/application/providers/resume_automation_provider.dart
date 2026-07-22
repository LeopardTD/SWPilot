import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../usecases/resume_automation_use_case.dart';
import 'automation_repository_provider.dart';

/// Riverpod provider for [ResumeAutomationUseCase].
final resumeAutomationUseCaseProvider = Provider<ResumeAutomationUseCase>((ref) {
  final repository = ref.watch(automationRepositoryProvider);
  return ResumeAutomationUseCase(repository);
});
