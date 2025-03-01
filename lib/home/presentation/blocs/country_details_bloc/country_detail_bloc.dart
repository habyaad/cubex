import 'package:cubex/home/domain/repositories/home_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'country_detail_event.dart';
import 'country_detail_state.dart';

class CountryDetailsBloc
    extends Bloc<CountryDetailsEvent, CountryDetailsState> {
  final IHomeRepository _repository;

  CountryDetailsBloc(this._repository) : super(CountryDetailsInitial()) {
    on<FetchCountryDetails>(_onFetchCountryDetails);
  }

  void _onFetchCountryDetails(
      FetchCountryDetails event, Emitter<CountryDetailsState> emit) async {
    emit(CountryDetailsLoading());
    try {
      final country = await _repository.fetchCountryDetails(event.name);

      emit(CountryDetailsLoaded(country));
    } catch (e) {
      emit(CountryDetailsError('Failed to load country details: $e'));
    }
  }
}
