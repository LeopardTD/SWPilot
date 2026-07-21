import 'package:swpilot/core/usecases/usecase.dart';
import 'package:swpilot/features/dashboard/domain/domain.dart';

/// Use case untuk memuat daftar tugas check-in harian [DailyCheckIn].
class LoadDailyCheckInUseCase implements UseCase<List<DailyCheckIn>, NoParams> {
  final DashboardRepository _repository;

  /// Membuat instansi dari [LoadDailyCheckInUseCase] dengan menyuntikkan
  /// [DashboardRepository] melalui konstruktor.
  LoadDailyCheckInUseCase(this._repository);

  @override
  Future<List<DailyCheckIn>> call(NoParams params) {
    return _repository.getDailyCheckIns();
  }
}
