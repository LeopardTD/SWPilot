import 'package:swpilot/features/dashboard/domain/exceptions/dashboard_exception.dart';

/// Utilitas untuk memetakan objek kesalahan (Error/Exception) menjadi pesan ramah pengguna.
class ErrorMapper {
  ErrorMapper._();

  /// Memetakan objek pengecualian menjadi pesan teks yang ramah pengguna.
  static String mapToMessage(Object error) {
    if (error is DataNotFoundException) {
      return 'Data tidak ditemukan.';
    } else if (error is StorageException) {
      return 'Kegagalan penyimpanan lokal.';
    } else if (error is NetworkException) {
      return 'Koneksi jaringan bermasalah.';
    } else if (error is DashboardException) {
      return error.message;
    }
    return 'Terjadi kesalahan yang tidak diketahui.';
  }
}
