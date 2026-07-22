import '../../domain/entities/automation_session.dart';
import '../../domain/enums/automation_status.dart';
import '../../domain/repositories/automation_repository.dart';
import '../../domain/value_objects/session_id.dart';
import 'automation_logger.dart';

/// Manages the lifecycle of automation sessions.
///
/// Ensures single active session constraint and coordinates session initialization,
/// retrieval, closing, and clearance.
class AutomationSessionManager {
  final AutomationRepository _repository;
  final AutomationLogger? _logger;
  AutomationSession? _activeSession;

  /// Reference to the injected repository.
  AutomationRepository get repository => _repository;

  /// Creates an [AutomationSessionManager] by injecting [AutomationRepository] and optional [AutomationLogger].
  AutomationSessionManager(this._repository, {this._logger});

  /// Checks if there is currently an active session.
  bool hasActiveSession() => _activeSession != null;

  /// Retrieves the currently active session, if any.
  AutomationSession? getActiveSession() => _activeSession;

  /// Creates and starts a new automation session with [sessionId].
  ///
  /// Returns the newly created [AutomationSession], or `null` if a session is already active.
  Future<AutomationSession?> createSession({required SessionId sessionId}) async {
    if (hasActiveSession()) {
      _logger?.logSession('Failed to create session ${sessionId.value}: Active session already exists.');
      return null;
    }

    final newSession = AutomationSession(
      sessionId: sessionId,
      startedAt: DateTime.now(),
      currentState: AutomationStatus.running,
    );

    _activeSession = newSession;
    _logger?.logSession('Session Created: ${sessionId.value}');
    return newSession;
  }

  /// Closes the active session and marks it as completed.
  ///
  /// Returns the closed [AutomationSession], or `null` if no session was active.
  Future<AutomationSession?> closeSession() async {
    if (!hasActiveSession()) {
      _logger?.logSession('Failed to close session: No active session found.');
      return null;
    }

    final closedSession = _activeSession!.copyWith(
      currentState: AutomationStatus.completed,
      finishedAt: DateTime.now(),
    );

    final sessionIdVal = _activeSession!.sessionId.value;
    _activeSession = null;
    _logger?.logSession('Session Closed: $sessionIdVal');
    return closedSession;
  }

  /// Clears the active session reference from memory without performing close logic.
  void clearSession() {
    _logger?.logSession('Session Cleared.');
    _activeSession = null;
  }
}
