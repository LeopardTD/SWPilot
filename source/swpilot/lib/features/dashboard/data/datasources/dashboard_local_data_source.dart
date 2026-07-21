import 'package:swpilot/features/dashboard/domain/domain.dart';

/// Kontrak antarmuka untuk sumber data lokal (Local Data Source) fitur Dashboard.
abstract class DashboardLocalDataSource {
  /// Mengambil data ringkasan dashboard yang tersimpan secara lokal.
  Future<DashboardSummary> getDashboardSummary();

  /// Mengambil data status mesin otomatisasi yang tersimpan secara lokal.
  Future<AutomationStatus> getAutomationStatus();

  /// Mengambil daftar tugas check-in harian yang tersimpan secara lokal.
  Future<List<DailyCheckIn>> getDailyCheckIns();

  /// Mengambil ringkasan statistik pelaksanaan tugas yang tersimpan secara lokal.
  Future<StatisticsSummary> getStatisticsSummary();

  /// Mengambil daftar jadwal pelaksanaan tugas yang tersimpan secara lokal.
  Future<List<ScheduleSummary>> getScheduleSummaries();

  /// Mengambil daftar log/notifikasi sistem yang tersimpan secara lokal.
  Future<List<NotificationSummary>> getNotificationSummaries();

  /// Menyimpan seluruh data ringkasan dashboard ke penyimpanan lokal.
  Future<void> saveDashboardSummary(DashboardSummary summary);

  /// Menyimpan data status mesin otomatisasi ke penyimpanan lokal.
  Future<void> saveAutomationStatus(AutomationStatus status);

  /// Menyimpan daftar tugas check-in harian ke penyimpanan lokal.
  Future<void> saveDailyCheckIns(List<DailyCheckIn> checkIns);

  /// Menyimpan data ringkasan statistik ke penyimpanan lokal.
  Future<void> saveStatisticsSummary(StatisticsSummary statistics);

  /// Menyimpan daftar jadwal pelaksanaan tugas ke penyimpanan lokal.
  Future<void> saveScheduleSummaries(List<ScheduleSummary> schedules);

  /// Menyimpan daftar log/notifikasi sistem ke penyimpanan lokal.
  Future<void> saveNotificationSummaries(List<NotificationSummary> notifications);
}
