import 'package:flutter_test/flutter_test.dart';
import 'package:swpilot/features/automation/application/services/automation_session_manager.dart';
import 'package:swpilot/features/automation/domain/entities/automation_result.dart';
import 'package:swpilot/features/automation/domain/entities/automation_session.dart';
import 'package:swpilot/features/automation/domain/entities/automation_task.dart';
import 'package:swpilot/features/automation/domain/enums/automation_status.dart';
import 'package:swpilot/features/automation/domain/repositories/automation_repository.dart';
import 'package:swpilot/features/automation/domain/value_objects/session_id.dart';

class FakeAutomationRepository implements AutomationRepository {
  @override
  Future<AutomationSession> startAutomation({required AutomationTask task}) async {
    throw UnimplementedError();
  }

  @override
  Future<AutomationResult> stopAutomation({required SessionId sessionId}) async {
    throw UnimplementedError();
  }

  @override
  Future<AutomationSession> pauseAutomation({required SessionId sessionId}) async {
    throw UnimplementedError();
  }

  @override
  Future<AutomationSession> resumeAutomation({required SessionId sessionId}) async {
    throw UnimplementedError();
  }

  @override
  Future<AutomationStatus> getAutomationStatus() async {
    return AutomationStatus.idle;
  }

  @override
  Future<AutomationSession?> getActiveSession() async => null;

  @override
  Future<AutomationResult?> getAutomationResult({required SessionId sessionId}) async => null;
}

void main() {
  late FakeAutomationRepository repository;
  late AutomationSessionManager sessionManager;

  setUp(() {
    repository = FakeAutomationRepository();
    sessionManager = AutomationSessionManager(repository);
  });

  const sessionId1 = SessionId('session-001');
  const sessionId2 = SessionId('session-002');

  test('initial state has no active session', () {
    expect(sessionManager.hasActiveSession(), isFalse);
    expect(sessionManager.getActiveSession(), isNull);
  });

  test('createSession creates and sets active session when none exists', () async {
    final session = await sessionManager.createSession(sessionId: sessionId1);

    expect(session, isNotNull);
    expect(session!.sessionId, equals(sessionId1));
    expect(session.currentState, equals(AutomationStatus.running));
    expect(sessionManager.hasActiveSession(), isTrue);
    expect(sessionManager.getActiveSession(), equals(session));
  });

  test('createSession rejects creating a second session when one is active', () async {
    final session1 = await sessionManager.createSession(sessionId: sessionId1);
    expect(session1, isNotNull);

    final session2 = await sessionManager.createSession(sessionId: sessionId2);
    expect(session2, isNull);

    expect(sessionManager.getActiveSession()!.sessionId, equals(sessionId1));
  });

  test('closeSession closes active session and sets finishedAt timestamp', () async {
    await sessionManager.createSession(sessionId: sessionId1);

    final closedSession = await sessionManager.closeSession();
    expect(closedSession, isNotNull);
    expect(closedSession!.sessionId, equals(sessionId1));
    expect(closedSession.currentState, equals(AutomationStatus.completed));
    expect(closedSession.finishedAt, isNotNull);

    expect(sessionManager.hasActiveSession(), isFalse);
  });

  test('closeSession returns null if no session was active', () async {
    final closedSession = await sessionManager.closeSession();
    expect(closedSession, isNull);
  });

  test('clearSession removes active session reference from memory', () async {
    await sessionManager.createSession(sessionId: sessionId1);
    expect(sessionManager.hasActiveSession(), isTrue);

    sessionManager.clearSession();
    expect(sessionManager.hasActiveSession(), isFalse);
    expect(sessionManager.getActiveSession(), isNull);
  });
}
