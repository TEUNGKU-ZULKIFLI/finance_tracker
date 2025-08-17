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
    final double fabSize = 56;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest,
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
            _buildFabItem(context, fabSize, currentIndex == 2),
            _buildNavItem(context, Icons.credit_card, "Card", 3),
            _buildNavItem(context, Icons.history, "Riwayat", 4),
          ],
        ),
      ),
    );
  }
  Widget _buildFabItem(BuildContext context, double fabSize, bool isSelected) {
    final colorScheme = Theme.of(context).colorScheme;
    return SizedBox(
      width: fabSize,
      height: fabSize,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(fabSize / 2),
          onTap: onFabPressed,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            decoration: BoxDecoration(
              color: isSelected ? colorScheme.primaryContainer : colorScheme.primary,
              shape: BoxShape.circle,
              border: isSelected
                  ? Border.all(color: colorScheme.primary, width: 2)
                  : null,
              boxShadow: [
                BoxShadow(
                  color: isSelected
                      ? colorScheme.primary.withOpacity(0.28)
                      : colorScheme.primary.withOpacity(0.18),
                  blurRadius: isSelected ? 18 : 12,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Center(
              child: Icon(
                Icons.add,
                color: isSelected ? colorScheme.primary : colorScheme.onPrimary,
                size: 32,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(
    BuildContext context,
    IconData icon,
    String label,
    int index,
  ) {
    final colorScheme = Theme.of(context).colorScheme;
    final isSelected = currentIndex == index;
    return InkWell(
      onTap: () => onTap(index),
      borderRadius: BorderRadius.circular(16),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: isSelected
            ? BoxDecoration(
                color: colorScheme.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: colorScheme.primary.withOpacity(0.22),
                    blurRadius: 12,
                    offset: const Offset(0, 2),
                  ),
                ],
              )
            : null,
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isSelected
                  ? colorScheme.onSecondaryContainer
                  : colorScheme.onSurfaceVariant,
              size: 22,
            ),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                color: isSelected
                    ? colorScheme.onSurface
                    : colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
