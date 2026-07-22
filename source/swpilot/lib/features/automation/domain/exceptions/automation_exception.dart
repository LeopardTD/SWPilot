/// Base exception class for all automation-related exceptions.
abstract class AutomationException implements Exception {
  final String message;
  final Object? cause;
  final DateTime timestamp;

  AutomationException(
    this.message, [
    this.cause,
    DateTime? timestamp,
  ]) : timestamp = timestamp ?? DateTime.now();

  @override
  String toString() => '$runtimeType: $message${cause != null ? ' (Cause: $cause)' : ''}';
}
