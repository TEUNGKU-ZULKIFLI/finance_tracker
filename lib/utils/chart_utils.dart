import '../models/equity_model.dart';
import 'package:finance_tracker/models/date_model.dart';

// Fungsi untuk mengelompokkan data equity berdasarkan minggu
List<Map<String, dynamic>> groupEquityByWeek(List<EquityModel> equityList) {
  Map<int, Map<String, dynamic>> weekly = {};
  for (var eq in equityList) {
    int week = ((eq.dateId - 1) ~/ 7) + 1;
    if (!weekly.containsKey(week)) {
      weekly[week] = {
        'week': week,
        'expense': 0,
        'income': 0,
      };
    }
    weekly[week]!['expense'] += eq.expenseEstimation;
    weekly[week]!['income'] += eq.incomeEstimation;
  }
  return weekly.values.toList()..sort((a, b) => a['week'].compareTo(b['week']));
}

// Fungsi untuk mengelompokkan data equity berdasarkan bulan
List<Map<String, dynamic>> groupEquityByMonth(
  List<EquityModel> equityList,
  Map<int, DateModel> dateMap,
) {
  Map<int, Map<String, dynamic>> monthly = {};
  for (var eq in equityList) {
    final dateStr = dateMap[eq.dateId]?.date ?? '';
    int month = 0;
    if (dateStr.isNotEmpty) {
      month = DateTime.parse(dateStr).month;
    }
    if (!monthly.containsKey(month)) {
      monthly[month] = {
        'month': month,
        'expense': 0,
        'income': 0,
      };
    }
    monthly[month]!['expense'] += eq.expenseEstimation;
    monthly[month]!['income'] += eq.incomeEstimation;
  }
  return monthly.values.toList()..sort((a, b) => a['month'].compareTo(b['month']));
}