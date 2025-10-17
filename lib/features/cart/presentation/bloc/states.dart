import '../../data/models/cart_model.dart';

abstract class CartState {}

class CartInitialState extends CartState {}

class CartUpdatedState extends CartState {
  final List<CartModel> cartItems;
  final double totalPrice;

  CartUpdatedState({required this.cartItems, required this.totalPrice});
}
