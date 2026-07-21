import 'package:swpilot/core/usecases/usecase.dart';
import 'package:swpilot/features/dashboard/domain/domain.dart';

/// Use case untuk memicu pembaruan/sinkronisasi ulang data dashboard.
class RefreshDashboardUseCase implements UseCase<DashboardSummary, NoParams> {
  final DashboardRepository _repository;

  /// Membuat instansi dari [RefreshDashboardUseCase] dengan menyuntikkan
  /// [DashboardRepository] melalui konstruktor.
  RefreshDashboardUseCase(this._repository);

  @override
  Future<DashboardSummary> call(NoParams params) {
    return _repository.refreshDashboard();
  }
}
