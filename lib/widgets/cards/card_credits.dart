import 'package:flutter/material.dart';

class CardCredits extends StatelessWidget {
  final String namaRek;
  final String noRek;
  final String logoAsset;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;
  final double? height;

  const CardCredits({
    super.key,
    required this.namaRek,
    required this.noRek,
    required this.logoAsset,
    this.onEdit,
    this.onDelete,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 0),
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        height: height ?? 280,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Container gambar logo bank
            Center(
              child: Container(
                decoration: BoxDecoration(
                ),
                padding: const EdgeInsets.all(4),
                child: ClipRRect(
                  child: Image.asset(
                    logoAsset,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            // Garis pembatas
            Divider(
              thickness: 1.2,
              color: Theme.of(context).dividerColor,
            ),
            const SizedBox(height: 8),
            // Headline nama
            Center(
              child: Text(
                namaRek,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: colorScheme.onSurface,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(height: 6),
            // Subline no rek dan titik tiga
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.credit_card, color: Colors.amber[700], size: 40),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    noRek,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                PopupMenuButton<String>(
                  icon: const Icon(Icons.more_vert),
                  onSelected: (value) {
                    if (value == 'edit' && onEdit != null) onEdit!();
                    if (value == 'remove' && onDelete != null) onDelete!();
                  },
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      value: 'edit',
                      child: Row(
                        children: [
                          Icon(Icons.edit, color: colorScheme.primary),
                          const SizedBox(width: 8),
                          const Text('Edit'),
                        ],
                      ),
                    ),
                    PopupMenuItem(
                      value: 'remove',
                      child: Row(
                        children: [
                          Icon(Icons.delete, color: colorScheme.error),
                          const SizedBox(width: 8),
                          const Text('Remove'),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}