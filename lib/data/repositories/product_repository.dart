import 'package:ju_reminder/data/network/api_response.dart';
import 'package:ju_reminder/data/network/dio_client.dart';
import 'package:ju_reminder/data/network/generic_api_response.dart';

import '../../constants/api_constants.dart';
import '../models/product_models.dart';

class ProductRepository extends GenericApiResponse {
  final DioClient _dioClient;

  ProductRepository(this._dioClient);

  Future<ApiResponse<ProductResponse>> fetchProduct() async {
    return apiCall<ProductResponse>(
      () => _dioClient.dio.get(ApiConstants.productDetailEndpoint),
      (data) => ProductResponse.fromJson(data),
    );
  }
}
