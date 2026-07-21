import 'package:equatable/equatable.dart';
import 'package:swpilot/features/dashboard/domain/domain.dart';

/// State immutable khusus untuk mengelola status pemuatan data status otomatisasi.
class AutomationStatusState extends Equatable {
  /// Menunjukkan apakah status sedang dalam proses pemuatan.
  final bool isLoading;

  /// Menampung data status otomatisasi yang berhasil dimuat.
  final AutomationStatus? data;

  /// Menampung pesan kesalahan jika pemuatan data gagal.
  final String? error;

  /// Membuat instansi dari [AutomationStatusState].
  const AutomationStatusState({
    required this.isLoading,
    this.data,
    this.error,
  });

  /// Inisialisasi state awal (initial state).
  const AutomationStatusState.initial()
      : isLoading = false,
        data = null,
        error = null;

  /// State saat data sedang dimuat (loading state).
  const AutomationStatusState.loading()
      : isLoading = true,
        data = null,
        error = null;

  /// State saat data sukses dimuat (success state).
  const AutomationStatusState.success(this.data)
      : isLoading = false,
        error = null;

  /// State saat pemuatan data gagal (error state).
  const AutomationStatusState.error(this.error)
      : isLoading = false,
        data = null;

  @override
  List<Object?> get props => [isLoading, data, error];
}
