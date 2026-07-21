import 'package:equatable/equatable.dart';
import 'package:swpilot/features/dashboard/domain/domain.dart';

/// State immutable khusus untuk mengelola status pemuatan data daftar jadwal penugasan.
class ScheduleState extends Equatable {
  /// Menunjukkan apakah data sedang dalam proses pemuatan.
  final bool isLoading;

  /// Menampung data daftar jadwal penugasan yang berhasil dimuat.
  final List<ScheduleSummary>? data;

  /// Menampung pesan kesalahan jika pemuatan data gagal.
  final String? error;

  /// Membuat instansi dari [ScheduleState].
  const ScheduleState({
    required this.isLoading,
    this.data,
    this.error,
  });

  /// Inisialisasi state awal (initial state).
  const ScheduleState.initial()
      : isLoading = false,
        data = null,
        error = null;

  /// State saat data sedang dimuat (loading state).
  const ScheduleState.loading()
      : isLoading = true,
        data = null,
        error = null;

  /// State saat data sukses dimuat (success state).
  const ScheduleState.success(this.data)
      : isLoading = false,
        error = null;

  /// State saat pemuatan data gagal (error state).
  const ScheduleState.error(this.error)
      : isLoading = false,
        data = null;

  @override
  List<Object?> get props => [isLoading, data, error];
}
