import 'package:equatable/equatable.dart';
import '../../../domain/models/country_model.dart';
import '../../../domain/models/single_country_model.dart';

abstract class CountryState extends Equatable {
  const CountryState();

  @override
  List<Object> get props => [];
}

class CountryInitial extends CountryState {}

class CountryLoading extends CountryState {}

class CountryLoaded extends CountryState {
  final List<Country> countries;

  const CountryLoaded(this.countries);

  @override
  List<Object> get props => [countries];
}

class CountryError extends CountryState {
  final String message;

  const CountryError(this.message);

  @override
  List<Object> get props => [message];
}

class CountryDetailLoaded extends CountryState {
  final SingleCountry country;

  const CountryDetailLoaded(this.country);

  @override
  List<Object> get props => [country];
}
