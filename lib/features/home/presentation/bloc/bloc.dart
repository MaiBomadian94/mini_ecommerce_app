import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_ecommerce_app/features/home/domain/repositories/home_repo.dart';
import 'package:mini_ecommerce_app/features/home/presentation/bloc/events.dart';
import 'package:mini_ecommerce_app/features/home/presentation/bloc/states.dart';

import '../../../../injection_container.dart';

class HomeBloc extends Bloc<HomeEvents, HomeStates> {
  HomeBloc() : super(InitialProductsState()) {
    on<GetProductsEvent>(getProducts);
    on<GetCategoriesEvent>(getCategories);
  }

  Future<void> getProducts(
    GetProductsEvent event,
    Emitter<HomeStates> emit,
  ) async {
    emit(LoadingProductsState());

    final result = await sl<HomeRepository>().getProducts();

    return result.fold(
      (failure) => emit(FailureProductsState(message: failure.message)),
      (products) => emit(SuccessHomeState(products)),
    );
  }

  Future<void> getCategories(
    GetCategoriesEvent event,
    Emitter<HomeStates> emit,
  ) async {
    emit(LoadingCategoriesState());

    final result = await sl<HomeRepository>().getCategories();

    return result.fold(
      (failure) => emit(FailureCategoriesState(message: failure.message)),
      (categories) {
        print("Fetched categories: $categories"); // 👈 debug
        emit(SuccessCategoriesState(category: categories));
      }
    );
  }
}
