import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../home/data/home_datasource.dart';
import '../home/domain/repositories/home_repository.dart';
import '../home/presentation/blocs/country_bloc/country_bloc.dart';
import '../home/presentation/blocs/country_details_bloc/country_detail_bloc.dart';

GetIt locator = GetIt.instance;

Future<void> initializeSharedDependencies() async {
  log('Initializing dependencies...');

  locator.registerLazySingleton(() => Dio());

  locator.registerLazySingleton<IHomeDatasource>(
    () => HomeDatasource(locator()),
  );
  locator.registerLazySingleton<IHomeRepository>(
    () => HomeRepository(locator()),
  );
  locator.registerLazySingleton<CountryBloc>(
    () => CountryBloc(locator()),
  );
  locator.registerLazySingleton<CountryDetailsBloc>(
    () => CountryDetailsBloc(locator()),
  );
  log('Dependencies initialized successfully.');
}
