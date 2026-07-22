import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:swpilot/features/automation/application/providers/native_automation_bridge_provider.dart';
import 'package:swpilot/features/automation/application/services/automation_logger.dart';
import 'package:swpilot/features/automation/infrastructure/native/bridge/method_channel_native_automation_bridge.dart';
import 'package:swpilot/features/automation/infrastructure/native/bridge/native_automation_bridge.dart';
import 'package:swpilot/features/automation/infrastructure/native/constants/native_constants.dart';
import 'package:swpilot/features/automation/infrastructure/native/enums/native_operation.dart';
import 'package:swpilot/features/automation/infrastructure/native/models/native_request.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late MethodChannel channel;
  late MethodChannelNativeAutomationBridge bridge;
  const logger = AutomationLogger();

  setUp(() {
    channel = const MethodChannel(NativeConstants.automationChannel);
    bridge = MethodChannelNativeAutomationBridge(
      channel: channel,
      logger: logger,
    );

    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, (MethodCall call) async {
      if (call.method == NativeOperation.initialize.name) {
        return {'success': true, 'message': 'Initialized'};
      }
      if (call.method == NativeOperation.getPlatformInfo.name) {
        return {
          'success': true,
          'message': 'Platform OK',
          'data': {'os': 'Android'},
        };
      }
      if (call.method == NativeOperation.checkAccessibility.name) {
        return {'success': true, 'message': 'Available'};
      }
      if (call.method == 'failingOperation') {
        throw PlatformException(code: 'ERROR', message: 'Platform failure');
      }
      return null;
    });
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, null);
  });

  test('initialize executes method channel correctly', () async {
    final response = await bridge.initialize();
    expect(response.success, isTrue);
    expect(response.message, equals('Initialized'));
  });

  test('getPlatformInfo returns platform data from method channel', () async {
    final response = await bridge.getPlatformInfo();
    expect(response.success, isTrue);
    expect(response.data['os'], equals('Android'));
  });

  test('checkAvailability returns true when native operation succeeds', () async {
    final isAvailable = await bridge.checkAvailability(NativeOperation.executeAction);
    expect(isAvailable, isTrue);
  });

  test('executeOperation handles null channel response gracefully', () async {
    final response = await bridge.executeOperation(
      const NativeRequest(operation: NativeOperation.stopAutomation),
    );
    expect(response.success, isFalse);
    expect(response.message, contains('null'));
  });

  test('executeOperation handles platform exception gracefully', () async {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, (MethodCall call) async {
      throw PlatformException(code: 'ERR', message: 'Platform Error');
    });

    final response = await bridge.executeOperation(
      const NativeRequest(operation: NativeOperation.executeAction),
    );
    expect(response.success, isFalse);
  });

  test('nativeAutomationBridgeProvider resolves to MethodChannelNativeAutomationBridge', () {
    final container = ProviderContainer();
    addTearDown(container.dispose);

    final resolved = container.read(nativeAutomationBridgeProvider);
    expect(resolved, isA<NativeAutomationBridge>());
    expect(resolved, isA<MethodChannelNativeAutomationBridge>());
  });
}
