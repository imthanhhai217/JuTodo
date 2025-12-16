import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ju_reminder/data/network/api_response.dart';
import 'package:ju_reminder/data/repositories/product_repository.dart';
import 'package:ju_reminder/presentation/products/bloc/product_event.dart';
import 'package:ju_reminder/presentation/products/bloc/product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository _productRepository;

  ProductBloc(this._productRepository) : super(ProductInitial()) {
    on<FetchProduct>(_onFetchProduct);
  }

  Future<void> _onFetchProduct(FetchProduct event, Emitter<ProductState> emit) async {
    try {
      final productResponse = await _productRepository.fetchProduct();
      if (productResponse is ApiResponseSuccess) {
        emit(ProductLoaded(productResponse: productResponse));
      } else if (productResponse is ApiResponseFailed) {
        emit(
          ProductError(code: productResponse.responseCode ?? 500, message: productResponse.message ?? "Unknown error"),
        );
      }
    } on Exception catch (e) {
      emit(ProductError(code: 500, message: e.toString()));
    }
  }
}
