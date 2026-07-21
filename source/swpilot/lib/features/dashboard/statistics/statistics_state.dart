import 'package:equatable/equatable.dart';
import 'package:swpilot/features/dashboard/domain/domain.dart';

/// State immutable khusus untuk mengelola status pemuatan data ringkasan statistik.
class StatisticsState extends Equatable {
  /// Menunjukkan apakah data sedang dalam proses pemuatan.
  final bool isLoading;

  /// Menampung data ringkasan statistik yang berhasil dimuat.
  final StatisticsSummary? data;

  /// Menampung pesan kesalahan jika pemuatan data gagal.
  final String? error;

  /// Membuat instansi dari [StatisticsState].
  const StatisticsState({
    required this.isLoading,
    this.data,
    this.error,
  });

  /// Inisialisasi state awal (initial state).
  const StatisticsState.initial()
      : isLoading = false,
        data = null,
        error = null;

  /// State saat data sedang dimuat (loading state).
  const StatisticsState.loading()
      : isLoading = true,
        data = null,
        error = null;

  /// State saat data sukses dimuat (success state).
  const StatisticsState.success(this.data)
      : isLoading = false,
        error = null;

  /// State saat pemuatan data gagal (error state).
  const StatisticsState.error(this.error)
      : isLoading = false,
        data = null;

  @override
  List<Object?> get props => [isLoading, data, error];
}
