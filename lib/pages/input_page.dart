import 'package:flutter/material.dart';
import 'package:finance_tracker/utils/currency_utils.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int _step = 0;
  final _dateController = TextEditingController();
  final Map<String, TextEditingController> _expenseControllers = {
    'Pagi': TextEditingController(),
    'Siang': TextEditingController(),
    'Sore': TextEditingController(),
    'Malam': TextEditingController(),
    'Bensin': TextEditingController(),
  };
  final Map<String, TextEditingController> _incomeControllers = {
    'Gaji': TextEditingController(),
    'Trade': TextEditingController(),
  };

  void _reset() {
    setState(() => _step = 0);
    _dateController.clear();
    _expenseControllers.forEach((_, c) => c.clear());
    _incomeControllers.forEach((_, c) => c.clear());
  }

  Widget _buildStepper() {
    switch (_step) {
      case 1:
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Step 1: Input Date',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _dateController,
                  decoration: const InputDecoration(
                    labelText: 'Tanggal',
                    border: OutlineInputBorder(),
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
                          '${picked.day}/${picked.month}/${picked.year}';
                    }
                  },
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: _reset,
                        child: const Text('CANCEL'),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => setState(() => _step = 2),
                        child: const Text('NEXT'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      case 2:
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Step 2: Input Expense',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 16),
                ..._expenseControllers.entries.map(
                  (e) => Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: TextField(
                      controller: e.value,
                      decoration: InputDecoration(
                        labelText:
                            '${e.key} (${expenseCurrency[e.key]?.label ?? ''})',
                        border: const OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        CurrencyInputFormatter(expenseCurrency[e.key]!),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () => setState(() => _step = 1),
                        child: const Text('BACK'),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => setState(() => _step = 3),
                        child: const Text('NEXT'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      case 3:
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Step 3: Input Income',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 16),
                ..._incomeControllers.entries.map(
                  (e) => Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: TextField(
                      controller: e.value,
                      decoration: InputDecoration(
                        labelText:
                            '${e.key} (${incomeCurrency[e.key]?.label ?? ''})',
                        border: const OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        CurrencyInputFormatter(incomeCurrency[e.key]!),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () => setState(() => _step = 2),
                        child: const Text('BACK'),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          // Simpan data, reset, dll
                          _reset();
                        },
                        child: const Text('CONTINUE'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      default:
        return const SizedBox.shrink();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: _step == 0
              ? Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 16,
                  ),
                  elevation: 6,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(32),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.flag,
                          color: Theme.of(context).colorScheme.primary,
                          size: 48,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Selesaikan misi harianmu!',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Tap tombol di kanan bawah untuk mulai input data harian.',
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                )
              : _buildStepper(),
        ),
        Positioned(
          bottom: 32,
          right: 32,
          child: _step == 0
              ? FloatingActionButton(
                  onPressed: () => setState(() => _step = 1),
                  child: const Icon(Icons.add),
                )
              : const SizedBox.shrink(),
        ),
      ],
    );
  }
}
