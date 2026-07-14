/// Represents the visual and timing optimization characteristics for a target device.
/// Future optimization properties (e.g. platform click delays, automation response timings,
/// native gesture speeds, or specific screen refresh-rate adjustments) can be declared here.
class OptimizationProfile {
  /// The duration to wait between accessibility automation actions.
  final Duration accessibilityActionDelay;

  /// The duration to wait for native animations to fully settle on this device.
  final Duration animationSettleDelay;

  const OptimizationProfile({
    required this.accessibilityActionDelay,
    required this.animationSettleDelay,
  });
}

/// Represents the hardware and platform specifications of the target device optimized for personal use.
class DeviceProfile {
  /// The user-facing name of the device.
  final String deviceName;

  /// The manufacturer of the device.
  final String manufacturer;

  /// The name and version of the operating system.
  final String operatingSystem;

  /// The Android SDK OS version.
  final int androidVersion;

  /// The minimum supported Android API level.
  final int minimumSupportedAndroid;

  /// The specific optimization properties mapped for this device profile.
  final OptimizationProfile optimizationProfile;

  const DeviceProfile({
    required this.deviceName,
    required this.manufacturer,
    required this.operatingSystem,
    required this.androidVersion,
    required this.minimumSupportedAndroid,
    required this.optimizationProfile,
  });

  /// The default optimized profile configured for the target POCO F7 device.
  static const DeviceProfile target = DeviceProfile(
    deviceName: 'POCO F7',
    manufacturer: 'POCO',
    operatingSystem: 'HyperOS 3',
    androidVersion: 16,
    minimumSupportedAndroid: 10,
    optimizationProfile: OptimizationProfile(
      accessibilityActionDelay: Duration(milliseconds: 300),
      animationSettleDelay: Duration(milliseconds: 500),
    ),
  );
}
