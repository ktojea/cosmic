import 'dart:math';

import 'package:cosmic/data/models/planet.dart';
import 'package:cosmic/domain/providers/planets_change_notifier.dart';
import 'package:cosmic/ui/features/planet_description/widgets/planet_info_item_widget.dart';
import 'package:cosmic/ui/widgets/buttons/app_buttom.dart';
import 'package:cosmic/ui/widgets/buttons/app_icon_button.dart';
import 'package:cosmic/ui/widgets/decorations/background_widget.dart';
import 'package:cosmic/ui/widgets/decorations/basic_decoration_widget.dart';
import 'package:cosmic/ui/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PlanetDescriptionScreen extends StatelessWidget {
  const PlanetDescriptionScreen({super.key, required this.planet});

  final Planet planet;

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: CustomAppBar(
            isEnabledDecaration: false,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIconButton(
                  icon: Icons.arrow_back_rounded,
                  onTap: () => Navigator.pop(context),
                ),
                Builder(
                  builder: (context) {
                    final favouritesPlanets =
                        context.select<PlanetsChangeNotifier, List<Planet>>((p) => p.favouritesPlanets);

                    final isFavoritePlanet = favouritesPlanets.contains(planet);

                    return AppIconButton(
                      icon: isFavoritePlanet ? Icons.favorite_rounded : Icons.favorite_border_rounded,
                      onTap: () => isFavoritePlanet
                          ? context.read<PlanetsChangeNotifier>().removePlanetFromFavourites(planet)
                          : context.read<PlanetsChangeNotifier>().addPlanetToFavourites(planet),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: IntrinsicHeight(
                  child: Column(
                    children: [
                      const SizedBox(height: 160),
                      Expanded(
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 80),
                              child: BasicDecorationWidget(
                                padding: const EdgeInsets.all(30),
                                margin: const EdgeInsets.all(0),
                                child: Column(
                                  children: [
                                    const SizedBox(height: 70),
                                    Text(
                                      planet.name,
                                      style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 30),
                                    ),
                                    const SizedBox(height: 24),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: PlanetInfoItemWidget(
                                            title: 'Масса\n(10^24 кг)',
                                            assetPath: 'assets/svg/mass.svg',
                                            value: planet.info.massKg,
                                          ),
                                        ),
                                        Expanded(
                                          child: PlanetInfoItemWidget(
                                            title: 'Гравитация\n(м/с^2)',
                                            assetPath: 'assets/svg/magnit.svg',
                                            value: planet.info.gravityMS2.toString(),
                                          ),
                                        ),
                                        Expanded(
                                          child: PlanetInfoItemWidget(
                                            title: 'День\n(часы)',
                                            assetPath: 'assets/svg/sun.svg',
                                            value: planet.info.dayHours.toString(),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 20),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: PlanetInfoItemWidget(
                                            title: 'Скорость\n(км/с)',
                                            assetPath: 'assets/svg/rocket.svg',
                                            value: planet.info.maxSpeedKmS.toString(),
                                          ),
                                        ),
                                        Expanded(
                                          child: PlanetInfoItemWidget(
                                            title: 'Ср. Темп.\n(C)',
                                            assetPath: 'assets/svg/temp.svg',
                                            value: planet.info.avgTemperatureC.toString(),
                                          ),
                                        ),
                                        Expanded(
                                          child: PlanetInfoItemWidget(
                                            title: 'До солнца\n(10^6 км)',
                                            assetPath: 'assets/svg/distance.svg',
                                            value: (planet.info.distanceToSunKm / pow(10, 6)).toStringAsFixed(1),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 20),
                                    const AppButton(),
                                  ],
                                ),
                              ),
                            ),
                            const Positioned(
                              top: 0,
                              child: CircleAvatar(
                                radius: 80,
                                backgroundImage: AssetImage('assets/images/big_planet.png'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
