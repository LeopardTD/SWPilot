import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../usecases/get_automation_status_use_case.dart';
import 'automation_repository_provider.dart';

/// Riverpod provider for [GetAutomationStatusUseCase].
final getAutomationStatusUseCaseProvider = Provider<GetAutomationStatusUseCase>((ref) {
  final repository = ref.watch(automationRepositoryProvider);
  return GetAutomationStatusUseCase(repository);
});
