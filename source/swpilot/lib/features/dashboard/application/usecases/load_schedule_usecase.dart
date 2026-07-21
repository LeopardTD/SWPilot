import 'package:swpilot/core/usecases/usecase.dart';
import 'package:swpilot/features/dashboard/domain/domain.dart';

/// Use case untuk memuat daftar ringkasan jadwal tugas [ScheduleSummary].
class LoadScheduleUseCase implements UseCase<List<ScheduleSummary>, NoParams> {
  final DashboardRepository _repository;

  /// Membuat instansi dari [LoadScheduleUseCase] dengan menyuntikkan
  /// [DashboardRepository] melalui konstruktor.
  LoadScheduleUseCase(this._repository);

  @override
  Future<List<ScheduleSummary>> call(NoParams params) {
    return _repository.getScheduleSummaries();
  }
}
