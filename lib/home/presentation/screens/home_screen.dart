import 'package:cubex/services/dependency_injector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../blocs/country_bloc/country_bloc.dart';
import '../blocs/country_bloc/country_event.dart';
import '../blocs/country_bloc/country_state.dart';
import '../widgets/country_card.dart';
import 'detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    if (locator<CountryBloc>().state is! CountryLoaded) {
      locator<CountryBloc>().add(FetchCountries());
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('African Countries'),
      ),
      body: BlocBuilder<CountryBloc, CountryState>(
        bloc: locator<CountryBloc>(),
        builder: (context, state) {
          if (state is CountryLoading) {
            return const Center(
              child: SpinKitFadingCircle(
                color: Colors.blue,
                size: 50.0,
              ),
            );
          } else if (state is CountryError) {
            return Center(
              child: Column(
                children: [
                  Text(state.message),
                  ElevatedButton(
                      onPressed: () {
                        locator<CountryBloc>().add(FetchCountries());
                      },
                      child: const Text("Reload"))
                ],
              ),
            );
          } else if (state is CountryLoaded) {
            final countries = state.countries;
            return ListView.builder(
              itemCount: countries.length,
              itemBuilder: (context, index) {
                final country = countries[index];
                return CountryCard(
                  country: country,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            DetailScreen(countryName: country.name),
                      ),
                    );
                  },
                );
              },
            );
          } else {
            return const Center(
              child: Text('No countries found.'),
            );
          }
        },
      ),
    );
  }
}
