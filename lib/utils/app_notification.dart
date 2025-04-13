import 'package:flutter/material.dart';

abstract final class AppNotification {
  static void showInDev(BuildContext context) => ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: const Duration(seconds: 2),
          margin: const EdgeInsets.symmetric(horizontal: 16),
          content: Row(
            children: [
              const Icon(Icons.info_outline_rounded, size: 20),
              const SizedBox(width: 8),
              Text(
                'Ещё в разработке...',
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ],
          ),
        ),
      );
}
