sealed class ApiResponse<T> {
  final int? responseCode;
  final T? data;
  final String? message;

  ApiResponse({this.responseCode, this.data, this.message});
}

class ApiResponseSuccess<T> extends ApiResponse<T> {
  ApiResponseSuccess({required int code, required T data}) : super(responseCode: code, data: data);
}

class ApiResponseFailed<T> extends ApiResponse<T> {
  ApiResponseFailed({required int code, required String message}) : super(responseCode: code, message: message);
}

class ApiLoading<T> extends ApiResponse<T> {
  ApiLoading() : super();
}
