import '../../data/models/product_model.dart';

abstract class HomeStates {}

class InitialHomeState extends HomeStates {}

class LoadingHomeState extends HomeStates {}

class FailureHomeState extends HomeStates {
  final String message;

  FailureHomeState({required this.message});
}

class SuccessHomeState extends HomeStates {
  final List<ProductModel> products;

  SuccessHomeState(this.products);
}
