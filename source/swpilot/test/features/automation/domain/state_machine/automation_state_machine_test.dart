import 'package:flutter_test/flutter_test.dart';
import 'package:swpilot/features/automation/domain/enums/automation_status.dart';
import 'package:swpilot/features/automation/domain/state_machine/automation_state_machine.dart';

void main() {
  group('AutomationStateMachine Initial State', () {
    test('default initial state is AutomationStatus.idle', () {
      const stateMachine = AutomationStateMachine();
      expect(stateMachine.currentState, equals(AutomationStatus.idle));
    });
  });

  group('AutomationStateMachine Allowed Transitions', () {
    test('idle -> preparing', () {
      const stateMachine = AutomationStateMachine(currentState: AutomationStatus.idle);
      expect(stateMachine.canTransitionTo(AutomationStatus.preparing), isTrue);

      final next = stateMachine.transitionTo(AutomationStatus.preparing);
      expect(next, isNotNull);
      expect(next!.currentState, equals(AutomationStatus.preparing));
    });

    test('preparing -> running, failed, cancelled', () {
      const stateMachine = AutomationStateMachine(currentState: AutomationStatus.preparing);

      expect(stateMachine.canTransitionTo(AutomationStatus.running), isTrue);
      expect(stateMachine.canTransitionTo(AutomationStatus.failed), isTrue);
      expect(stateMachine.canTransitionTo(AutomationStatus.cancelled), isTrue);

      expect(stateMachine.transitionTo(AutomationStatus.running)?.currentState, equals(AutomationStatus.running));
      expect(stateMachine.transitionTo(AutomationStatus.failed)?.currentState, equals(AutomationStatus.failed));
      expect(stateMachine.transitionTo(AutomationStatus.cancelled)?.currentState, equals(AutomationStatus.cancelled));
    });

    test('running -> paused, completed, failed, cancelled', () {
      const stateMachine = AutomationStateMachine(currentState: AutomationStatus.running);

      expect(stateMachine.canTransitionTo(AutomationStatus.paused), isTrue);
      expect(stateMachine.canTransitionTo(AutomationStatus.completed), isTrue);
      expect(stateMachine.canTransitionTo(AutomationStatus.failed), isTrue);
      expect(stateMachine.canTransitionTo(AutomationStatus.cancelled), isTrue);

      expect(stateMachine.transitionTo(AutomationStatus.paused)?.currentState, equals(AutomationStatus.paused));
      expect(stateMachine.transitionTo(AutomationStatus.completed)?.currentState, equals(AutomationStatus.completed));
      expect(stateMachine.transitionTo(AutomationStatus.failed)?.currentState, equals(AutomationStatus.failed));
      expect(stateMachine.transitionTo(AutomationStatus.cancelled)?.currentState, equals(AutomationStatus.cancelled));
    });

    test('paused -> running, cancelled, failed', () {
      const stateMachine = AutomationStateMachine(currentState: AutomationStatus.paused);

      expect(stateMachine.canTransitionTo(AutomationStatus.running), isTrue);
      expect(stateMachine.canTransitionTo(AutomationStatus.cancelled), isTrue);
      expect(stateMachine.canTransitionTo(AutomationStatus.failed), isTrue);

      expect(stateMachine.transitionTo(AutomationStatus.running)?.currentState, equals(AutomationStatus.running));
      expect(stateMachine.transitionTo(AutomationStatus.cancelled)?.currentState, equals(AutomationStatus.cancelled));
      expect(stateMachine.transitionTo(AutomationStatus.failed)?.currentState, equals(AutomationStatus.failed));
    });
  });

  group('AutomationStateMachine Disallowed Transitions', () {
    test('idle cannot transition directly to running, paused, completed, etc.', () {
      const stateMachine = AutomationStateMachine(currentState: AutomationStatus.idle);

      expect(stateMachine.canTransitionTo(AutomationStatus.running), isFalse);
      expect(stateMachine.canTransitionTo(AutomationStatus.paused), isFalse);
      expect(stateMachine.canTransitionTo(AutomationStatus.completed), isFalse);
      expect(stateMachine.canTransitionTo(AutomationStatus.failed), isFalse);
      expect(stateMachine.canTransitionTo(AutomationStatus.cancelled), isFalse);

      expect(stateMachine.transitionTo(AutomationStatus.running), isNull);
    });

    test('preparing cannot transition to paused or completed', () {
      const stateMachine = AutomationStateMachine(currentState: AutomationStatus.preparing);

      expect(stateMachine.canTransitionTo(AutomationStatus.paused), isFalse);
      expect(stateMachine.canTransitionTo(AutomationStatus.completed), isFalse);
      expect(stateMachine.transitionTo(AutomationStatus.completed), isNull);
    });

    test('paused cannot transition to preparing or completed directly', () {
      const stateMachine = AutomationStateMachine(currentState: AutomationStatus.paused);

      expect(stateMachine.canTransitionTo(AutomationStatus.preparing), isFalse);
      expect(stateMachine.canTransitionTo(AutomationStatus.completed), isFalse);
    });

    test('terminal states (completed, failed, cancelled) allow no further transitions', () {
      for (final terminalState in [
        AutomationStatus.completed,
        AutomationStatus.failed,
        AutomationStatus.cancelled,
      ]) {
        final stateMachine = AutomationStateMachine(currentState: terminalState);
        for (final target in AutomationStatus.values) {
          expect(stateMachine.canTransitionTo(target), isFalse, reason: '$terminalState -> $target should be disallowed');
          expect(stateMachine.transitionTo(target), isNull);
        }
      }
    });
  });
}
