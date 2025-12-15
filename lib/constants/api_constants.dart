/// API Constants
/// Quản lý tất cả các endpoint và base URL của API
class ApiConstants {
  // Base URL
  static const String baseUrl = 'https://dummyjson.com';

  // Timeout
  static const int connectionTimeout = 30000; // 30 seconds
  static const int receiveTimeout = 30000; // 30 seconds

  // Headers
  static const Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  // Auth Endpoints
  static const String loginEndpoint = '/auth/login';
  static const String logoutEndpoint = '/auth/logout';
  static const String registerEndpoint = '/auth/register';

  // Products Endpoints
  static const String productsEndpoint = '/products';
  static const String productDetailEndpoint = '/products'; // + id
  static const String searchProductsEndpoint = '/products/search';

  // Users Endpoints
  static const String usersEndpoint = '/users';
  static const String userDetailEndpoint = '/users'; // + id

  // Full URLs (helper getters)
  static String get loginUrl => '$baseUrl$loginEndpoint';
  static String get productsUrl => '$baseUrl$productsEndpoint';
  static String get usersUrl => '$baseUrl$usersEndpoint';
}

