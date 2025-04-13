import 'package:cosmic/ui/theme/app_theme.dart';
import 'package:flutter/material.dart';

class AvatarWidget extends StatelessWidget {
  const AvatarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 42,
      backgroundColor: Colors.white,
      child: CircleAvatar(
        radius: 40,
        child: ClipOval(
          child: ShaderMask(
            shaderCallback: (Rect bounds) {
              return const LinearGradient(
                colors: [
                  AppColors.pink,
                  AppColors.blue,
                  AppColors.cyan,
                ],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
              ).createShader(bounds);
            },
            blendMode: BlendMode.overlay,
            child: const Image(
              image: AssetImage('assets/images/avatar.png'),
              width: 150,
              height: 150,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
