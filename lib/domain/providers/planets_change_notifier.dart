import 'package:cosmic/data/models/planet.dart';
import 'package:flutter/material.dart';

class PlanetsChangeNotifier with ChangeNotifier {
  PlanetsChangeNotifier();

  List<Planet> planets = [];

  List<Planet> favouritesPlanets = [];

  Planet get planetOfTheDay {
    final differenceInDays = DateTime.now().difference(DateTime(2025, 1, 1)).inDays;

    final planetIndex = differenceInDays % 8;

    return planets[planetIndex];
  }

  void loadPlanets(List<Planet> planets) {
    this.planets = planets;
    notifyListeners();
  }

  void addPlanetToFavourites(Planet planet) {
    favouritesPlanets = [...favouritesPlanets, planet];
    notifyListeners();
  }

  void removePlanetFromFavourites(Planet planet) {
    favouritesPlanets = favouritesPlanets.where((p) => p.name != planet.name).toList();
    notifyListeners();
  }
}
