
import 'package:flutter/material.dart';

/// Snackbar custom yang sepenuhnya adaptif theme dan menggunakan ColorScheme dari Theme.of(context).

class Snackbar extends StatelessWidget {
  final String message;
  final SnackbarType type;
  final VoidCallback? onAction;
  final String? actionLabel;

  const Snackbar({
    super.key,
    required this.message,
    this.type = SnackbarType.info,
    this.onAction,
    this.actionLabel,
  });

  Color _getBgColor(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    switch (type) {
      case SnackbarType.success:
        return colorScheme.primaryContainer;
      case SnackbarType.error:
        return colorScheme.errorContainer;
      case SnackbarType.info:
        return colorScheme.surfaceContainerHighest;
    }
  }

  Color _getTextColor(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    switch (type) {
      case SnackbarType.error:
        return colorScheme.onErrorContainer;
      case SnackbarType.success:
        return colorScheme.onPrimaryContainer;
      case SnackbarType.info:
        return colorScheme.onSurfaceVariant;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: _getBgColor(context),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.08),
              blurRadius: 12,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Text(
                message,
                style: TextStyle(
                  color: _getTextColor(context),
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            if (onAction != null && actionLabel != null)
              TextButton(
                onPressed: onAction,
                child: Text(
                  actionLabel!,
                  style: TextStyle(
                    color: _getTextColor(context),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

enum SnackbarType {
  info,
  success,
  error,
}