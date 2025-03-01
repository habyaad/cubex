class SingleCountry {
  final String name;
  final String capital;
  final String flag;
  final Map<String, String>? languages;
  final int population;
  final String region;
  final List<String>? timezones;
  final List<String>? borders;

  SingleCountry({
    required this.name,
    required this.capital,
    required this.flag,
    this.languages,
    required this.population,
    required this.region,
    this.timezones,
    this.borders,
  });

  factory SingleCountry.fromJson(Map<String, dynamic> json) {
    return SingleCountry(
      name: json['name']['common'] ?? 'Unknown',
      capital: json['capital']?.first ?? 'No Capital',
      flag: json['flags']['png'] ?? '',
      languages: json['languages'] != null
          ? Map<String, String>.from(json['languages'])
          : null,
      population: json['population'] ?? 0,
      region: json['region'] ?? 'Unknown Region',
      timezones: json['timezones'] != null
          ? List<String>.from(json['timezones'])
          : null,
      borders:
          json['borders'] != null ? List<String>.from(json['borders']) : null,
    );
  }
}
