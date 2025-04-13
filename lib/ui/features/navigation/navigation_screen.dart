import 'package:cosmic/ui/features/favourites/favourites_screen.dart';
import 'package:cosmic/ui/features/home/home_screen.dart';
import 'package:cosmic/ui/features/navigation/widgets/custom_bottom_bar.dart';
import 'package:cosmic/utils/app_notification.dart';
import 'package:flutter/material.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int _selectedScreenIndex = 0;

  void onBarItemTap(int index) {
    if (index == 2) {
      AppNotification.showInDev(context);
      return;
    }

    setState(() => _selectedScreenIndex = index);
  }

  final screens = const <Widget>[
    HomeScreen(),
    FavouritesScreen(),
    Placeholder(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: screens[_selectedScreenIndex],
      bottomNavigationBar: CustomBottomBar(
        currentIndex: _selectedScreenIndex,
        onTap: (i) => onBarItemTap(i),
      ),
    );
  }
}
