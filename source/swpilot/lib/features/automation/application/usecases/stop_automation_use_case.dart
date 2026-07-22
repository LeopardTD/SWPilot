import 'package:swpilot/core/usecases/usecase.dart';
import '../../domain/entities/automation_result.dart';
import '../../domain/repositories/automation_repository.dart';
import '../../domain/value_objects/session_id.dart';

/// Use case to request stopping an active automation session.
///
/// Takes a [SessionId] parameter and returns the final [AutomationResult].
class StopAutomationUseCase implements UseCase<AutomationResult, SessionId> {
  final AutomationRepository _repository;

  /// Creates a [StopAutomationUseCase] by injecting [AutomationRepository].
  StopAutomationUseCase(this._repository);

  @override
  Future<AutomationResult> call(SessionId params) {
    return _repository.stopAutomation(sessionId: params);
  }
}
