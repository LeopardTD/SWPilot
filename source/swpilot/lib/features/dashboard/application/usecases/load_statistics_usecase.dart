import 'package:swpilot/core/usecases/usecase.dart';
import 'package:swpilot/features/dashboard/domain/domain.dart';

/// Use case untuk memuat ringkasan statistik [StatisticsSummary].
class LoadStatisticsUseCase implements UseCase<StatisticsSummary, NoParams> {
  final DashboardRepository _repository;

  /// Membuat instansi dari [LoadStatisticsUseCase] dengan menyuntikkan
  /// [DashboardRepository] melalui konstruktor.
  LoadStatisticsUseCase(this._repository);

  @override
  Future<StatisticsSummary> call(NoParams params) {
    return _repository.getStatisticsSummary();
  }
}
