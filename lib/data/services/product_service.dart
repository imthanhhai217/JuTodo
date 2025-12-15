import 'package:dio/dio.dart';
import 'package:ju_reminder/constants/api_constants.dart';

import '../models/product_models.dart';

class ProductService {
  final Dio dio;

  ProductService({required this.dio});

  Future<List<Products>> getProduct() async {
    try {
      final response = await dio.get(ApiConstants.productsEndpoint);
      if (response.statusCode == 200) {
        final data = response.data;
        return (data['products'] as List).map((productJson) => Products.fromJson(productJson)).toList();
      }
      throw Exception('Failed to load products');
    } on DioException catch (e) {
      throw Exception("Error ${e.message}");
    }
  }
}
