import 'package:swpilot/core/usecases/usecase.dart';
import '../../domain/entities/automation_session.dart';
import '../../domain/repositories/automation_repository.dart';
import '../../domain/value_objects/session_id.dart';

/// Use case to request pausing an active automation session.
///
/// Takes a [SessionId] parameter and returns the updated [AutomationSession].
class PauseAutomationUseCase implements UseCase<AutomationSession, SessionId> {
  final AutomationRepository _repository;

  /// Creates a [PauseAutomationUseCase] by injecting [AutomationRepository].
  PauseAutomationUseCase(this._repository);

  @override
  Future<AutomationSession> call(SessionId params) {
    return _repository.pauseAutomation(sessionId: params);
  }
}
