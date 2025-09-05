import 'package:flutter/material.dart';
import 'package:finance_tracker/utils/currency_utils.dart';
import 'package:finance_tracker/services/db_service.dart';
import 'package:finance_tracker/theme.dart';

class CardBalance extends StatefulWidget {
  const CardBalance({super.key});

  @override
  State<CardBalance> createState() => _CardBalanceState();
}

class _CardBalanceState extends State<CardBalance> {
  int estimationBalance = 0;
  int expenseEstimation = 0;
  int incomeEstimation = 0;
  bool loading = true;

  @override
  void initState() {
    super.initState();
    _loadTotalEquity();
  }

  Future<void> _loadTotalEquity() async {
    final db = await DbService.database;
    final expenseSumRes = await db.rawQuery(
      'SELECT SUM(expense_estimation) as total FROM equity',
    );
    final incomeSumRes = await db.rawQuery(
      'SELECT SUM(income_estimation) as total FROM equity',
    );
    final balanceSumRes = await db.rawQuery(
      'SELECT SUM(estimation_balance) as total FROM equity',
    );

    expenseEstimation = (expenseSumRes.first['total'] as int?) ?? 0;
    incomeEstimation = (incomeSumRes.first['total'] as int?) ?? 0;
    estimationBalance = (balanceSumRes.first['total'] as int?) ?? 0;

    setState(() => loading = false);
  }

  @override
  Widget build(BuildContext context) {
    if (loading) return const Center(child: CircularProgressIndicator());
    final colorScheme = Theme.of(context).colorScheme;
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 400),
        child: Container(
          decoration: BoxDecoration(
            color: colorScheme.surface,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: colorScheme.primary.withOpacity(0.18),
                blurRadius: 32,
                spreadRadius: 2,
                offset: const Offset(0, 8),
              ),
              BoxShadow(
                color: colorScheme.primary.withOpacity(0.08),
                blurRadius: 8,
                spreadRadius: 1,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.account_balance_wallet,
                      color: colorScheme.primary,
                      size: 40,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'BALANCE',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: colorScheme.primary,
                        letterSpacing: 2,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  formatCurrency(estimationBalance, defaultCurrencyInfo),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: colorScheme.primary,
                    shadows: [
                      Shadow(
                        color: colorScheme.primary.withOpacity(0.35),
                        blurRadius: 16,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 18),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          color: colorScheme.expense.withOpacity(0.10),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.arrow_circle_down_rounded,
                                  color: colorScheme.expense,
                                  size: 18,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  'EXPENSE',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: colorScheme.expense,
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 2),
                            Text(
                              formatCurrency(
                                expenseEstimation,
                                defaultCurrencyInfo,
                              ),
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: colorScheme.expense,
                                shadows: [
                                  Shadow(
                                    color: Colors.redAccent.withOpacity(0.55),
                                    blurRadius: 16,
                                    offset: Offset(0, 0),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          color: colorScheme.income.withOpacity(0.10),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.arrow_circle_up_rounded,
                                  color: colorScheme.income,
                                  size: 18,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  'INCOME',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: colorScheme.income,
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 2),
                            Text(
                              formatCurrency(
                                incomeEstimation,
                                defaultCurrencyInfo,
                              ),
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: colorScheme.income,
                                shadows: [
                                  Shadow(
                                    color: Colors.greenAccent.withOpacity(0.55),
                                    blurRadius: 16,
                                    offset: Offset(0, 0),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
