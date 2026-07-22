import 'package:equatable/equatable.dart';
import '../enums/automation_status.dart';
import '../value_objects/session_id.dart';

/// Represents an automation session entity in the domain.
class AutomationSession extends Equatable {
  final SessionId sessionId;
  final DateTime startedAt;
  final DateTime? finishedAt;
  final AutomationStatus currentState;

  const AutomationSession({
    required this.sessionId,
    required this.startedAt,
    this.finishedAt,
    required this.currentState,
  });

  AutomationSession copyWith({
    SessionId? sessionId,
    DateTime? startedAt,
    DateTime? finishedAt,
    AutomationStatus? currentState,
  }) {
    return AutomationSession(
      sessionId: sessionId ?? this.sessionId,
      startedAt: startedAt ?? this.startedAt,
      finishedAt: finishedAt ?? this.finishedAt,
      currentState: currentState ?? this.currentState,
    );
  }

  @override
  List<Object?> get props => [sessionId, startedAt, finishedAt, currentState];
}
