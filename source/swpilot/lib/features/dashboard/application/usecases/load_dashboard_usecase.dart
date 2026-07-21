import 'package:swpilot/core/usecases/usecase.dart';
import 'package:swpilot/features/dashboard/domain/domain.dart';

/// Use case untuk memuat data [DashboardSummary] secara keseluruhan.
class LoadDashboardUseCase implements UseCase<DashboardSummary, NoParams> {
  final DashboardRepository _repository;

  /// Membuat instansi dari [LoadDashboardUseCase] dengan menyuntikkan
  /// [DashboardRepository] melalui konstruktor.
  LoadDashboardUseCase(this._repository);

  @override
  Future<DashboardSummary> call(NoParams params) {
    return _repository.getDashboardSummary();
  }
}
