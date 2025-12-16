import 'package:equatable/equatable.dart';
import 'package:ju_reminder/data/models/product_models.dart';
import 'package:ju_reminder/data/network/api_response.dart';

/// State for product list
sealed class ProductState extends Equatable {}

final class ProductInitial extends ProductState {
  @override
  List<Object?> get props => [];
}

final class ProductLoading extends ProductState {
  @override
  List<Object?> get props => [];
}

final class ProductLoaded extends ProductState {
  final ApiResponse<ProductResponse> productResponse;

  ProductLoaded({required this.productResponse});

  @override
  List<Object?> get props => [productResponse];
}

final class ProductError extends ProductState {
  final int code;
  final String message;

  ProductError({required this.code, required this.message});

  @override
  List<Object?> get props => [code, message];
}
