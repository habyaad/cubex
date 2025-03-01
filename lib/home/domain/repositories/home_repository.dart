import 'package:cubex/home/data/home_datasource.dart';

import '../models/country_model.dart';
import '../models/single_country_model.dart';

abstract class IHomeRepository{
  Future<List<Country>> fetchAfricanCountries();

  Future<SingleCountry> fetchCountryDetails(String name);
}
class HomeRepository extends IHomeRepository{
  HomeRepository(this._datasource);
  final IHomeDatasource _datasource;

  @override
  Future<List<Country>> fetchAfricanCountries() async {
    return await _datasource.fetchAfricanCountries();
  }

  @override
  Future<SingleCountry> fetchCountryDetails(String name) async {
    return await _datasource.fetchCountryDetails(name);
  }
}