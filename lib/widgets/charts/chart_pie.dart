import 'dart:math';
import 'package:flutter/material.dart';
import 'package:finance_tracker/utils/currency_utils.dart';
import 'package:finance_tracker/theme.dart';

class ChartPie extends StatelessWidget {
  final int balance;
  const ChartPie({super.key, required this.balance});

  @override
  Widget build(BuildContext context) {
    final primer = (balance * 0.5).round();
    final sekunder = (balance * 0.3).round();
    final tersier = (balance * 0.2).round();

    final total = primer + sekunder + tersier;

    final colorScheme = Theme.of(context).colorScheme;

    final pieData = [
      {'label': 'Primer', 'value': primer, 'color': colorScheme.primer},
      {'label': 'Sekunder', 'value': sekunder, 'color': colorScheme.sekunder},
      {'label': 'Tersier', 'value': tersier, 'color': colorScheme.tersier},
    ];

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      elevation: 8,
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 18),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "DISTRIBUSI KEBUTUHAN",
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 180,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CustomPaint(
                    size: const Size(160, 160),
                    painter: _PieChartPainter(pieData, colorScheme),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        formatCurrency(balance, defaultCurrencyInfo),
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        "Total Balance",
                        style: TextStyle(
                          fontSize: 13,
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 18),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: pieData.map((data) {
                final percent = total > 0
                    ? ((data['value'] as int) / total * 100).toStringAsFixed(1)
                    : "0";
                return Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 6),
                    decoration: BoxDecoration(
                      color: (data['color'] as Color).withOpacity(0.08),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 14,
                              height: 14,
                              decoration: BoxDecoration(
                                color: data['color'] as Color,
                                borderRadius: BorderRadius.circular(3),
                              ),
                            ),
                            const SizedBox(width: 6),
                            Text(
                              data['label'] as String,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: data['color'] as Color,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(
                          formatCurrency(data['value'] as int, defaultCurrencyInfo),
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.onSurface,
                          ),
                        ),
                        Text(
                          "$percent%",
                          style: TextStyle(
                            fontSize: 13,
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class _PieChartPainter extends CustomPainter {
  final List<Map<String, dynamic>> pieData;
  final ColorScheme colorScheme;
  _PieChartPainter(this.pieData, this.colorScheme);

  @override
  void paint(Canvas canvas, Size size) {
    double total = pieData.fold(0, (sum, item) => sum + (item['value'] as int));
    double startAngle = -pi / 2;
    final radius = min(size.width, size.height) / 2;
    final center = Offset(size.width / 2, size.height / 2);

    for (var data in pieData) {
      final value = data['value'] as int;
      final sweepAngle = total > 0 ? value / total * 2 * pi : 0.0;
      final paint = Paint()
        ..color = data['color'] as Color
        ..style = PaintingStyle.fill;
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle,
        sweepAngle,
        true,
        paint,
      );
      startAngle += sweepAngle;
    }
    // Donut effect
    final donutPaint = Paint()
      ..color = colorScheme.surface
      ..style = PaintingStyle.fill;
    canvas.drawCircle(center, radius * 0.60, donutPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}