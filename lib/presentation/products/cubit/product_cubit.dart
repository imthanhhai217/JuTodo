import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ju_reminder/data/repositories/product_repository.dart';
import 'package:ju_reminder/presentation/products/bloc/product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final ProductRepository _productRepository;

  ProductCubit(this._productRepository) : super(ProductInitial());

  Future<void> fetchListProduct() async {
    try {
      final productResponse = await _productRepository.fetchProduct();
      emit(ProductLoaded(productResponse: productResponse));
    } on DioException catch (e) {
      int? statusCode = e.response?.statusCode ?? -1;
      String errorMessage = e.message ?? 'An unknown Dio error occurred'; // Tin nhắn lỗi của Dio
      if (statusCode == 401) {
        errorMessage = 'Unauthorized: Please log in again.';
      } else if (statusCode == 404) {
        errorMessage = 'Resource not found.';
      } else {
        errorMessage = 'API Error $statusCode: ${e.response?.statusMessage ?? 'Unknown error'}';
      }
      emit(ProductError(code: statusCode, message: errorMessage));
    } catch (e) {
      emit(ProductError(code: 500, message: e.toString()));
    }
  }
}
