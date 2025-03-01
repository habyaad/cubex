import 'package:equatable/equatable.dart';
import '../../../domain/models/country_model.dart';
import '../../../domain/models/single_country_model.dart';

abstract class CountryDetailsState extends Equatable {
  const CountryDetailsState();

  @override
  List<Object> get props => [];
}

class CountryDetailsInitial extends CountryDetailsState {}

class CountryDetailsLoading extends CountryDetailsState {}

class CountryDetailsError extends CountryDetailsState {
  final String message;

  const CountryDetailsError(this.message);

  @override
  List<Object> get props => [message];
}

class CountryDetailsLoaded extends CountryDetailsState {
  final SingleCountry country;

  const CountryDetailsLoaded(this.country);

  @override
  List<Object> get props => [country];
}