import 'package:cosmic/data/models/planet.dart';
import 'package:cosmic/domain/providers/planets_change_notifier.dart';
import 'package:cosmic/ui/features/home/widgets/planet_list_widget.dart';
import 'package:cosmic/ui/features/home/widgets/planet_of_day_widget.dart';
import 'package:cosmic/utils/app_navigation.dart';
import 'package:cosmic/utils/app_notification.dart';
import 'package:cosmic/ui/widgets/buttons/app_icon_button.dart';
import 'package:cosmic/ui/widgets/decorations/background_widget.dart';
import 'package:cosmic/ui/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void onPlanetTap(Planet planet) => AppNavigation.toPlanetDescription(context, planet);

    return BackgroundWidget(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: CustomAppBar(
            isEnabledDecaration: true,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIconButton(
                  icon: Icons.menu_rounded,
                  onTap: () => AppNotification.showInDev(context),
                ),
                Text(
                  'Солнечная\nсистема',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white),
                ),
                AppIconButton(
                  icon: Icons.person_outline_sharp,
                  onTap: () => AppNavigation.toMyProfileScreen(context),
                ),
              ],
            ),
          ),
        ),
        body: ListView(
          physics: const ClampingScrollPhysics(),
          padding: const EdgeInsets.only(top: 10),
          children: [
            PlanetListWidget(
              planets: context.read<PlanetsChangeNotifier>().planets,
              onPlanetTap: onPlanetTap,
            ),
            const SizedBox(height: 16),
            PlanetOfDayWidget(planet: context.read<PlanetsChangeNotifier>().planetOfTheDay),
          ],
        ),
      ),
    );
  }
}
