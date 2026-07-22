import 'package:swpilot/core/usecases/usecase.dart';
import '../../domain/enums/automation_status.dart';
import '../../domain/repositories/automation_repository.dart';

/// Use case to retrieve the current execution status of the Automation Engine.
///
/// Requires [NoParams] and returns [AutomationStatus].
class GetAutomationStatusUseCase implements UseCase<AutomationStatus, NoParams> {
  final AutomationRepository _repository;

  /// Creates a [GetAutomationStatusUseCase] by injecting [AutomationRepository].
  GetAutomationStatusUseCase(this._repository);

  @override
  Future<AutomationStatus> call(NoParams params) {
    return _repository.getAutomationStatus();
  }
}
