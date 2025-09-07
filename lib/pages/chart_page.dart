import 'package:flutter/material.dart';
import 'package:finance_tracker/widgets/charts/chart_weekly.dart';
import 'package:finance_tracker/services/db_service.dart';
import 'package:finance_tracker/utils/chart_utils.dart';

class ChartPage extends StatefulWidget {
  const ChartPage({super.key});

  @override
  State<ChartPage> createState() => _ChartPageState();
}

class _ChartPageState extends State<ChartPage> {
  List<Map<String, dynamic>> weeklyData = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    final equityList = await DbService.getAllEquity();
    setState(() {
      weeklyData = groupEquityByWeek(equityList);
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'CHART',
                  style: textTheme.titleLarge?.copyWith(
                    color: colorScheme.primary,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
                const SizedBox(height: 24),
                weeklyData.isEmpty
                    ? const Center(child: CircularProgressIndicator())
                    : ChartWeekly(weeklyData: weeklyData),
              ],
            ),
          ),
        ),
      ),
    );
  }
}