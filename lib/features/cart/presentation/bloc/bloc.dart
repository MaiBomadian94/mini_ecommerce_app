import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_ecommerce_app/features/cart/data/models/cart_model.dart';
import 'package:mini_ecommerce_app/features/cart/presentation/bloc/events.dart';
import 'package:mini_ecommerce_app/features/cart/presentation/bloc/states.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitialState()) {
    on<AddToCartEvent>(addToCart);
    on<RemoveFromCartEvent>(removeFromCart);
  }

  final List<CartModel> carts = [];

  void addToCart(AddToCartEvent event, Emitter<CartState> emit) {
    final index = carts.indexWhere(
      (item) => item.product.id == event.product.id,
    );

    if (index == -1) {
      carts.add(CartModel(product: event.product));
    } else {
      carts[index].quantity++;
    }

    emit(
      CartUpdatedState(
        cartItems: List.unmodifiable(carts),
        totalPrice: calculateTotalPrice(carts),
      ),
    );
  }

  void removeFromCart(RemoveFromCartEvent event, Emitter<CartState> emit) {
    final index = carts.indexWhere(
      (item) => item.product.id == event.product.id,
    );

    if (index != -1) {
      if (carts[index].quantity > 1) {
        carts[index].quantity--;
      } else {
        carts.removeAt(index);
      }
    }

    emit(
      CartUpdatedState(
        cartItems: List.unmodifiable(carts),
        totalPrice: calculateTotalPrice(carts),
      ),
    );
  }

  double calculateTotalPrice(List<CartModel> carts) {
    double totalPrice = 0;

    for (var item in carts) {
      totalPrice += (item.product.price ?? 0) * (item.quantity);
    }

    return totalPrice;
  }
}
