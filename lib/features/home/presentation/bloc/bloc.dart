import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_ecommerce_app/features/home/domain/repositories/home_repo.dart';
import 'package:mini_ecommerce_app/features/home/presentation/bloc/events.dart';
import 'package:mini_ecommerce_app/features/home/presentation/bloc/states.dart';

import '../../../../injection_container.dart';

class HomeBloc extends Bloc<HomeEvents, HomeStates> {
  HomeBloc() : super(InitialHomeState()) {
    on<GetProductsEvent>(getProducts);
  }

  Future<void> getProducts(
    GetProductsEvent event,
    Emitter<HomeStates> emit,
  ) async {
    emit(LoadingHomeState());

    final result = await sl<HomeRepository>().getProducts();

    return result.fold(
      (failure) => emit(FailureHomeState(message: failure.message)),
      (products) => emit(SuccessHomeState(products)),
    );
  }
}
