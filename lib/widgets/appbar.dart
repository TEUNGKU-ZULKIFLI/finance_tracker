import 'package:finance_tracker/pages/setting_page.dart';
import 'package:flutter/material.dart';

class Appbar extends StatelessWidget implements PreferredSizeWidget {
  const Appbar({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return AppBar(
      backgroundColor: colorScheme.primary,
      foregroundColor: colorScheme.onPrimary,
      title: Text(
        'APOK FINTRACK',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: colorScheme.onPrimary,
          letterSpacing: 1.2,
        ),
      ),
      centerTitle: true,
      elevation: 6,
      actions: [
        IconButton(
          icon: Icon(Icons.settings, color: colorScheme.onPrimary),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SettingPage()),
            );
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
