import 'package:swpilot/features/dashboard/data/datasources/dashboard_local_data_source.dart';
import 'package:swpilot/features/dashboard/domain/domain.dart';
import 'package:swpilot/services/logger/logger_service.dart';

/// Implementasi konkret dari [DashboardRepository] yang bertindak sebagai
/// penghubung antara domain layer dan local data source.
class DashboardRepositoryImpl implements DashboardRepository {
  final DashboardLocalDataSource _localDataSource;

  /// Membuat instansi dari [DashboardRepositoryImpl] dengan menyuntikkan
  /// [DashboardLocalDataSource] melalui konstruktor.
  DashboardRepositoryImpl(this._localDataSource);

  @override
  Future<DashboardSummary> getDashboardSummary() async {
    LoggerService.info('Repository: Memanggil getDashboardSummary');
    try {
      final result = await _localDataSource.getDashboardSummary();
      LoggerService.debug('Repository: Sukses memuat getDashboardSummary');
      return result;
    } on DashboardException catch (e, stackTrace) {
      LoggerService.warning('Repository: getDashboardSummary menemui domain exception', e, stackTrace);
      rethrow;
    } catch (e, stackTrace) {
      final storageException = StorageException('Gagal memuat ringkasan dashboard: $e');
      LoggerService.error('Repository: getDashboardSummary menemui kesalahan tidak dikenal', storageException, stackTrace);
      throw storageException;
    }
  }

  @override
  Future<AutomationStatus> getAutomationStatus() async {
    LoggerService.info('Repository: Memanggil getAutomationStatus');
    try {
      final result = await _localDataSource.getAutomationStatus();
      LoggerService.debug('Repository: Sukses memuat getAutomationStatus');
      return result;
    } on DashboardException catch (e, stackTrace) {
      LoggerService.warning('Repository: getAutomationStatus menemui domain exception', e, stackTrace);
      rethrow;
    } catch (e, stackTrace) {
      final storageException = StorageException('Gagal memuat status otomatisasi: $e');
      LoggerService.error('Repository: getAutomationStatus menemui kesalahan tidak dikenal', storageException, stackTrace);
      throw storageException;
    }
  }

  @override
  Future<List<DailyCheckIn>> getDailyCheckIns() async {
    LoggerService.info('Repository: Memanggil getDailyCheckIns');
    try {
      final result = await _localDataSource.getDailyCheckIns();
      LoggerService.debug('Repository: Sukses memuat getDailyCheckIns');
      return result;
    } on DashboardException catch (e, stackTrace) {
      LoggerService.warning('Repository: getDailyCheckIns menemui domain exception', e, stackTrace);
      rethrow;
    } catch (e, stackTrace) {
      final storageException = StorageException('Gagal memuat daftar check-in harian: $e');
      LoggerService.error('Repository: getDailyCheckIns menemui kesalahan tidak dikenal', storageException, stackTrace);
      throw storageException;
    }
  }

  @override
  Future<StatisticsSummary> getStatisticsSummary() async {
    LoggerService.info('Repository: Memanggil getStatisticsSummary');
    try {
      final result = await _localDataSource.getStatisticsSummary();
      LoggerService.debug('Repository: Sukses memuat getStatisticsSummary');
      return result;
    } on DashboardException catch (e, stackTrace) {
      LoggerService.warning('Repository: getStatisticsSummary menemui domain exception', e, stackTrace);
      rethrow;
    } catch (e, stackTrace) {
      final storageException = StorageException('Gagal memuat statistik dashboard: $e');
      LoggerService.error('Repository: getStatisticsSummary menemui kesalahan tidak dikenal', storageException, stackTrace);
      throw storageException;
    }
  }

  @override
  Future<List<ScheduleSummary>> getScheduleSummaries() async {
    LoggerService.info('Repository: Memanggil getScheduleSummaries');
    try {
      final result = await _localDataSource.getScheduleSummaries();
      LoggerService.debug('Repository: Sukses memuat getScheduleSummaries');
      return result;
    } on DashboardException catch (e, stackTrace) {
      LoggerService.warning('Repository: getScheduleSummaries menemui domain exception', e, stackTrace);
      rethrow;
    } catch (e, stackTrace) {
      final storageException = StorageException('Gagal memuat jadwal tugas: $e');
      LoggerService.error('Repository: getScheduleSummaries menemui kesalahan tidak dikenal', storageException, stackTrace);
      throw storageException;
    }
  }

  @override
  Future<List<NotificationSummary>> getNotificationSummaries() async {
    LoggerService.info('Repository: Memanggil getNotificationSummaries');
    try {
      final result = await _localDataSource.getNotificationSummaries();
      LoggerService.debug('Repository: Sukses memuat getNotificationSummaries');
      return result;
    } on DashboardException catch (e, stackTrace) {
      LoggerService.warning('Repository: getNotificationSummaries menemui domain exception', e, stackTrace);
      rethrow;
    } catch (e, stackTrace) {
      final storageException = StorageException('Gagal memuat daftar notifikasi: $e');
      LoggerService.error('Repository: getNotificationSummaries menemui kesalahan tidak dikenal', storageException, stackTrace);
      throw storageException;
    }
  }

  @override
  Future<DashboardSummary> refreshDashboard() async {
    LoggerService.info('Refresh Started');
    try {
      LoggerService.debug('Cache Read');
      final result = await _localDataSource.getDashboardSummary();
      
      LoggerService.debug('Cache Updated');
      await _localDataSource.saveDashboardSummary(result);
      
      LoggerService.info('Refresh Completed');
      return result;
    } on DashboardException catch (e, stackTrace) {
      LoggerService.warning('Refresh Failed: Domain exception', e, stackTrace);
      rethrow;
    } catch (e, stackTrace) {
      final storageException = StorageException('Gagal memperbarui data dashboard: $e');
      LoggerService.error('Refresh Failed: Kesalahan tidak dikenal', storageException, stackTrace);
      throw storageException;
    }
  }
}
