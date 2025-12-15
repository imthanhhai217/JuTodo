import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:ju_reminder/constants/api_constants.dart';

class DioClient {
  final Dio _dio;

  DioClient(this._dio) {
    _dio
      ..options.baseUrl = ApiConstants.baseUrl
      ..options.connectTimeout = Duration(
        milliseconds: ApiConstants.connectionTimeout,
      )
      ..options.receiveTimeout = Duration(
        milliseconds: ApiConstants.receiveTimeout,
      )
      ..options.headers = ApiConstants.headers
      ..interceptors.add(
        LogInterceptor(requestBody: kDebugMode, responseBody: kDebugMode),
      );
  }

  Dio get dio => _dio;
}
