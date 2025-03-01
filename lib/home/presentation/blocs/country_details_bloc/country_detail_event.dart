import 'package:equatable/equatable.dart';

abstract class CountryDetailsEvent extends Equatable {
  const CountryDetailsEvent();

  @override
  List<Object> get props => [];
}


class FetchCountryDetails extends CountryDetailsEvent {
  final String name;

  const FetchCountryDetails(this.name);

  @override
  List<Object> get props => [name];
}