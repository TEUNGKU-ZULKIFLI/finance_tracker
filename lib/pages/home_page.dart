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
  if (loading) {
    return const Center(child: CircularProgressIndicator());
  }
  return SafeArea(
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 24),
          const CardBalance(),
          ChartPie(balance: balance),
        ],
      ),
    ),
  );
}
}