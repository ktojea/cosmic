import 'package:cosmic/data/models/planet.dart';
import 'package:cosmic/ui/features/my_profile/my_profile_screen.dart';
import 'package:cosmic/ui/features/planet_description/planet_description_screen.dart';
import 'package:flutter/material.dart';

abstract final class AppNavigation {
  static void toMyProfileScreen(BuildContext context) => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const MyProfileScreen(),
        ),
      );

  static void toPlanetDescription(BuildContext context, Planet planet) => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PlanetDescriptionScreen(planet: planet),
        ),
      );
}
