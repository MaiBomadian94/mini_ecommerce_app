import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_ecommerce_app/features/cart/presentation/bloc/cart_states.dart';
import 'package:mini_ecommerce_app/features/home/data/models/product_model.dart';
import 'events.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitialState()) {
    on<AddToCartEvent>(_onAddToCart);
    on<RemoveFromCartEvent>(_onRemoveFromCart);
    on<ClearCartEvent>(_onClearCart);
  }

  final List<ProductModel> cartItems = [];

  void _onAddToCart(AddToCartEvent event, Emitter<CartState> emit) {
    final exists = cartItems.any((item) => item.id == event.product.id);
    if (!exists) {
      cartItems.add(event.product);
      emit(CartUpdatedState(cartItems: List.unmodifiable(cartItems)));
    }
  }

  void _onRemoveFromCart(RemoveFromCartEvent event, Emitter<CartState> emit) {
    cartItems.removeWhere((item) => item.id == event.product.id);
    emit(CartUpdatedState(cartItems: List.unmodifiable(cartItems)));
  }

  void _onClearCart(ClearCartEvent event, Emitter<CartState> emit) {
    cartItems.clear();
    emit(CartUpdatedState(cartItems: List.unmodifiable(cartItems)));
  }
}
