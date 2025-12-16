import 'package:equatable/equatable.dart';

import '../../../data/models/product_models.dart';
import '../../../data/network/api_response.dart';

/// State for product fetched by ID

sealed class ProductByIDState extends Equatable {}

final class ProductByIDInitial extends ProductByIDState {
  @override
  List<Object?> get props => [];
}

final class ProductByIDLoading extends ProductByIDState {
  @override
  List<Object?> get props => [];
}

final class ProductByIDLoaded extends ProductByIDState {
  final ApiResponse<Products> productResponse;

  ProductByIDLoaded({required this.productResponse});

  @override
  List<Object?> get props => [productResponse];
}

final class ProductByIDError extends ProductByIDState {
  final int? code;
  final String message;

  ProductByIDError({required this.code, required this.message});

  @override
  List<Object?> get props => [code, message];
}
