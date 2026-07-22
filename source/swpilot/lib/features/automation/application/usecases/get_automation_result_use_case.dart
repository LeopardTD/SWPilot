import 'package:swpilot/core/usecases/usecase.dart';
import '../../domain/entities/automation_result.dart';
import '../../domain/repositories/automation_repository.dart';
import '../../domain/value_objects/session_id.dart';

/// Use case to retrieve the automation result for a specific session.
///
/// Takes a [SessionId] parameter and returns optional [AutomationResult].
class GetAutomationResultUseCase implements UseCase<AutomationResult?, SessionId> {
  final AutomationRepository _repository;

  /// Creates a [GetAutomationResultUseCase] by injecting [AutomationRepository].
  GetAutomationResultUseCase(this._repository);

  @override
  Future<AutomationResult?> call(SessionId params) {
    return _repository.getAutomationResult(sessionId: params);
  }
}
