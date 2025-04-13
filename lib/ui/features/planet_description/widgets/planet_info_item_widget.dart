import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PlanetInfoItemWidget extends StatelessWidget {
  const PlanetInfoItemWidget({
    super.key,
    required this.title,
    required this.value,
    required this.assetPath,
  });

  final String title;
  final String value;
  final String assetPath;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(assetPath),
        const SizedBox(height: 6),
        Text(
          title,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
