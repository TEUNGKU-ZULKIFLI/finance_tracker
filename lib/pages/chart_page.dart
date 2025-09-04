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
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(35.0),
          child: weeklyData.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : ChartWeekly(weeklyData: weeklyData),
        ),
      ),
    );
  }
}