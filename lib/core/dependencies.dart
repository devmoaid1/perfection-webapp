import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:perfection_webapp/core/api/base_api.dart';
import 'package:perfection_webapp/core/api/dio_consumer.dart';
import 'package:perfection_webapp/data/data_source/user_remote_data_source.dart';
import 'package:perfection_webapp/data/repositories/user_repository.dart';

final sl = GetIt.instance;

void setupDependencies() {
  final dio = Dio();
  sl.registerLazySingleton<Dio>(() => dio);
  sl.registerLazySingleton<BaseApi>(() => DioConsumer(dio: sl()));
  sl.registerLazySingleton<UserRemoteDataSource>(
    () => UserRemoteDataSourceImpl(baseApi: sl()),
  );
  sl.registerLazySingleton<UserRepository>(
      () => UserRepositoryImpl(userRemoteDataSource: sl()));
}
