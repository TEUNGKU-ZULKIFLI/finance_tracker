import 'package:finance_tracker/theme.dart';
import 'package:flutter/material.dart';

/// NavigationBar custom yang sepenuhnya adaptif theme dan menggunakan helper dari AppTheme.

class NavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;
  final VoidCallback onFabPressed;

  const NavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
    required this.onFabPressed,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 24.0),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: AppTheme.navBarBg(colorScheme),
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: colorScheme.onSurface.withOpacity(0.08),
                  blurRadius: 16,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildNavItem(context, Icons.home, "Home", 0),
                  _buildNavItem(context, Icons.show_chart, "Trade", 1),
                  const SizedBox(width: 48),
                  _buildNavItem(context, Icons.credit_card, "Card", 3),
                  _buildNavItem(context, Icons.history, "Riwayat", 4),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 48,
          left: 0,
          right: 0,
          child: Center(
            child: AppTheme.neonWrap(
              color: colorScheme.tertiary,
              blur: 32,
              spread: 2,
              circle: true,
              child: FloatingActionButton(
                onPressed: onFabPressed,
                backgroundColor: colorScheme.primary,
                child: Icon(Icons.add, color: colorScheme.onPrimary, size: 36),
                elevation: 0,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildNavItem(BuildContext context, IconData icon, String label, int index) {
    final colorScheme = Theme.of(context).colorScheme;
    final isSelected = currentIndex == index;
    return InkWell(
      onTap: () => onTap(index),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: AppTheme.navBarIcon(colorScheme, selected: isSelected)),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                color: AppTheme.navBarText(colorScheme, selected: isSelected),
              ),
            ),
          ],
        ),
      ),
    );
  }
}