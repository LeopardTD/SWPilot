import 'package:swpilot/core/usecases/usecase.dart';
import '../../domain/entities/automation_session.dart';
import '../../domain/repositories/automation_repository.dart';
import '../../domain/value_objects/session_id.dart';

/// Use case to request resuming a paused automation session.
///
/// Takes a [SessionId] parameter and returns the updated [AutomationSession].
class ResumeAutomationUseCase implements UseCase<AutomationSession, SessionId> {
  final AutomationRepository _repository;

  /// Creates a [ResumeAutomationUseCase] by injecting [AutomationRepository].
  ResumeAutomationUseCase(this._repository);

  @override
  Future<AutomationSession> call(SessionId params) {
    return _repository.resumeAutomation(sessionId: params);
  }
}
