import 'package:flutter_test/flutter_test.dart';
import 'package:swpilot/features/automation/application/services/automation_pipeline.dart';
import 'package:swpilot/features/automation/domain/entities/automation_session.dart';
import 'package:swpilot/features/automation/domain/entities/automation_task.dart';
import 'package:swpilot/features/automation/domain/enums/automation_status.dart';
import 'package:swpilot/features/automation/domain/enums/automation_task_type.dart';
import 'package:swpilot/features/automation/domain/value_objects/automation_id.dart';
import 'package:swpilot/features/automation/domain/value_objects/session_id.dart';
import 'package:swpilot/features/automation/domain/value_objects/task_name.dart';

void main() {
  late AutomationPipeline pipeline;

  setUp(() {
    pipeline = AutomationPipeline();
  });

  final validTask = AutomationTask(
    id: const AutomationId('task-001'),
    name: const TaskName('Valid Pipeline Task'),
    description: 'Sample task for pipeline',
    status: AutomationStatus.idle,
    type: AutomationTaskType.login,
    createdAt: DateTime(2026, 1, 1),
  );

  final failedTask = AutomationTask(
    id: const AutomationId('task-002'),
    name: const TaskName('Failed Task'),
    description: 'Task with failed status',
    status: AutomationStatus.failed,
    type: AutomationTaskType.generic,
    createdAt: DateTime(2026, 1, 1),
  );

  final session = AutomationSession(
    sessionId: const SessionId('sess-100'),
    startedAt: DateTime(2026, 1, 1),
    currentState: AutomationStatus.running,
  );

  test('validate returns true for valid task and false for null or failed task', () {
    expect(pipeline.validate(validTask, session: session), isTrue);
    expect(pipeline.validate(null, session: session), isFalse);
    expect(pipeline.validate(failedTask, session: session), isFalse);
  });

  test('prepare returns true for valid task', () {
    expect(pipeline.prepare(validTask), isTrue);
  });

  test('process produces a PipelineResult with isReady true for valid task', () {
    final result = pipeline.process(validTask, session: session);

    expect(result.task, equals(validTask));
    expect(result.isReady, isTrue);
    expect(result.message, contains('successfully'));
    expect(pipeline.isReady(result), isTrue);
  });

  test('process produces a PipelineResult with isReady false for invalid task', () {
    final result = pipeline.process(failedTask, session: session);

    expect(result.task, equals(failedTask));
    expect(result.isReady, isFalse);
    expect(result.message, contains('failed'));
    expect(pipeline.isReady(result), isFalse);
  });
}
