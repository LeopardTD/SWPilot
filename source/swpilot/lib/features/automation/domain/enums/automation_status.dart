/// Represents the execution state of the automation engine.
enum AutomationStatus {
  idle,
  preparing,
  running,
  paused,
  completed,
  failed,
  cancelled,
}
