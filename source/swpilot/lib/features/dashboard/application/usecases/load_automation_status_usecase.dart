import 'package:swpilot/core/usecases/usecase.dart';
import 'package:swpilot/features/dashboard/domain/domain.dart';

/// Use case untuk memuat status mesin otomatisasi [AutomationStatus].
class LoadAutomationStatusUseCase implements UseCase<AutomationStatus, NoParams> {
  final DashboardRepository _repository;

  /// Membuat instansi dari [LoadAutomationStatusUseCase] dengan menyuntikkan
  /// [DashboardRepository] melalui konstruktor.
  LoadAutomationStatusUseCase(this._repository);

  @override
  Future<AutomationStatus> call(NoParams params) {
    return _repository.getAutomationStatus();
  }
}
