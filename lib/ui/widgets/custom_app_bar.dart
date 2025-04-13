import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    this.isEnabledDecaration = true,
    required this.child,
  });

  final bool isEnabledDecaration;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      margin: const EdgeInsets.only(left: 4, right: 4, top: 10),
      decoration: isEnabledDecaration
          ? BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(28)),
              color: Colors.black.withAlpha(40),
              border: Border.all(
                width: 2,
                color: Colors.black.withAlpha(120),
              ),
            )
          : null,
      child: SafeArea(child: child),
    );
  }
}
