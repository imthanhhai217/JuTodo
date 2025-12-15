import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:ju_reminder/data/network/dio_client.dart';
import 'package:ju_reminder/data/repositories/auth_repository.dart';
import 'package:ju_reminder/data/repositories/product_repository.dart';

final getIt = GetIt.instance;

void setupGetItLocator() {
  getIt.registerLazySingleton<Dio>(() => Dio());
  getIt.registerLazySingleton<DioClient>(() => DioClient(getIt<Dio>()));
  getIt.registerLazySingleton<AuthRepository>(() => AuthRepository());
  getIt.registerLazySingleton<ProductRepository>(() => ProductRepository(getIt<DioClient>()));
}
