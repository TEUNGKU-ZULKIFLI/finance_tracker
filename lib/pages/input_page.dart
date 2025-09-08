import 'package:finance_tracker/theme.dart';
import 'package:flutter/material.dart';
import 'package:finance_tracker/utils/currency_utils.dart';
import 'package:finance_tracker/widgets/snackbar.dart';
import 'package:finance_tracker/services/db_service.dart';
import 'package:finance_tracker/models/date_model.dart';
import 'package:finance_tracker/models/expense_model.dart';
import 'package:finance_tracker/models/income_model.dart';
import 'package:finance_tracker/models/balance_model.dart';
import 'package:finance_tracker/models/equity_model.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  OverlayEntry? _snackbarEntry;

  void _showCustomSnackbar(String message, SnackbarType type) {
    _snackbarEntry?.remove();
    _snackbarEntry = OverlayEntry(
      builder: (ctx) => Positioned(
        bottom: 80,
        left: 0,
        right: 0,
        child: Snackbar(message: message, type: type),
      ),
    );
    Overlay.of(context).insert(_snackbarEntry!);
    Future.delayed(const Duration(seconds: 3), () => _snackbarEntry?.remove());
  }

  int _step = 0;
  final _dateController = TextEditingController();
  final Map<String, TextEditingController> _expenseControllers = {
    'Morning': TextEditingController(),
    'Afternoon': TextEditingController(),
    'Evening': TextEditingController(),
    'Night': TextEditingController(),
    'Fuel': TextEditingController(),
  };
  final Map<String, TextEditingController> _incomeControllers = {
    'Salary': TextEditingController(),
    'Others': TextEditingController(),
  };
  String? _errorMsg;

  void _reset() {
    setState(() {
      _step = 0;
      _errorMsg = null;
    });
    _dateController.clear();
    _expenseControllers.forEach((_, c) => c.clear());
    _incomeControllers.forEach((_, c) => c.clear());
  }

  Widget _buildStepper() {
    // Step 1: Input Date
    if (_step == 1) {
      return Card(
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: Theme.of(context).colorScheme.surface,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.calendar_today,
                    color: Theme.of(context).colorScheme.primary,
                    size: 22,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'DATE',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                      letterSpacing: 2,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _dateController,
                decoration: InputDecoration(
                  labelText: 'Date',
                  border: const OutlineInputBorder(),
                  prefixIcon: const Icon(Icons.calendar_today),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
                readOnly: true,
                onTap: () async {
                  final picked = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2020),
                    lastDate: DateTime(2100),
                  );
                  if (picked != null) {
                    _dateController.text =
                        '${picked.year}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}';
                  }
                },
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: _reset,
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Theme.of(
                          context,
                        ).colorScheme.secondary,
                        side: BorderSide(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                      child: const Text('CANCEL'),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => setState(() => _step = 2),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        foregroundColor: Colors.white,
                      ),
                      child: const Text('NEXT'),
                    ),
                  ),
                ],
              ),
              if (_errorMsg != null) ...[
                const SizedBox(height: 4),
                Text(
                  _errorMsg!,
                  style: TextStyle(color: Theme.of(context).colorScheme.error),
                ),
              ],
            ],
          ),
        ),
      );
    }
    // Step 2: Input Expense
    if (_step == 2) {
      return Card(
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: Theme.of(context).colorScheme.surface,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.arrow_circle_down_rounded,
                    color: Theme.of(context).colorScheme.expense,
                    size: 22,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'EXPENSE',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.expense,
                      letterSpacing: 2,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ..._expenseControllers.entries.map(
                (e) => Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: TextField(
                    controller: e.value,
                    decoration: InputDecoration(
                      labelText: e.key,
                      border: const OutlineInputBorder(),
                      prefixIcon: const Icon(Icons.money_off),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      CurrencyInputFormatter(
                        expenseCurrency[e.key] ?? defaultCurrencyInfo,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => setState(() => _step = 1),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Theme.of(
                          context,
                        ).colorScheme.secondary,
                        side: BorderSide(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                      child: const Text('BACK'),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => setState(() => _step = 3),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        foregroundColor: Colors.white,
                      ),
                      child: const Text('NEXT'),
                    ),
                  ),
                ],
              ),
              if (_errorMsg != null) ...[
                const SizedBox(height: 4),
                Text(
                  _errorMsg!,
                  style: TextStyle(color: Theme.of(context).colorScheme.error),
                ),
              ],
            ],
          ),
        ),
      );
    }
    // Step 3: Input Income
    if (_step == 3) {
      return Card(
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: Theme.of(context).colorScheme.surface,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.arrow_circle_up_rounded,
                    color: Theme.of(context).colorScheme.income,
                    size: 22,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'INCOME',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.income,
                      letterSpacing: 2,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _incomeControllers['Salary'],
                decoration: InputDecoration(
                  labelText: 'Salary',
                  border: const OutlineInputBorder(),
                  prefixIcon: const Icon(Icons.attach_money),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  CurrencyInputFormatter(
                    incomeCurrency['Salary'] ?? defaultCurrencyInfo,
                  ),
                ],
              ),
              const SizedBox(height: 12),
TextField(
  controller: _incomeControllers['Others'],
  decoration: InputDecoration(
    labelText: 'Others',
    border: const OutlineInputBorder(),
    prefixIcon: const Icon(Icons.money),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Theme.of(context).colorScheme.primary,
      ),
    ),
  ),
  keyboardType: TextInputType.number,
  inputFormatters: [
    CurrencyInputFormatter(defaultCurrencyInfo),
  ],
),
              const SizedBox(height: 5),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => setState(() => _step = 2),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Theme.of(
                          context,
                        ).colorScheme.secondary,
                        side: BorderSide(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                      child: const Text('BACK'),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _handleSave,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        foregroundColor: Colors.white,
                      ),
                      child: const Text('SAVE'),
                    ),
                  ),
                ],
              ),
              if (_errorMsg != null) ...[
                const SizedBox(height: 4),
                Text(
                  _errorMsg!,
                  style: TextStyle(color: Theme.of(context).colorScheme.error),
                ),
              ],
            ],
          ),
        ),
      );
    }
    return const SizedBox.shrink();
  }

  Future<void> _handleSave() async {
    setState(() => _errorMsg = null);
    final dateStr = _dateController.text;
    if (dateStr.isEmpty) {
      setState(() => _errorMsg = 'Date is required');
      _showCustomSnackbar('Date is required', SnackbarType.error);
      return;
    }
    // Validasi minimal satu field expense/income terisi
    final expenseValues = _expenseControllers.values
        .map((c) => c.text.trim())
        .toList();
    final incomeValues = _incomeControllers.values
        .map((c) => c.text.trim())
        .toList();
    final isExpenseFilled = expenseValues.any((v) => v.isNotEmpty && v != '0');
    final isIncomeFilled = incomeValues.any((v) => v.isNotEmpty && v != '0');
    if (!isExpenseFilled && !isIncomeFilled) {
      setState(
        () =>
            _errorMsg = 'At least one expense or income field must be filled',
      );
      _showCustomSnackbar(_errorMsg!, SnackbarType.error);
      return;
    }
    try {
      // Insert or get date_id
      DateModel? dateModel = await DbService.getDateByValue(dateStr);
      int dateId;
      if (dateModel == null) {
        dateId = await DbService.insertDate(DateModel(date: dateStr));
      } else {
        dateId = dateModel.id!;
      }

      final expenseModel = ExpenseModel(
        dateId: dateId,
        pagi: parseCurrencyToInt(_expenseControllers['Morning']?.text ?? '0'),
        siang: parseCurrencyToInt(_expenseControllers['Afternoon']?.text ?? '0'),
        sore: parseCurrencyToInt(_expenseControllers['Evening']?.text ?? '0'),
        malam: parseCurrencyToInt(_expenseControllers['Night']?.text ?? '0'),
        bensin: parseCurrencyToInt(_expenseControllers['Fuel']?.text ?? '0'),
      );
      await DbService.insertExpense(expenseModel);
      await DbService().insertHistory(
        'CREATE_INPUT',
        'Entry success create to date $dateStr',
        DateTime.now().toIso8601String(),
      );

final incomeModel = IncomeModel(
  dateId: dateId,
  gaji: parseCurrencyToInt(_incomeControllers['Salary']?.text ?? '0'),
  lainnya: parseCurrencyToInt(_incomeControllers['Others']?.text ?? '0'),
);
await DbService.insertIncome(incomeModel);

      // Hitung balance
      final totalIncome = incomeModel.gaji + incomeModel.lainnya;
      final totalExpense =
          expenseModel.pagi +
          expenseModel.siang +
          expenseModel.sore +
          expenseModel.malam +
          expenseModel.bensin;
      final balanceModel = BalanceModel(
        dateId: dateId,
        balance: totalIncome - totalExpense,
      );
      await DbService.insertBalance(balanceModel);

      // Insert equity
      final equityModel = EquityModel(
        dateId: dateId,
        expenseEstimation: totalExpense,
        incomeEstimation: totalIncome,
        estimationBalance: totalIncome - totalExpense,
      );
      await DbService.insertEquity(equityModel);

      _showCustomSnackbar('Data saved successfully!', SnackbarType.success);
      _reset();
    } catch (e) {
      _showCustomSnackbar('Failed to save data: $e', SnackbarType.error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: _step == 0
            ? Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                color: Theme.of(context).colorScheme.surface,
                child: Padding(
                  padding: const EdgeInsets.all(32),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.flag,
                        size: 56,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Complete your daily mission!',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Tap the button below to start entering your daily data.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                      const SizedBox(height: 32),
                      ElevatedButton.icon(
                        icon: const Icon(Icons.add),
                        label: const Text('ENTER DATA'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(
                            context,
                          ).colorScheme.primary,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 32,
                            vertical: 16,
                          ),
                        ),
                        onPressed: () => setState(() => _step = 1),
                      ),
                    ],
                  ),
                ),
              )
            : _buildStepper(),
      ),
    );
  }
}
