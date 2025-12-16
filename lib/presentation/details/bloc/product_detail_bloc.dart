import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ju_reminder/data/repositories/product_repository.dart';
import 'package:ju_reminder/presentation/details/bloc/product_detail_state.dart';
import 'package:ju_reminder/presentation/products/bloc/product_event.dart';

import '../../../data/network/api_response.dart';

class ProductDetailBloc extends Bloc<ProductEvent, ProductByIDState> {
  final ProductRepository _productRepository;

  ProductDetailBloc(this._productRepository) : super(ProductByIDInitial()) {
    on<FetchProductByID>(_onFetchProductById);
  }

  FutureOr<void> _onFetchProductById(FetchProductByID event, Emitter<ProductByIDState> emit) async {
    emit(ProductByIDLoading());
    try {
      final productDetailsResponse = await _productRepository.fetchProductById(event.productID);
      if (productDetailsResponse is ApiResponseSuccess) {
      } else {
        emit(
          ProductByIDError(
            code: productDetailsResponse.responseCode ?? 500,
            message: productDetailsResponse.message ?? "Unknown error",
          ),
        );
      }
    } on Exception catch (e) {
      emit(ProductByIDError(code: 500, message: e.toString()));
    }
  }
}
