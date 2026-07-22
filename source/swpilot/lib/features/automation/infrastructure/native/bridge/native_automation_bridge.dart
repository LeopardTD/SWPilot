import '../enums/native_operation.dart';
import '../models/native_request.dart';
import '../models/native_response.dart';

/// Abstract contract defining high-level operations for communicating with the native platform.
abstract class NativeAutomationBridge {
  /// Initializes the native platform bridge.
  Future<NativeResponse> initialize();

  /// Executes a specific native operation defined by [request].
  Future<NativeResponse> executeOperation(NativeRequest request);

  /// Checks availability of native automation features/permissions for [operation].
  Future<bool> checkAvailability(NativeOperation operation);

  /// Retrieves platform information.
  Future<NativeResponse> getPlatformInfo();
}
