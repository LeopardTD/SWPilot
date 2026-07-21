/// Kelas dasar abstrak (Base Use Case) untuk mendefinisikan kontrak eksekusi
/// alur proses bisnis di tingkat Application Layer.
abstract class UseCase<T, Params> {
  /// Mengeksekusi use case dengan parameter yang ditentukan secara asinkron.
  Future<T> call(Params params);
}

/// Kelas representasi penampung parameter kosong untuk use case yang tidak
/// membutuhkan parameter input.
class NoParams {
  /// Membuat instansi dari [NoParams].
  const NoParams();
}
