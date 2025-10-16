import 'package:mini_ecommerce_app/features/home/data/models/category_model.dart';

import '../../data/models/product_model.dart';

abstract class HomeStates {}

// States for Products

class InitialProductsState extends HomeStates {}

class LoadingProductsState extends HomeStates {}

class FailureProductsState extends HomeStates {
  final String message;

  FailureProductsState({required this.message});
}

class SuccessHomeState extends HomeStates {
  final List<ProductModel> products;

  SuccessHomeState(this.products);
}

// States for Categories

class SuccessCategoriesState extends HomeStates {
  final List<CategoryModel> category;

  SuccessCategoriesState({required this.category});
}

class InitialCategoriesState extends HomeStates {}

class LoadingCategoriesState extends HomeStates {}

class FailureCategoriesState extends HomeStates {
  final String message;

  FailureCategoriesState({required this.message});
}
