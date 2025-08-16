import 'package:flutter/material.dart';

/// Appbar custom yang sepenuhnya adaptif theme dan menggunakan helper dari AppTheme.

class Appbar extends StatelessWidget implements PreferredSizeWidget {
  const Appbar({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return AppBar(
      backgroundColor: colorScheme.surfaceContainerHighest,
      foregroundColor: colorScheme.onSurface,
      title: Text(
        'APOK Finance Tracker',
        style: TextStyle(color: colorScheme.onSurface),
      ),
      centerTitle: true,
      elevation: 6,
      actions: [
        IconButton(
          icon: Icon(Icons.info_outline_rounded, color: colorScheme.onSurfaceVariant),
          onPressed: () {
            // TODO: Implement info action
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
