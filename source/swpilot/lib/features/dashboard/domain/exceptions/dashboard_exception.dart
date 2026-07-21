/// Base exception class for SWPilot Dashboard domain errors.
abstract class DashboardException implements Exception {
  final String message;

  const DashboardException(this.message);

  @override
  String toString() => 'DashboardException: $message';
}

/// Exception thrown when requested dashboard data is not found.
class DataNotFoundException extends DashboardException {
  const DataNotFoundException([super.message = 'Dashboard data not found.']);
}

/// Exception thrown when local storage operations fail.
class StorageException extends DashboardException {
  const StorageException([super.message = 'Storage operation failed.']);
}

/// Exception thrown when network requests fail.
class NetworkException extends DashboardException {
  const NetworkException([super.message = 'Network request failed.']);
}
