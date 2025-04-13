class PlanetInfo {
  const PlanetInfo({
    required this.massKg,
    required this.gravityMS2,
    required this.dayHours,
    required this.maxSpeedKmS,
    required this.avgTemperatureC,
    required this.distanceToSunKm,
  });

  final String massKg;
  final double gravityMS2;
  final int dayHours;
  final double maxSpeedKmS;
  final int avgTemperatureC;
  final int distanceToSunKm;

  static PlanetInfo fromJson(Map<String, dynamic> json) => PlanetInfo(
        massKg: json['mass_kg'],
        gravityMS2: (json['gravity_m_s2'] as num).toDouble(),
        dayHours: (json['day_hours'] as num).toInt(),
        maxSpeedKmS: (json['max_speed_km_s'] as num).toDouble(),
        avgTemperatureC: (json['avg_temperature_c'] as num).toInt(),
        distanceToSunKm: (json['distance_to_sun_km'] as num).toInt(),
      );
}
