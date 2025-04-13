import 'package:cosmic/data/models/planet_info.dart';

class Planet {
  const Planet({
    required this.name,
    required this.factOfTheDay,
    required this.cardFact,
    required this.info,
  });

  final String name;
  final String factOfTheDay;
  final String cardFact;
  final PlanetInfo info;

  static Planet fromJson(Map<String, dynamic> json) => Planet(
        name: json['name'],
        factOfTheDay: json['fact_of_the_day'],
        cardFact: json['card_fact'],
        info: PlanetInfo.fromJson(json['data']),
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is Planet && runtimeType == other.runtimeType && name == other.name;

  @override
  int get hashCode => name.hashCode;
}
