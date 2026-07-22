import 'package:swpilot/core/usecases/usecase.dart';
import '../../domain/entities/automation_session.dart';
import '../../domain/entities/automation_task.dart';
import '../../domain/repositories/automation_repository.dart';

/// Use case to request starting an automation task.
///
/// Takes an [AutomationTask] parameter and returns the created [AutomationSession].
class StartAutomationUseCase implements UseCase<AutomationSession, AutomationTask> {
  final AutomationRepository _repository;

  /// Creates a [StartAutomationUseCase] by injecting [AutomationRepository].
  StartAutomationUseCase(this._repository);

  @override
  Future<AutomationSession> call(AutomationTask params) {
    return _repository.startAutomation(task: params);
  }
}
