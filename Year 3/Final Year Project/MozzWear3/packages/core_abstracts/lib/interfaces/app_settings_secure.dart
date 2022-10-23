/// Manages application settings that are stored in the keychain (iOS) or encrypted using the keystore (Android)
abstract class AppSettingsSecure {
  /// Delete all secure application settings
  Future<void> deleteAll();


  /// Fetch refresh token from secure storage
  Future<String?> fetchPreferences();
}
