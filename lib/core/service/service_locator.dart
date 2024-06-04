import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:volus_app/imports.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton<http.Client>(() => http.Client());
  getIt.registerLazySingleton<ICepDatasource>(() => CepDataSourceHttp(getIt<http.Client>()));
  getIt.registerLazySingleton<ICepRepository>(() => CepRepository(getIt<ICepDatasource>()));
  getIt.registerFactory(() => CepCubit(getIt<ICepRepository>()));
}
