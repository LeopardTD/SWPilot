import 'package:swpilot/core/usecases/usecase.dart';
import '../../domain/entities/automation_session.dart';
import '../../domain/repositories/automation_repository.dart';

/// Use case to retrieve the active automation session, if any exists.
///
/// Requires [NoParams] and returns optional [AutomationSession].
class GetActiveSessionUseCase implements UseCase<AutomationSession?, NoParams> {
  final AutomationRepository _repository;

  /// Creates a [GetActiveSessionUseCase] by injecting [AutomationRepository].
  GetActiveSessionUseCase(this._repository);

  @override
  Future<AutomationSession?> call(NoParams params) {
    return _repository.getActiveSession();
  }
}
