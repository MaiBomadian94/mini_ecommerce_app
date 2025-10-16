import 'package:dartz/dartz.dart';
import 'package:mini_ecommerce_app/core/errors/failure.dart';
import 'package:mini_ecommerce_app/features/home/data/models/category_model.dart';
import 'package:mini_ecommerce_app/features/home/data/models/product_model.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<ProductModel>>> getProducts();
  Future<Either<Failure, List<CategoryModel>>> getCategories();

}
