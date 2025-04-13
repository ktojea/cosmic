import 'package:cosmic/ui/features/my_profile/widgets/rating_progress_widget.dart';
import 'package:cosmic/ui/features/my_profile/widgets/user_info_widget.dart';
import 'package:cosmic/ui/widgets/buttons/app_icon_button.dart';
import 'package:cosmic/ui/widgets/decorations/background_widget.dart';
import 'package:cosmic/ui/widgets/decorations/basic_decoration_widget.dart';
import 'package:cosmic/ui/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class MyProfileScreen extends StatelessWidget {
  const MyProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: CustomAppBar(
            child: Stack(
              children: [
                AppIconButton(
                  icon: Icons.arrow_back_rounded,
                  onTap: () => Navigator.pop(context),
                ),
                Center(
                  child: Text(
                    'Мой профиль',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
              ],
            ),
          ),
        ),
        body: const Column(
          children: [
            SizedBox(height: 10),
            UserInfoWidget(),
            SizedBox(height: 16),
            BasicDecorationWidget(child: RatingProgressWidget()),
          ],
        ),
      ),
    );
  }
}
