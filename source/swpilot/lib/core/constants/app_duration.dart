/// Centralizes commonly used durations throughout the application to avoid magic numbers.
class AppDuration {
  AppDuration._();

  /// Very fast transition duration (150ms).
  static const Duration fast = Duration(milliseconds: 150);

  /// Normal/default transition duration (300ms).
  static const Duration normal = Duration(milliseconds: 300);

  /// Medium transition or short timeout duration (500ms).
  static const Duration medium = Duration(milliseconds: 500);

  /// Slow animation or delay duration (1000ms).
  static const Duration slow = Duration(milliseconds: 1000);

  /// Extra slow animation or splash screen delay duration (2500ms).
  static const Duration extraSlow = Duration(milliseconds: 2500);
}
