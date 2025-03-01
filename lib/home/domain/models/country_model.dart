class Country {
  final String name;
  final String capital;
  final String flag;
  final Map<String, String>? languages;

  Country({
    required this.name,
    required this.capital,
    required this.flag,
    this.languages,
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      name: json['name']['common'] ?? 'Unknown',
      capital: json['capital']?.first ?? 'No Capital',
      flag: json['flags']['png'] ?? '',
      languages: json['languages'] != null
          ? Map<String, String>.from(json['languages'])
          : null,
    );
  }
}
