import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:qr_api/qr_api.dart';

GetIt getIt = GetIt.instance;

void setupDependencies() {
  final options = BaseOptions(
    baseUrl: 'https://8mpaf1q1g5.execute-api.us-west-1.amazonaws.com',
    connectTimeout: 5000,
    receiveTimeout: 3000,
    headers: <String, dynamic>{
      'x-api-key': 'VVTUTAdalB55yRKQzsM7u6RTowrcUUhJLA82hoN6'
    },
  );

  getIt
    ..registerSingleton(Dio(options))
    ..registerSingleton<QrApi>(QrApi(getIt.get<Dio>()))
    ..registerFactory<SeedRepository>(
        () => SeedRepositoryImpl(getIt.get<QrApi>()));
}
