import 'package:flutter_test/flutter_test.dart';
import 'package:swpilot/core/errors/error_mapper.dart';
import 'package:swpilot/features/dashboard/domain/exceptions/dashboard_exception.dart';

class ConcreteDashboardException extends DashboardException {
  const ConcreteDashboardException(super.message);
}

void main() {
  group('ErrorMapper Tests', () {
    test('memetakan DataNotFoundException ke pesan yang sesuai', () {
      const exception = DataNotFoundException('Kustom msg');
      expect(ErrorMapper.mapToMessage(exception), 'Data tidak ditemukan.');
    });

    test('memetakan StorageException ke pesan yang sesuai', () {
      const exception = StorageException('Kustom msg');
      expect(ErrorMapper.mapToMessage(exception), 'Kegagalan penyimpanan lokal.');
    });

    test('memetakan NetworkException ke pesan yang sesuai', () {
      const exception = NetworkException('Kustom msg');
      expect(ErrorMapper.mapToMessage(exception), 'Koneksi jaringan bermasalah.');
    });

    test('memetakan DashboardException generik ke pesannya sendiri', () {
      const exception = ConcreteDashboardException('Pesan kesalahan dashboard.');
      expect(ErrorMapper.mapToMessage(exception), 'Pesan kesalahan dashboard.');
    });

    test('memetakan exception tak dikenal ke pesan fallback', () {
      final exception = Exception('Error sistem dasar.');
      expect(ErrorMapper.mapToMessage(exception), 'Terjadi kesalahan yang tidak diketahui.');
    });
  });
}
