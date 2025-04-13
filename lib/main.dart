import 'package:cosmic/domain/providers/planets_change_notifier.dart';
import 'package:cosmic/ui/features/splash/splash_screen.dart';
import 'package:cosmic/ui/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider.value(
      value: PlanetsChangeNotifier(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppTheme.basic,
      home: const SplashScreen(),
    );
  }
}
