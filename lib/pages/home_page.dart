import 'package:finance_tracker/widgets/charts/chart_pie.dart';
import 'package:flutter/material.dart';
import 'package:finance_tracker/widgets/cards/card_balance.dart';
import 'package:finance_tracker/services/db_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int balance = 0;
  bool loading = true;

  @override
  void initState() {
    super.initState();
    loadBalance();
  }

  Future<void> loadBalance() async {
    final db = await DbService.database;
    final balanceSumRes = await db.rawQuery(
      'SELECT SUM(estimation_balance) as total FROM equity',
    );
    setState(() {
      balance = (balanceSumRes.first['total'] as int?) ?? 0;
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    if (loading) {
      return Scaffold(
        backgroundColor: colorScheme.surface,
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'HOME',
                  style: textTheme.titleLarge?.copyWith(
                    color: colorScheme.primary,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
                const SizedBox(height: 24),
                const CardBalance(),
                const SizedBox(height: 24),
                ChartPie(balance: balance),
              ],
            ),
          ),
        ),
      ),
    );
  }
}