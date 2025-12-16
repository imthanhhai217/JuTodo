sealed class ProductEvent {}

final class FetchProduct extends ProductEvent {}

final class FetchProductByID extends ProductEvent {
  final String productID;

  FetchProductByID(this.productID);
}
