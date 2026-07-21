import 'package:equatable/equatable.dart';
import 'package:swpilot/features/dashboard/domain/domain.dart';

/// State immutable khusus untuk mengelola status pemuatan data check-in harian.
class DailyCheckInState extends Equatable {
  /// Menunjukkan apakah data sedang dalam proses pemuatan.
  final bool isLoading;

  /// Menampung data daftar check-in harian yang berhasil dimuat.
  final List<DailyCheckIn>? data;

  /// Menampung pesan kesalahan jika pemuatan data gagal.
  final String? error;

  /// Membuat instansi dari [DailyCheckInState].
  const DailyCheckInState({
    required this.isLoading,
    this.data,
    this.error,
  });

  /// Inisialisasi state awal (initial state).
  const DailyCheckInState.initial()
      : isLoading = false,
        data = null,
        error = null;

  /// State saat data sedang dimuat (loading state).
  const DailyCheckInState.loading()
      : isLoading = true,
        data = null,
        error = null;

  /// State saat data sukses dimuat (success state).
  const DailyCheckInState.success(this.data)
      : isLoading = false,
        error = null;

  /// State saat pemuatan data gagal (error state).
  const DailyCheckInState.error(this.error)
      : isLoading = false,
        data = null;

  @override
  List<Object?> get props => [isLoading, data, error];
}
