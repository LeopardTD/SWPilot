import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../infrastructure/native/bridge/method_channel_native_automation_bridge.dart';
import '../../infrastructure/native/bridge/native_automation_bridge.dart';

/// Riverpod provider for accessing the [NativeAutomationBridge] contract implementation.
final nativeAutomationBridgeProvider = Provider<NativeAutomationBridge>((ref) {
  return MethodChannelNativeAutomationBridge();
});
