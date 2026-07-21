import 'package:equatable/equatable.dart';

/// Represents the type of notification/log message.
enum NotificationType {
  information,
  success,
  reminder,
}

/// Domain entity representing a system notification/log summary.
class NotificationSummary extends Equatable {
  final NotificationType type;
  final String message;
  final DateTime timestamp;

  const NotificationSummary({
    required this.type,
    required this.message,
    required this.timestamp,
  });

  @override
  List<Object?> get props => [type, message, timestamp];
}
