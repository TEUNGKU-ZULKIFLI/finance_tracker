import 'package:finance_tracker/pages/setting_page.dart';
import 'package:flutter/material.dart';

class Appbar extends StatelessWidget implements PreferredSizeWidget {
  const Appbar({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return AppBar(
      backgroundColor: colorScheme.primary,
      foregroundColor: colorScheme.onPrimary,
      elevation: 0,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              // ignore: deprecated_member_use
              color: colorScheme.primary.withOpacity(0.18),
              blurRadius: 32,
              spreadRadius: 2,
              offset: const Offset(0, 8),
            ),
            BoxShadow(
              // ignore: deprecated_member_use
              color: colorScheme.primary.withOpacity(0.08),
              blurRadius: 8,
              spreadRadius: 1,
              offset: const Offset(0, 2),
            ),
          ],
        ),
      ),
      title: Text(
        'APOK FINTRACK',
        style: textTheme.titleLarge?.copyWith(
          fontWeight: FontWeight.bold,
          color: colorScheme.onPrimary,
          letterSpacing: 1.2,
        ),
      ),
      centerTitle: true,
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