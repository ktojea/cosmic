import 'package:cosmic/data/models/planet.dart';
import 'package:cosmic/domain/providers/planets_change_notifier.dart';
import 'package:cosmic/ui/features/favourites/widgets/favourite_planet_item_widget.dart';
import 'package:cosmic/ui/widgets/buttons/app_icon_button.dart';
import 'package:cosmic/ui/widgets/decorations/background_widget.dart';
import 'package:cosmic/ui/widgets/decorations/basic_decoration_widget.dart';
import 'package:cosmic/ui/widgets/custom_app_bar.dart';
import 'package:cosmic/utils/app_navigation.dart';
import 'package:cosmic/utils/app_notification.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavouritesScreen extends StatelessWidget {
  const FavouritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: CustomAppBar(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIconButton(
                  icon: Icons.menu_rounded,
                  onTap: () => AppNotification.showInDev(context),
                ),
                Text(
                  'Избранное',
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
        body: Builder(
          builder: (context) {
            final favouritesPlanets = context.select<PlanetsChangeNotifier, List<Planet>>((p) => p.favouritesPlanets);

            return favouritesPlanets.isEmpty
                ? Center(
                    child: BasicDecorationWidget(
                      child: Text(
                        'Нет любимых планет',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                  )
                : ListView.separated(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).padding.top + 10, bottom: MediaQuery.of(context).padding.bottom),
                    itemCount: favouritesPlanets.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 16),
                    itemBuilder: (_, i) => FavouritePlanetItemWidget(planet: favouritesPlanets[i]),
                  );
          },
        ),
      ),
    );
  }
}
