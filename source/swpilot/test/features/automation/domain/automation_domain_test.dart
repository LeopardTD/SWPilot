import 'package:flutter_test/flutter_test.dart';
import 'package:swpilot/features/automation/domain/entities/automation_result.dart';
import 'package:swpilot/features/automation/domain/entities/automation_session.dart';
import 'package:swpilot/features/automation/domain/entities/automation_task.dart';
import 'package:swpilot/features/automation/domain/enums/automation_status.dart';
import 'package:swpilot/features/automation/domain/enums/automation_task_type.dart';
import 'package:swpilot/features/automation/domain/value_objects/automation_id.dart';
import 'package:swpilot/features/automation/domain/value_objects/session_id.dart';
import 'package:swpilot/features/automation/domain/value_objects/task_name.dart';

void main() {
  group('Automation Domain Enums', () {
    test('AutomationStatus values check', () {
      expect(AutomationStatus.values, contains(AutomationStatus.idle));
      expect(AutomationStatus.values, contains(AutomationStatus.preparing));
      expect(AutomationStatus.values, contains(AutomationStatus.running));
      expect(AutomationStatus.values, contains(AutomationStatus.paused));
      expect(AutomationStatus.values, contains(AutomationStatus.completed));
      expect(AutomationStatus.values, contains(AutomationStatus.failed));
      expect(AutomationStatus.values, contains(AutomationStatus.cancelled));
    });

    test('AutomationTaskType values check', () {
      expect(AutomationTaskType.values, contains(AutomationTaskType.generic));
      expect(AutomationTaskType.values, contains(AutomationTaskType.login));
      expect(AutomationTaskType.values, contains(AutomationTaskType.checkIn));
      expect(AutomationTaskType.values, contains(AutomationTaskType.navigation));
      expect(AutomationTaskType.values, contains(AutomationTaskType.validation));
    });
  });

  group('Automation Value Objects', () {
    test('AutomationId supports value equality and toString', () {
      const id1 = AutomationId('auto-123');
      const id2 = AutomationId('auto-123');
      const id3 = AutomationId('auto-456');

      expect(id1, equals(id2));
      expect(id1, isNot(equals(id3)));
      expect(id1.toString(), 'auto-123');
    });

    test('SessionId supports value equality and toString', () {
      const s1 = SessionId('sess-001');
      const s2 = SessionId('sess-001');
      const s3 = SessionId('sess-002');

      expect(s1, equals(s2));
      expect(s1, isNot(equals(s3)));
      expect(s1.toString(), 'sess-001');
    });

    test('TaskName supports value equality and toString', () {
      const name1 = TaskName('Auto Check-In');
      const name2 = TaskName('Auto Check-In');
      const name3 = TaskName('Auto Login');

      expect(name1, equals(name2));
      expect(name1, isNot(equals(name3)));
      expect(name1.toString(), 'Auto Check-In');
    });
  });

  group('Automation Entities', () {
    final now = DateTime(2026, 1, 1, 10, 0);

    test('AutomationTask supports value equality and copyWith', () {
      final task1 = AutomationTask(
        id: const AutomationId('task-1'),
        name: const TaskName('Check In Task'),
        description: 'Daily Check In',
        status: AutomationStatus.idle,
        type: AutomationTaskType.checkIn,
        createdAt: now,
      );

      final task2 = AutomationTask(
        id: const AutomationId('task-1'),
        name: const TaskName('Check In Task'),
        description: 'Daily Check In',
        status: AutomationStatus.idle,
        type: AutomationTaskType.checkIn,
        createdAt: now,
      );

      expect(task1, equals(task2));

      final updated = task1.copyWith(status: AutomationStatus.running);
      expect(updated.status, AutomationStatus.running);
      expect(updated.id, task1.id);
    });

    test('AutomationSession supports value equality and copyWith', () {
      final session1 = AutomationSession(
        sessionId: const SessionId('sess-1'),
        startedAt: now,
        currentState: AutomationStatus.running,
      );

      final session2 = AutomationSession(
        sessionId: const SessionId('sess-1'),
        startedAt: now,
        currentState: AutomationStatus.running,
      );

      expect(session1, equals(session2));

      final finishedAt = now.add(const Duration(minutes: 5));
      final updated = session1.copyWith(
        currentState: AutomationStatus.completed,
        finishedAt: finishedAt,
      );

      expect(updated.currentState, AutomationStatus.completed);
      expect(updated.finishedAt, finishedAt);
      expect(updated.sessionId, session1.sessionId);
    });

    test('AutomationResult supports value equality and copyWith', () {
      final result1 = AutomationResult(
        success: true,
        message: 'Task completed successfully',
        finishedAt: now,
      );

      final result2 = AutomationResult(
        success: true,
        message: 'Task completed successfully',
        finishedAt: now,
      );

      expect(result1, equals(result2));

      final updated = result1.copyWith(success: false, message: 'Failed');
      expect(updated.success, isFalse);
      expect(updated.message, 'Failed');
      expect(updated.finishedAt, now);
    });
  });
}
