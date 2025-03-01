import 'package:dio/dio.dart';

import '../domain/models/country_model.dart';
import '../domain/models/single_country_model.dart';

abstract class IHomeDatasource {
  Future<List<Country>> fetchAfricanCountries();

  Future<SingleCountry> fetchCountryDetails(String name);
}

class HomeDatasource extends IHomeDatasource {
  HomeDatasource(this._dio);

  final Dio _dio;

  @override
  Future<List<Country>> fetchAfricanCountries() async {
    try {
      final response = await _dio.get(
        'https://restcountries.com/v3.1/region/africa?fields=name,capital,flags,languages',
      );
      return (response.data as List)
          .map((json) => Country.fromJson(json))
          .toList();
    } catch (e) {
      throw Exception('Failed to load countries: $e');
    }
  }

  @override
  Future<SingleCountry> fetchCountryDetails(String name) async {
    try {
      final response = await _dio.get(
        'https://restcountries.com/v3.1/name/$name',
      );
      return SingleCountry.fromJson(response.data[0]);
    } catch (e) {
      throw Exception('Failed to load country details: $e');
    }
  }
}
