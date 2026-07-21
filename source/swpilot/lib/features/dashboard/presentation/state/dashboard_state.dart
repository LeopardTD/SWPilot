import 'package:equatable/equatable.dart';
import 'package:swpilot/features/dashboard/domain/domain.dart';

/// State immutable untuk mengelola siklus pemuatan data pada Dashboard.
class DashboardState extends Equatable {
  /// Menunjukkan apakah data sedang dalam proses pemuatan awal.
  final bool isLoading;

  /// Menunjukkan apakah data sedang dalam proses penyegaran/sinkronisasi ulang di latar belakang.
  final bool isRefreshing;

  /// Menampung data ringkasan dashboard yang berhasil dimuat.
  final DashboardSummary? data;

  /// Menampung pesan kesalahan jika pemuatan data gagal.
  final String? error;

  /// Membuat instansi dari [DashboardState].
  const DashboardState({
    required this.isLoading,
    this.isRefreshing = false,
    this.data,
    this.error,
  });

  /// Inisialisasi state awal (initial state).
  const DashboardState.initial()
      : isLoading = false,
        isRefreshing = false,
        data = null,
        error = null;

  /// State saat data sedang dimuat awal (loading state).
  const DashboardState.loading()
      : isLoading = true,
        isRefreshing = false,
        data = null,
        error = null;

  /// State saat data sedang disegarkan di latar belakang (refreshing state).
  const DashboardState.refreshing(this.data)
      : isLoading = false,
        isRefreshing = true,
        error = null;

  /// State saat data sukses dimuat (success state).
  const DashboardState.success(this.data)
      : isLoading = false,
        isRefreshing = false,
        error = null;

  /// State saat pemuatan data gagal (error state).
  const DashboardState.error(this.error, {this.data})
      : isLoading = false,
        isRefreshing = false;

  @override
  List<Object?> get props => [isLoading, isRefreshing, data, error];
}
