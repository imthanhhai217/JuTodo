import 'package:equatable/equatable.dart';
import 'package:ju_reminder/data/models/product_models.dart';

abstract class ProductState extends Equatable {}

class ProductInitial extends ProductState {
  @override
  List<Object?> get props => [];
}

class ProductLoaded extends ProductState {
  final ProductResponse productResponse;

  ProductLoaded({required this.productResponse});

  @override
  List<Object?> get props => [productResponse];
}

class ProductError extends ProductState {
  final int code;
  final String message;

  ProductError({required this.code, required this.message});

  @override
  List<Object?> get props => [code, message];
}
