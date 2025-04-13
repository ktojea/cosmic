import 'package:cosmic/ui/theme/app_theme.dart';
import 'package:flutter/material.dart';

class RatingProgressWidget extends StatelessWidget {
  const RatingProgressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) => Stack(
        alignment: Alignment.center,
        children: [
          SizedBox.square(
            dimension: constraints.maxWidth,
            child: ShaderMask(
              shaderCallback: (bounds) {
                return const SweepGradient(
                  stops: [0.0, 0.75, 1.0],
                  colors: [
                    AppColors.pink,
                    AppColors.cyan,
                    AppColors.pink,
                  ],
                ).createShader(bounds);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircularProgressIndicator(
                  value: 0.871,
                  strokeWidth: 14,
                  backgroundColor: Colors.black.withAlpha(50),
                  valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
                  strokeCap: StrokeCap.round,
                ),
              ),
            ),
          ),
          Column(
            children: [
              Text(
                'Личный\nпрогресс',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(
                '87.1%',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontSize: 60,
                      color: AppColors.purple,
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
