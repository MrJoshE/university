abstract class AppConfig {
  String get applicationBaseUrl;

  /// Gets timeout in seconds for opening URLs by the API clients.
  int get connectTimeout;

  /// Gets timeout in seconds for receiving data by the API clients.
  int get receiveTimeout;

  bool get logHttpRequests;

  String get customerServicesPhoneNumber;

  String get testflightUrl;

  String get googlePlayUrl;

  String get contactUsUrl;

  /// Number of seconds before the app loading views will show the taken too long content.
  int get takenTooLongTimer;

  String get pathToLegalStuffVersion;
}
