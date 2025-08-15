import 'package:flutter/material.dart';

class Appbar extends StatelessWidget implements PreferredSizeWidget {
  const Appbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('APOK Finance Tracker'),
      centerTitle: true,
      elevation: 6,
      actions: [
        IconButton(
          icon: const Icon(Icons.info_outline_rounded),
          onPressed: () {
            // TODO: Implement info action
          },
        ),
      ],
      // Jangan set backgroundColor, foregroundColor, titleTextStyle di sini
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
