import 'package:swpilot/core/usecases/usecase.dart';
import 'package:swpilot/features/dashboard/domain/domain.dart';

/// Use case untuk memuat daftar ringkasan log notifikasi sistem [NotificationSummary].
class LoadNotificationsUseCase implements UseCase<List<NotificationSummary>, NoParams> {
  final DashboardRepository _repository;

  /// Membuat instansi dari [LoadNotificationsUseCase] dengan menyuntikkan
  /// [DashboardRepository] melalui konstruktor.
  LoadNotificationsUseCase(this._repository);

  @override
  Future<List<NotificationSummary>> call(NoParams params) {
    return _repository.getNotificationSummaries();
  }
}
