import '../../../home/data/models/product_model.dart';

abstract class CartEvent {}

class AddToCartEvent extends CartEvent {
  final ProductModel product;

  AddToCartEvent(this.product);
}

class RemoveFromCartEvent extends CartEvent {
  final ProductModel product;

  RemoveFromCartEvent(this.product);
}
