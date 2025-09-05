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
          icon: Icon(Icons.info_outline_rounded, color: colorScheme.onPrimary),
          onPressed: () {
            showGeneralDialog(
              context: context,
              barrierDismissible: true,
              barrierLabel: 'Info',
              transitionDuration: const Duration(milliseconds: 260),
              pageBuilder: (context, anim1, anim2) {
                return const SizedBox.shrink();
              },
              transitionBuilder: (context, anim1, anim2, child) {
                final scale = Tween<double>(begin: 0.92, end: 1.0).animate(CurvedAnimation(parent: anim1, curve: Curves.easeOutBack));
                final fade = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(parent: anim1, curve: Curves.easeOut));
                return Transform.scale(
                  scale: scale.value,
                  child: Opacity(
                    opacity: fade.value,
                    child: AlertDialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      backgroundColor: colorScheme.surface.withOpacity(0.98),
                      elevation: 16,
                      contentPadding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TweenAnimationBuilder<double>(
                            tween: Tween<double>(begin: 0.8, end: 1.0),
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.easeOutBack,
                            builder: (context, value, child) {
                              return Transform.scale(
                                scale: value,
                                child: child,
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: LinearGradient(
                                  colors: [colorScheme.primary, colorScheme.secondary],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: colorScheme.primary.withOpacity(0.25),
                                    blurRadius: 16,
                                    offset: Offset(0, 8),
                                  ),
                                ],
                              ),
                              padding: const EdgeInsets.all(4),
                              child: CircleAvatar(
                                radius: 40,
                                backgroundImage: AssetImage('assets/dev/teungku.JPG'),
                                backgroundColor: Colors.transparent,
                              ),
                            ),
                          ),
                          const SizedBox(height: 18),
                          Text(
                            'APOK FINANCE TRACKER',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                              color: colorScheme.primary,
                              letterSpacing: 1.5,
                              shadows: [
                                Shadow(
                                  color: colorScheme.primary.withOpacity(0.3),
                                  blurRadius: 8,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 6),
                          Text(
                            'APOK FINTRACK',
                            style: TextStyle(
                              fontSize: 14,
                              color: colorScheme.secondary,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1.1,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 14),
                          Divider(
                            thickness: 1.2,
                            color: colorScheme.primary.withOpacity(0.18),
                            indent: 24,
                            endIndent: 24,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'by TEUNGKU👨‍💻',
                            style: TextStyle(
                              fontSize: 16,
                              color: colorScheme.tertiary,
                              fontWeight: FontWeight.w500,
                              shadows: [
                                Shadow(
                                  color: colorScheme.tertiary.withOpacity(0.2),
                                  blurRadius: 6,
                                  offset: Offset(0, 1),
                                ),
                              ],
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      actionsAlignment: MainAxisAlignment.center,
                      actions: [
                        TextButton(
                          child: Text(
                            'Tutup',
                            style: TextStyle(
                              color: colorScheme.primary,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
