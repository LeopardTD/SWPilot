import 'package:swpilot/features/dashboard/domain/entities/automation_status.dart';
import 'package:swpilot/features/dashboard/domain/entities/daily_checkin.dart';
import 'package:swpilot/features/dashboard/domain/entities/dashboard_summary.dart';
import 'package:swpilot/features/dashboard/domain/entities/notification_summary.dart';
import 'package:swpilot/features/dashboard/domain/entities/schedule_summary.dart';
import 'package:swpilot/features/dashboard/domain/entities/statistics_summary.dart';

/// Kontrak antarmuka untuk operasi data terkait fitur Dashboard.
abstract class DashboardRepository {
  /// Mengambil data ringkasan dashboard secara keseluruhan.
  Future<DashboardSummary> getDashboardSummary();

  /// Mengambil data status mesin otomatisasi saja.
  Future<AutomationStatus> getAutomationStatus();

  /// Mengambil daftar tugas check-in harian.
  Future<List<DailyCheckIn>> getDailyCheckIns();

  /// Mengambil ringkasan statistik pelaksanaan tugas.
  Future<StatisticsSummary> getStatisticsSummary();

  /// Mengambil daftar jadwal pelaksanaan tugas yang akan datang.
  Future<List<ScheduleSummary>> getScheduleSummaries();

  /// Mengambil daftar riwayat notifikasi sistem.
  Future<List<NotificationSummary>> getNotificationSummaries();

  /// Memicu pembaruan data dashboard dari sumber data eksternal
  /// dan mengembalikan data terbaru yang telah diperbarui.
  Future<DashboardSummary> refreshDashboard();
}
