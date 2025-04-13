import 'package:cosmic/ui/theme/app_theme.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({super.key, this.isMaxWidth = false});

  final bool isMaxWidth;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: const BorderRadius.all(Radius.circular(30)),
        onTap: () {},
        child: Ink(
          width: isMaxWidth ? double.infinity : null,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [
                AppColors.pink,
                AppColors.blue,
                AppColors.cyan,
              ],
            ),
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
          child: Text(
            'Полететь :)',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
      ),
    );
  }
}
