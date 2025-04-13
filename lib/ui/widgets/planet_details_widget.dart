import 'package:cosmic/data/models/planet.dart';
import 'package:cosmic/ui/theme/app_theme.dart';
import 'package:cosmic/utils/app_navigation.dart';
import 'package:flutter/material.dart';

class PlanetDetailsWidget extends StatelessWidget {
  const PlanetDetailsWidget({
    super.key,
    required this.planet,
  });

  final Planet planet;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => AppNavigation.toPlanetDescription(context, planet),
      child: Align(
        alignment: Alignment.centerRight,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Подробнее',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const Icon(
              Icons.keyboard_arrow_right_rounded,
              color: AppColors.cyan,
            ),
          ],
        ),
      ),
    );
  }
}
