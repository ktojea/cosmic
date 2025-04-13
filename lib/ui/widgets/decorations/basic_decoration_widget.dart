import 'package:cosmic/ui/theme/app_theme.dart';
import 'package:flutter/material.dart';

class BasicDecorationWidget extends StatelessWidget {
  const BasicDecorationWidget({
    super.key,
    required this.child,
    this.margin = const EdgeInsets.symmetric(horizontal: 10),
    this.padding = const EdgeInsets.all(20),
  });

  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: AppColors.darkBlueWithAlpha,
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: Colors.white.withAlpha(30)),
      ),
      child: child,
    );
  }
}
