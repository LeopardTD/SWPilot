import 'package:equatable/equatable.dart';
import '../enums/automation_status.dart';

/// Manages lifecycle state transitions for the Automation Engine.
///
/// Serves as the single source of truth for valid status transitions.
class AutomationStateMachine extends Equatable {
  final AutomationStatus currentState;

  const AutomationStateMachine({
    this.currentState = AutomationStatus.idle,
  });

  /// Checks whether transitioning from [currentState] to [nextState] is allowed.
  bool canTransitionTo(AutomationStatus nextState) {
    return isValidTransition(currentState, nextState);
  }

  /// Evaluates whether a transition from [from] status to [to] status is valid.
  static bool isValidTransition(AutomationStatus from, AutomationStatus to) {
    switch (from) {
      case AutomationStatus.idle:
        return to == AutomationStatus.preparing;
      case AutomationStatus.preparing:
        return to == AutomationStatus.running ||
            to == AutomationStatus.failed ||
            to == AutomationStatus.cancelled;
      case AutomationStatus.running:
        return to == AutomationStatus.paused ||
            to == AutomationStatus.completed ||
            to == AutomationStatus.failed ||
            to == AutomationStatus.cancelled;
      case AutomationStatus.paused:
        return to == AutomationStatus.running ||
            to == AutomationStatus.cancelled ||
            to == AutomationStatus.failed;
      case AutomationStatus.completed:
      case AutomationStatus.failed:
      case AutomationStatus.cancelled:
        return false;
    }
  }

  /// Attempts to transition to [nextState].
  ///
  /// Returns a new [AutomationStateMachine] with [nextState] if valid,
  /// or `null` if the transition is invalid.
  AutomationStateMachine? transitionTo(AutomationStatus nextState) {
    if (!canTransitionTo(nextState)) {
      return null;
    }
    return AutomationStateMachine(currentState: nextState);
  }

  @override
  List<Object?> get props => [currentState];
}
