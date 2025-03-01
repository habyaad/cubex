import 'package:cubex/utils/string_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../../services/dependency_injector.dart';
import '../blocs/country_details_bloc/country_detail_bloc.dart';
import '../blocs/country_details_bloc/country_detail_event.dart';
import '../blocs/country_details_bloc/country_detail_state.dart';

class DetailScreen extends StatelessWidget {
  final String countryName;

  const DetailScreen({super.key, required this.countryName});

  @override
  Widget build(BuildContext context) {
    locator<CountryDetailsBloc>().add(FetchCountryDetails(countryName));

    return Scaffold(
      appBar: AppBar(
        title: Text(countryName),
      ),
      body: BlocBuilder<CountryDetailsBloc, CountryDetailsState>(
        bloc: locator<CountryDetailsBloc>(),
        builder: (context, state) {
          if (state is CountryDetailsLoading) {
            return const Center(
              child: SpinKitFadingCircle(
                color: Colors.blue,
                size: 50.0,
              ),
            );
          } else if (state is CountryDetailsError) {
            return Center(
              child: Column(
                children: [
                  const Text("Unable to load data"),
                  ElevatedButton(
                      onPressed: () {
                        locator<CountryDetailsBloc>()
                            .add(FetchCountryDetails(countryName));
                      },
                      child: const Text("Reload"))
                ],
              ),
            );
          } else if (state is CountryDetailsLoaded) {
            final country = state.country;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(
                      country.flag,
                      width: double.infinity,
                      height: 200,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(Icons.flag, size: 100);
                      },
                    ),
                    const SizedBox(height: 20),
                    Text('Capital: ${country.capital}'),
                    const SizedBox(height: 10),
                    Text('Population: ${country.population.toCommaSeparated()}'),
                    const SizedBox(height: 10),
                    Text('Region: ${country.region}'),
                    const SizedBox(height: 10),
                    Text(
                      'Languages: ${country.languages?.values.join(', ') ?? 'No languages'}',
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Timezones: ${country.timezones?.join(', ') ?? 'No timezones'}',
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Borders: ${country.borders?.join(', ') ?? 'No borders'}',
                    ),
                  ],
                ),
              ),
            );
          } else {
            return const Center(
              child: Text('No details found.'),
            );
          }
        },
      ),
    );
  }
}
