import 'package:equatable/equatable.dart';
import 'package:swpilot/features/dashboard/domain/domain.dart';

/// State immutable khusus untuk mengelola status pemuatan data daftar notifikasi dan aktivitas.
class NotificationState extends Equatable {
  /// Menunjukkan apakah data sedang dalam proses pemuatan.
  final bool isLoading;

  /// Menampung data daftar notifikasi/aktivitas yang berhasil dimuat.
  final List<NotificationSummary>? data;

  /// Menampung pesan kesalahan jika pemuatan data gagal.
  final String? error;

  /// Membuat instansi dari [NotificationState].
  const NotificationState({
    required this.isLoading,
    this.data,
    this.error,
  });

  /// Inisialisasi state awal (initial state).
  const NotificationState.initial()
      : isLoading = false,
        data = null,
        error = null;

  /// State saat data sedang dimuat (loading state).
  const NotificationState.loading()
      : isLoading = true,
        data = null,
        error = null;

  /// State saat data sukses dimuat (success state).
  const NotificationState.success(this.data)
      : isLoading = false,
        error = null;

  /// State saat pemuatan data gagal (error state).
  const NotificationState.error(this.error)
      : isLoading = false,
        data = null;

  @override
  List<Object?> get props => [isLoading, data, error];
}
