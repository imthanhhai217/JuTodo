import 'package:dio/dio.dart';
import 'package:ju_reminder/data/network/api_response.dart';

/// Base class cung cấp phương thức generic để xử lý API calls
/// Xử lý các exception và trả về ApiResponse với type-safe
abstract class GenericApiResponse {
  /// Thực hiện API call với error handling tự động
  ///
  /// [call]: Function thực hiện HTTP request
  /// [parser]: Function chuyển đổi raw data thành object type T
  ///
  /// Returns: ApiResponse<T> với trạng thái Success hoặc Failed
  Future<ApiResponse<T>> apiCall<T>(Future<Response<dynamic>> Function() call, T Function(dynamic) parser) async {
    try {
      // Thực hiện API call
      final response = await call();
      final statusCode = response.statusCode ?? 500;
      // Kiểm tra status code thành công
      if (statusCode == 200) {
        // Parse dữ liệu thành object type T
        final parserData = parser(response.data);
        return ApiResponseSuccess<T>(code: statusCode, data: parserData);
      }
      // Trường hợp status code khác 200
      return ApiResponseFailed<T>(code: statusCode, message: response.statusMessage ?? 'Unknown error');
    } on DioException catch (e) {
      // Xử lý DioException (network error, timeout, etc.)
      final statusCode = e.response?.statusCode ?? 500;
      final message = e.response?.statusMessage ?? e.message ?? 'Unknown Dio error';
      return ApiResponseFailed<T>(code: statusCode, message: message);
    } catch (e) {
      // Xử lý các exception khác
      return ApiResponseFailed<T>(code: -1, message: e.toString());
    }
  }
}
