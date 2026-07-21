import 'package:equatable/equatable.dart';

/// Represents the execution status of a daily check-in for a game.
enum DailyCheckInStatus {
  pending,
  completed,
  failed,
}

/// Domain entity representing a daily check-in task.
class DailyCheckIn extends Equatable {
  final String gameName;
  final String initials;
  final DailyCheckInStatus status;

  const DailyCheckIn({
    required this.gameName,
    required this.initials,
    required this.status,
  });

  @override
  List<Object?> get props => [gameName, initials, status];
}
