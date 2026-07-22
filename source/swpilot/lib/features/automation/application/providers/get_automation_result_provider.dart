import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../usecases/get_automation_result_use_case.dart';
import 'automation_repository_provider.dart';

/// Riverpod provider for [GetAutomationResultUseCase].
final getAutomationResultUseCaseProvider = Provider<GetAutomationResultUseCase>((ref) {
  final repository = ref.watch(automationRepositoryProvider);
  return GetAutomationResultUseCase(repository);
});
