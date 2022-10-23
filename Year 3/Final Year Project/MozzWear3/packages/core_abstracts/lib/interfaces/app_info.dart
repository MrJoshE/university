abstract class AppInfo {
  /// The app name. `CFBundleDisplayName` on iOS, `application/label` on Android.
  String get appName;

  /// The package name. `bundleIdentifier` on iOS, `getPackageName` on Android.
  String get packageName;

  /// The package version. `CFBundleShortVersionString` on iOS, `versionName` on Android.
  String get version;

  /// The build number. `CFBundleVersion` on iOS, `versionCode` on Android.
  String get buildNumber;
}
