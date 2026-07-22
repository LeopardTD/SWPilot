import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../usecases/get_active_session_use_case.dart';
import 'automation_repository_provider.dart';

/// Riverpod provider for [GetActiveSessionUseCase].
final getActiveSessionUseCaseProvider = Provider<GetActiveSessionUseCase>((ref) {
  final repository = ref.watch(automationRepositoryProvider);
  return GetActiveSessionUseCase(repository);
});
