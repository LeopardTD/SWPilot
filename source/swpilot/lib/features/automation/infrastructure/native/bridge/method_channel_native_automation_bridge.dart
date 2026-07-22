import 'package:flutter/services.dart';
import '../../../application/services/automation_error_mapper.dart';
import '../../../application/services/automation_logger.dart';
import '../constants/native_constants.dart';
import '../enums/native_operation.dart';
import '../models/native_request.dart';
import '../models/native_response.dart';
import 'native_automation_bridge.dart';

/// Concrete implementation of [NativeAutomationBridge] using Flutter [MethodChannel].
class MethodChannelNativeAutomationBridge implements NativeAutomationBridge {
  final MethodChannel _channel;
  final AutomationLogger? logger;
  final AutomationErrorMapper errorMapper;

  /// Creates a [MethodChannelNativeAutomationBridge] with optional custom [MethodChannel], [AutomationLogger], and [AutomationErrorMapper].
  MethodChannelNativeAutomationBridge({
    MethodChannel? channel,
    this.logger,
    this.errorMapper = const AutomationErrorMapper(),
  })  : _channel = channel ?? const MethodChannel(NativeConstants.automationChannel) {
    logger?.logSession('Method Channel Initialized: ${_channel.name}');
  }

  @override
  Future<NativeResponse> initialize() async {
    return executeOperation(
      const NativeRequest(operation: NativeOperation.initialize),
    );
  }

  @override
  Future<NativeResponse> executeOperation(NativeRequest request) async {
    logger?.logExecutor('MethodChannel Request Sent: ${request.operation.name}');

    try {
      final payload = {
        'operation': request.operation.name,
        'parameters': request.parameters,
      };

      final result = await _channel.invokeMethod<Map<dynamic, dynamic>>(
        request.operation.name,
        payload,
      );

      if (result == null) {
        logger?.logWarning('MethodChannel', 'MethodChannel Response Received: null');
        return const NativeResponse(
          success: false,
          message: 'Received null response from native platform',
        );
      }

      final response = NativeResponse(
        success: result['success'] as bool? ?? false,
        data: Map<String, dynamic>.from(result['data'] as Map? ?? {}),
        message: result['message'] as String? ?? '',
      );

      logger?.logExecutor('MethodChannel Response Received: ${response.success}');
      return response;
    } catch (e) {
      final failure = errorMapper.map(e);
      logger?.logError('MethodChannel', 'MethodChannel Request Failed: ${failure.message}', e);
      return NativeResponse(
        success: false,
        message: failure.message,
      );
    }
  }

  @override
  Future<bool> checkAvailability(NativeOperation operation) async {
    final response = await executeOperation(
      NativeRequest(
        operation: NativeOperation.checkAccessibility,
        parameters: {'targetOperation': operation.name},
      ),
    );
    return response.success;
  }

  @override
  Future<NativeResponse> getPlatformInfo() async {
    return executeOperation(
      const NativeRequest(operation: NativeOperation.getPlatformInfo),
    );
  }
}
