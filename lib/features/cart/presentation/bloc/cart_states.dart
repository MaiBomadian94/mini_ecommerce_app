import '../../../home/data/models/product_model.dart';

abstract class CartState {}

class CartInitialState extends CartState {}

class CartUpdatedState extends CartState {
  final List<ProductModel> cartItems;

  CartUpdatedState({required this.cartItems});
}
