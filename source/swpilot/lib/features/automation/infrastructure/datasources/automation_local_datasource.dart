import '../../domain/entities/automation_result.dart';
import '../../domain/entities/automation_session.dart';
import '../../domain/enums/automation_status.dart';
import '../../domain/value_objects/session_id.dart';

/// In-memory local data source for storing automation state, active session, and results.
///
/// Data persists strictly in RAM and resets when the app process is terminated.
class AutomationLocalDataSource {
  AutomationStatus _status = AutomationStatus.idle;
  AutomationSession? _activeSession;
  final Map<String, AutomationResult> _results = {};

  /// Gets current stored automation status.
  AutomationStatus getStatus() => _status;

  /// Updates stored automation status.
  void setStatus(AutomationStatus status) {
    _status = status;
  }

  /// Gets currently active automation session.
  AutomationSession? getActiveSession() => _activeSession;

  /// Updates active automation session.
  void setActiveSession(AutomationSession? session) {
    _activeSession = session;
  }

  /// Clears active automation session.
  void clearActiveSession() {
    _activeSession = null;
  }

  /// Gets stored automation result for [sessionId].
  AutomationResult? getResult(SessionId sessionId) {
    return _results[sessionId.value];
  }

  /// Saves an automation result for [sessionId].
  void saveResult(SessionId sessionId, AutomationResult result) {
    _results[sessionId.value] = result;
  }
}
