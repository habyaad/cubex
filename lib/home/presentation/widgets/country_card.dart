import 'package:flutter/material.dart';
import '../../domain/models/country_model.dart';

class CountryCard extends StatelessWidget {
  final Country country;
  final VoidCallback onTap;

  const CountryCard({
    super.key,
    required this.country,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ListTile(
        leading: Image.network(
          country.flag,
          width: 50,
          height: 30,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return const Icon(Icons.flag);
          },
        ),
        title: Text(country.name),
        subtitle: Text('Capital: ${country.capital}'),
        onTap: onTap,
      ),
    );
  }
}
