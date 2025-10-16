import 'package:dartz/dartz.dart';
import 'package:mini_ecommerce_app/core/constants/api_constants.dart';
import 'package:mini_ecommerce_app/features/home/data/models/category_model.dart';
import 'package:mini_ecommerce_app/features/home/data/models/product_model.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/network/api_service.dart';
import '../../../../injection_container.dart';

abstract class HomeRemoteDataSource {
  Future<Either<Failure, List<ProductModel>>> getProducts();

  Future<Either<Failure, List<CategoryModel>>> getCategories();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  @override
  Future<Either<Failure, List<ProductModel>>> getProducts() async {
    final result = await sl<ApiService>().get(ApiConstants.products);

    return result.fold((failure) => Left(failure), (product) {
      final products = (product as List<dynamic>)
          .map((item) => ProductModel.fromJson(item))
          .toList();
      return Right(products);
    });
  }

  @override
  Future<Either<Failure, List<CategoryModel>>> getCategories() async {
    final result = await sl<ApiService>().get(ApiConstants.categories);

    return result.fold(
          (failure) => Left(failure),
          (data) {
        final categories = (data as List<dynamic>)
            .map((item) => CategoryModel(categoryName: item.toString()))
            .toList();
        return Right(categories);
      },
    );

  }
}
