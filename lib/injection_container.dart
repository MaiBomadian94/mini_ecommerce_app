import 'package:get_it/get_it.dart';
import 'package:mini_ecommerce_app/features/home/data/repos/home_repo_imp.dart';
import 'package:mini_ecommerce_app/features/home/domain/repositories/home_repo.dart';

import 'core/network/api_service.dart';
import 'features/home/data/data_source/home_remote_data_source.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Http
  sl.registerLazySingleton<ApiService>(() => ApiServiceImpl(baseUrl: 'https://fakestoreapi.com'));

  // Home
  sl.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSourceImpl(),
  );

  sl.registerLazySingleton<HomeRepository>(() => HomeRepositoryImp());
}
