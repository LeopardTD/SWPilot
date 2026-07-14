/// Defines the operational environment modes for the application.
enum EnvironmentType {
  /// Dev environment (local testing features, mock data).
  development,

  /// Debug environment (active profiling and debug logs).
  debug,

  /// Release environment (production bundle ready).
  release,
}

/// Stores environment configuration configurations.
class Environment {
  Environment._();

  static EnvironmentType _current = EnvironmentType.development;

  /// Gets the current operational environment.
  static EnvironmentType get current => _current;

  /// Initializes the environment configuration.
  static void initialize(EnvironmentType type) {
    _current = type;
  }

  /// Returns true if current environment is Development.
  static bool get isDev => _current == EnvironmentType.development;

  /// Returns true if current environment is Debug.
  static bool get isDebug => _current == EnvironmentType.debug;

  /// Returns true if current environment is Release.
  static bool get isRelease => _current == EnvironmentType.release;
}
