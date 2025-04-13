import 'package:cosmic/data/models/planet.dart';
import 'package:cosmic/ui/theme/app_theme.dart';
import 'package:cosmic/ui/widgets/decorations/basic_decoration_widget.dart';
import 'package:cosmic/ui/widgets/planet_details_widget.dart';
import 'package:flutter/material.dart';

class PlanetOfDayWidget extends StatelessWidget {
  const PlanetOfDayWidget({super.key, required this.planet});

  final Planet planet;

  @override
  Widget build(BuildContext context) {
    return BasicDecorationWidget(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Планета дня',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/images/medium_planet.png'),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      planet.name,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: AppColors.cyan,
                          ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      planet.cardFact,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          PlanetDetailsWidget(planet: planet),
        ],
      ),
    );
  }
}
