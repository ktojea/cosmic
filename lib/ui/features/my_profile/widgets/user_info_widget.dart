import 'package:cosmic/ui/features/my_profile/widgets/avatar_widget.dart';
import 'package:cosmic/ui/widgets/decorations/basic_decoration_widget.dart';
import 'package:flutter/material.dart';

class UserInfoWidget extends StatelessWidget {
  const UserInfoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BasicDecorationWidget(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AvatarWidget(),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Андрей Дент',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(
                  'Космический искатель приключений',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          const Icon(Icons.edit_outlined, size: 24),
        ],
      ),
    );
  }
}
