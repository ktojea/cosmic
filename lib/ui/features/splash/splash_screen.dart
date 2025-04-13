// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:ui';

import 'package:cosmic/data/models/planet.dart';
import 'package:cosmic/domain/providers/planets_change_notifier.dart';
import 'package:cosmic/ui/features/navigation/navigation_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _progressValue;

  @override
  void initState() {
    super.initState();
    _initWithStartAnimation();
    _controller.addListener(
      () {
        if (_progressValue.value == 1) _loadPlanets().whenComplete(() => _toNavigationScreen());
      },
    );
  }

  void _initWithStartAnimation() {
    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 2));

    _progressValue = Tween<double>(begin: 0, end: 1).animate(_controller);

    _progressValue.addListener(() => setState(() {}));

    _controller.forward();
  }

  Future<void> _loadPlanets() async {
    final String jsonString = await rootBundle.loadString('assets/planets/planets.json');
    final Map<String, dynamic> jsonData = json.decode(jsonString);

    final List<dynamic> planetList = jsonData['planets'];
    final planets = planetList.map((planetJson) => Planet.fromJson(planetJson)).toList();

    context.read<PlanetsChangeNotifier>().loadPlanets(planets);
  }

  void _toNavigationScreen() => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const NavigationScreen(),
        ),
      );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/images/background.png'),
          ),
        ),
        child: LayoutBuilder(
          builder: (_, constraints) => Center(
            child: SizedBox.square(
              dimension: constraints.maxWidth - 70,
              child: Stack(
                alignment: Alignment.center,
                fit: StackFit.expand,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Transform.scale(
                      scale: _progressValue.value,
                      child: Image.asset(
                        'assets/images/logo.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  const CircularProgressIndicator(
                    color: Color.fromARGB(255, 173, 172, 172),
                    value: 2,
                    strokeWidth: 0.1,
                  ),
                  ImageFiltered(
                    imageFilter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: CircularProgressIndicator(
                      color: const Color.fromARGB(110, 0, 242, 255),
                      strokeWidth: 10,
                      value: _progressValue.value,
                    ),
                  ),
                  CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 7,
                    strokeCap: StrokeCap.round,
                    value: _progressValue.value,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
