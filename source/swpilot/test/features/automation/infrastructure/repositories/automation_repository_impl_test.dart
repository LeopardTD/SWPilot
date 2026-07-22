import 'package:flutter_test/flutter_test.dart';
import 'package:swpilot/features/automation/domain/entities/automation_task.dart';
import 'package:swpilot/features/automation/domain/enums/automation_status.dart';
import 'package:swpilot/features/automation/domain/value_objects/automation_id.dart';
import 'package:swpilot/features/automation/domain/value_objects/session_id.dart';
import 'package:swpilot/features/automation/domain/value_objects/task_name.dart';
import 'package:swpilot/features/automation/infrastructure/datasources/automation_local_datasource.dart';
import 'package:swpilot/features/automation/infrastructure/repositories/automation_repository_impl.dart';

void main() {
  late AutomationLocalDataSource localDataSource;
  late AutomationRepositoryImpl repository;

  setUp(() {
    localDataSource = AutomationLocalDataSource();
    repository = AutomationRepositoryImpl(localDataSource);
  });

  final task = AutomationTask(
    id: const AutomationId('task-123'),
    name: const TaskName('Test Execution Task'),
    description: 'Sample Task Description',
    status: AutomationStatus.idle,
    createdAt: DateTime(2026, 1, 1),
  );

  const sessionId = SessionId('session-task-123');

  test('startAutomation creates a new running session and updates local datasource state', () async {
    final session = await repository.startAutomation(task: task);

    expect(session.sessionId, equals(sessionId));
    expect(session.currentState, equals(AutomationStatus.running));

    final currentStatus = await repository.getAutomationStatus();
    expect(currentStatus, equals(AutomationStatus.running));

    final activeSession = await repository.getActiveSession();
    expect(activeSession, equals(session));
  });

  test('pauseAutomation updates session and datasource status to paused', () async {
    await repository.startAutomation(task: task);

    final session = await repository.pauseAutomation(sessionId: sessionId);
    expect(session.currentState, equals(AutomationStatus.paused));

    final currentStatus = await repository.getAutomationStatus();
    expect(currentStatus, equals(AutomationStatus.paused));
  });

  test('resumeAutomation updates session and datasource status to running', () async {
    await repository.startAutomation(task: task);
    await repository.pauseAutomation(sessionId: sessionId);

    final session = await repository.resumeAutomation(sessionId: sessionId);
    expect(session.currentState, equals(AutomationStatus.running));

    final currentStatus = await repository.getAutomationStatus();
    expect(currentStatus, equals(AutomationStatus.running));
  });

  test('stopAutomation updates status to cancelled and saves result', () async {
    await repository.startAutomation(task: task);

    final result = await repository.stopAutomation(sessionId: sessionId);
    expect(result.success, isTrue);
    expect(result.message, contains('session-task-123'));

    final currentStatus = await repository.getAutomationStatus();
    expect(currentStatus, equals(AutomationStatus.cancelled));

    final savedResult = await repository.getAutomationResult(sessionId: sessionId);
    expect(savedResult, equals(result));
  });
}
