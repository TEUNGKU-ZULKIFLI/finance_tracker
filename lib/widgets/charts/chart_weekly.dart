import 'package:flutter/material.dart';
import 'package:finance_tracker/theme.dart';

class ChartWeekly extends StatelessWidget {
  final List<Map<String, dynamic>> weeklyData;
  const ChartWeekly({super.key, required this.weeklyData});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final maxY = 3000000.0;
    final barWidth = 18.0;
    final minBarHeight = 10.0;

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      elevation: 8,
      margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 16),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Bar Chart Mingguan', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 18),
            SizedBox(
              height: 240,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // Sumbu Y (angka vertikal di kiri)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 32.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        for (var y in [3000000,2500000,2000000,1500000,1000000,500000,0])
                          SizedBox(
                            height: 160 / 6,
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                y == 0 ? '' : '${y ~/ 1000}K',
                                style: TextStyle(fontSize: 12, color: Colors.grey[700]),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  // Chart Bars (scrollable jika data banyak)
                  Expanded(
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: weeklyData.length,
                      separatorBuilder: (_, __) => const SizedBox(width: 24),
                      itemBuilder: (context, i) {
                        final week = weeklyData[i];
                        final expense = week['expense'] as int;
                        final income = week['income'] as int;
                        double expenseHeight = (expense / maxY) * 160;
                        double incomeHeight = (income / maxY) * 160;
                        if (expenseHeight < minBarHeight) expenseHeight = minBarHeight;
                        if (incomeHeight < minBarHeight) incomeHeight = minBarHeight;
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            // Bar group: Expense (left), Income (right)
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                // Expense bar (left)
                                Container(
                                  width: barWidth,
                                  height: expenseHeight,
                                  decoration: BoxDecoration(
                                    color: colorScheme.expense,
                                    borderRadius: BorderRadius.circular(6),
                                    boxShadow: [
                                      BoxShadow(
                                        color: colorScheme.expense.withOpacity(0.35),
                                        blurRadius: 8,
                                        offset: const Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 8),
                                // Income bar (right)
                                Container(
                                  width: barWidth,
                                  height: incomeHeight,
                                  decoration: BoxDecoration(
                                    color: colorScheme.income,
                                    borderRadius: BorderRadius.circular(6),
                                    boxShadow: [
                                      BoxShadow(
                                        color: colorScheme.income.withOpacity(0.35),
                                        blurRadius: 8,
                                        offset: const Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            Text(
                              'Minggu ${week['week'].toString().padLeft(2, '0')}',
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            // Legend
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(width: 18, height: 18, decoration: BoxDecoration(color: colorScheme.expense, borderRadius: BorderRadius.circular(4))),
                const SizedBox(width: 6),
                Text('Expense', style: TextStyle(fontSize: 12)),
                const SizedBox(width: 18),
                Container(width: 18, height: 18, decoration: BoxDecoration(color: colorScheme.income, borderRadius: BorderRadius.circular(4))),
                const SizedBox(width: 6),
                Text('Income', style: TextStyle(fontSize: 12)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}