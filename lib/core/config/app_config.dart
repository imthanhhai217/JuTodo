/// Enum cho các môi trường
enum Environment { dev, staging, production }

/// Class cấu hình ứng dụng
class AppConfig {
  final Environment environment;
  final String apiBaseUrl;
  final String appName;
  final bool enableLogging;
  final int apiTimeout;

  AppConfig._({
    required this.environment,
    required this.apiBaseUrl,
    required this.appName,
    required this.enableLogging,
    required this.apiTimeout,
  });

  /// Singleton instance
  static AppConfig? _instance;

  static AppConfig get instance {
    if (_instance == null) {
      throw Exception(
        'AppConfig chưa được khởi tạo. Gọi AppConfig.initialize() trước.',
      );
    }
    return _instance!;
  }

  /// Khởi tạo config cho môi trường cụ thể
  static void initialize(Environment env) {
    _instance = AppConfig._fromEnvironment(env);
  }

  /// Tạo config từ environment
  factory AppConfig._fromEnvironment(Environment env) {
    switch (env) {
      case Environment.dev:
        return AppConfig._(
          environment: env,
          apiBaseUrl: 'https://dummyjson.com',
          appName: 'JuTodo (Dev)',
          enableLogging: true,
          apiTimeout: 30,
        );

      case Environment.staging:
        return AppConfig._(
          environment: env,
          apiBaseUrl: 'https://dummyjson.com',
          appName: 'JuTodo (Staging)',
          enableLogging: true,
          apiTimeout: 30,
        );

      case Environment.production:
        return AppConfig._(
          environment: env,
          apiBaseUrl: 'https://dummyjson.com',
          appName: 'JuTodo',
          enableLogging: false,
          apiTimeout: 30,
        );
    }
  }

  /// Check môi trường hiện tại
  bool get isDev => environment == Environment.dev;
  bool get isStaging => environment == Environment.staging;
  bool get isProduction => environment == Environment.production;

  @override
  String toString() {
    return 'AppConfig(env: $environment, apiUrl: $apiBaseUrl)';
  }
}
