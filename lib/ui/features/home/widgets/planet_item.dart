import 'package:cosmic/data/models/planet.dart';
import 'package:cosmic/ui/theme/app_theme.dart';
import 'package:flutter/material.dart';

class PlanetItem extends StatelessWidget {
  const PlanetItem({
    super.key,
    required this.planet,
    required this.onPlanetTap,
  });

  final Planet planet;
  final VoidCallback onPlanetTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(28),
      onTap: onPlanetTap,
      child: Ink(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        decoration: BoxDecoration(
          color: AppColors.darkBlueWithAlpha,
          borderRadius: BorderRadius.circular(28),
          border: Border.all(color: Colors.white.withAlpha(30)),
        ),
        child: Row(
          children: [
            const CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage('assets/images/small_planet.png'),
            ),
            const SizedBox(width: 8),
            Text(
              planet.name,
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ],
        ),
      ),
    );
  }
}
