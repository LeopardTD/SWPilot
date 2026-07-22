import 'package:flutter_test/flutter_test.dart';
import 'package:swpilot/features/automation/infrastructure/native/bridge/native_automation_bridge.dart';
import 'package:swpilot/features/automation/infrastructure/native/enums/native_operation.dart';
import 'package:swpilot/features/automation/infrastructure/native/models/native_request.dart';
import 'package:swpilot/features/automation/infrastructure/native/models/native_response.dart';

class MockNativeAutomationBridge implements NativeAutomationBridge {
  @override
  Future<NativeResponse> initialize() async {
    return const NativeResponse(success: true, message: 'Initialized mock');
  }

  @override
  Future<NativeResponse> executeOperation(NativeRequest request) async {
    return NativeResponse(
      success: true,
      message: 'Executed ${request.operation.name}',
      data: request.parameters,
    );
  }

  @override
  Future<bool> checkAvailability(NativeOperation operation) async {
    return true;
  }

  @override
  Future<NativeResponse> getPlatformInfo() async {
    return const NativeResponse(
      success: true,
      data: {'platform': 'mock_android'},
    );
  }
}

void main() {
  test('NativeRequest supports instantiation and equality', () {
    const req1 = NativeRequest(
      operation: NativeOperation.startAutomation,
      parameters: {'taskId': '123'},
    );
    const req2 = NativeRequest(
      operation: NativeOperation.startAutomation,
      parameters: {'taskId': '123'},
    );

    expect(req1, equals(req2));
    expect(req1.operation, equals(NativeOperation.startAutomation));
    expect(req1.parameters['taskId'], equals('123'));
  });

  test('NativeResponse supports instantiation and equality', () {
    const res1 = NativeResponse(
      success: true,
      message: 'OK',
      data: {'key': 'val'},
    );
    const res2 = NativeResponse(
      success: true,
      message: 'OK',
      data: {'key': 'val'},
    );

    expect(res1, equals(res2));
    expect(res1.success, isTrue);
    expect(res1.message, equals('OK'));
  });

  test('NativeOperation contains expected enum values', () {
    expect(NativeOperation.values, contains(NativeOperation.initialize));
    expect(NativeOperation.values, contains(NativeOperation.checkPermission));
    expect(NativeOperation.values, contains(NativeOperation.checkAccessibility));
    expect(NativeOperation.values, contains(NativeOperation.startAutomation));
    expect(NativeOperation.values, contains(NativeOperation.stopAutomation));
    expect(NativeOperation.values, contains(NativeOperation.executeAction));
    expect(NativeOperation.values, contains(NativeOperation.getPlatformInfo));
  });

  test('MockNativeAutomationBridge operates correctly', () async {
    final bridge = MockNativeAutomationBridge();

    final initRes = await bridge.initialize();
    expect(initRes.success, isTrue);

    final avail = await bridge.checkAvailability(NativeOperation.executeAction);
    expect(avail, isTrue);

    final infoRes = await bridge.getPlatformInfo();
    expect(infoRes.data['platform'], equals('mock_android'));

    const req = NativeRequest(
      operation: NativeOperation.executeAction,
      parameters: {'action': 'click'},
    );
    final execRes = await bridge.executeOperation(req);
    expect(execRes.success, isTrue);
    expect(execRes.message, contains('executeAction'));
    expect(execRes.data['action'], equals('click'));
  });
}
