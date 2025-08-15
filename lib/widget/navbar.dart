import 'package:finance_tracker/theme.dart';
import 'package:flutter/material.dart';

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
      return Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 24.0), // beri ruang untuk FAB
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Theme.of(context).navigationBarTheme.backgroundColor
                  ?? Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    // ignore: deprecated_member_use
                    color: Theme.of(context).colorScheme.onSurface.withOpacity(0.08),
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
                    _buildNavItem(Icons.home, "Home", 0),
                    _buildNavItem(Icons.show_chart, "Trade", 1),
                    SizedBox(width: 48), // ruang untuk FAB di tengah
                    _buildNavItem(Icons.credit_card, "Card", 3),
                    _buildNavItem(Icons.history, "Riwayat", 4),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 48, // lebih tinggi dan menonjol
            left: 0,
            right: 0,
            child: Center(
              child: Material(
                elevation: 16,
                shape: const CircleBorder(),
                color: Theme.of(context).colorScheme.inversePrimary,
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        // ignore: deprecated_member_use
                        color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
                        blurRadius: 32,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: FloatingActionButton(
                    onPressed: onFabPressed,
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    // ignore: sort_child_properties_last
                    child: Icon(Icons.add, color: Theme.of(context).colorScheme.onPrimary, size: 36), // ikon lebih besar
                    elevation: 0,
                  ),
                ),
              ),
            ),
          ),
        ],
      );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    final isSelected = currentIndex == index;
    return InkWell(
      onTap: () => onTap(index),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: isSelected ? AppTheme.primary : AppTheme.surfaceBright),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                color: isSelected ? AppTheme.primary : AppTheme.surfaceBright,
              ),
            ),
          ],
        ),
      ),
    );
  }
}