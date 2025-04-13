import 'package:cosmic/data/models/planet.dart';
import 'package:cosmic/domain/providers/planets_change_notifier.dart';
import 'package:cosmic/ui/features/home/widgets/planet_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PlanetListWidget extends StatelessWidget {
  const PlanetListWidget({
    super.key,
    required this.planets,
    required this.onPlanetTap,
  });

  final List<Planet> planets;
  final void Function(Planet planet) onPlanetTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Builder(builder: (context) {
        final planets = context.read<PlanetsChangeNotifier>().planets;

        return ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          scrollDirection: Axis.horizontal,
          separatorBuilder: (_, __) => const SizedBox(width: 10),
          itemCount: planets.length,
          itemBuilder: (_, i) => PlanetItem(
            planet: planets[i],
            onPlanetTap: () => onPlanetTap(planets[i]),
          ),
        );
      }),
    );
  }
}
