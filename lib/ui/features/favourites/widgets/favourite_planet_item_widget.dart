import 'package:cosmic/data/models/planet.dart';
import 'package:cosmic/domain/providers/planets_change_notifier.dart';
import 'package:cosmic/ui/theme/app_theme.dart';
import 'package:cosmic/ui/widgets/decorations/basic_decoration_widget.dart';
import 'package:cosmic/ui/widgets/planet_details_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavouritePlanetItemWidget extends StatelessWidget {
  const FavouritePlanetItemWidget({
    super.key,
    required this.planet,
  });

  final Planet planet;

  @override
  Widget build(BuildContext context) {
    return BasicDecorationWidget(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage('assets/images/medium_planet.png'),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      planet.name,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: AppColors.cyan,
                          ),
                    ),
                    GestureDetector(
                      onTap: () => context.read<PlanetsChangeNotifier>().removePlanetFromFavourites(planet),
                      child: const Icon(Icons.favorite_border_rounded),
                    )
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  planet.cardFact,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                PlanetDetailsWidget(planet: planet),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
