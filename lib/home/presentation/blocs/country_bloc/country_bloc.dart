import 'package:cubex/home/domain/repositories/home_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'country_event.dart';
import 'country_state.dart';

class CountryBloc extends Bloc<CountryEvent, CountryState> {
  final IHomeRepository _repository;

  CountryBloc(this._repository) : super(CountryInitial()) {
    on<FetchCountries>(_onFetchCountries);
  }

  void _onFetchCountries(
      FetchCountries event, Emitter<CountryState> emit) async {
    emit(CountryLoading());
    try {
      final countries = await _repository.fetchAfricanCountries();
      emit(CountryLoaded(countries));
    } catch (e) {
      emit(CountryError('Failed to load countries: $e'));
    }
  }
}
