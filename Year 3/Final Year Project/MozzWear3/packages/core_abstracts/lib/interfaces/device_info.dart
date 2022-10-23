import '../interfaces.dart';

/// Definition of service responsible for providing information about underlying device
abstract class DeviceInfo {
  /// Gets name of the operating system
  String get operatingSystem;

  /// Gets the name of decice manufacturer
  String get manufacturer;

  /// Gets the name of device model
  String get model;

  /// Get operating system version
  String get osVersion;

  /// Gets the device platform type
  DevicePlatformType get platformType;
}
