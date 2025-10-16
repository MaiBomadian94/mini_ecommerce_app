import 'package:dartz/dartz.dart';
import 'package:mini_ecommerce_app/core/errors/failure.dart';
import 'package:mini_ecommerce_app/features/home/data/data_source/home_remote_data_source.dart';
import 'package:mini_ecommerce_app/features/home/data/models/product_model.dart';
import 'package:mini_ecommerce_app/features/home/domain/repositories/home_repo.dart';

import '../../../../injection_container.dart';

class HomeRepositoryImp implements HomeRepository {
  @override
  Future<Either<Failure, List<ProductModel>>> getProducts() async {
    return await sl<HomeRemoteDataSource>().getProducts();
  }
}
