import 'package:flutter/material.dart';
import 'package:finance_tracker/services/db_service.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  List<Map<String, dynamic>> dates = [];
  List<Map<String, dynamic>> expenses = [];
  List<Map<String, dynamic>> income = [];
  List<Map<String, dynamic>> saldo = [];
  List<Map<String, dynamic>> equity = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    _loadAllData();
  }

  Future<void> _loadAllData() async {
    final db = await DbService.database;
    dates = await db.query('dates', orderBy: 'date DESC');
    expenses = await db.query('expenses');
    income = await db.query('income');
    saldo = await db.query('saldo');
  equity = await db.query('equity');
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Tabel dates', style: TextStyle(fontWeight: FontWeight.bold)),
                    ...dates.map((d) => Text('id: ${d['id']}, date: ${d['date']}')).toList(),
                    const SizedBox(height: 16),
                    const Text('Tabel expenses', style: TextStyle(fontWeight: FontWeight.bold)),
                    ...expenses.map((e) => Text(
                      'id: ${e['id']}, date_id: ${e['date_id']}, pagi: ${e['pagi']}, siang: ${e['siang']}, sore: ${e['sore']}, malam: ${e['malam']}, bensin: ${e['bensin']}'
                    )).toList(),
                    const SizedBox(height: 16),
                    const Text('Tabel income', style: TextStyle(fontWeight: FontWeight.bold)),
                    ...income.map((i) => Text(
                      'id: ${i['id']}, date_id: ${i['date_id']}, gaji: ${i['gaji']}, lainnya: ${i['lainnya']}, currency: ${i['currency']}'
                    )).toList(),
                    const SizedBox(height: 16),
                    const Text('Tabel equity', style: TextStyle(fontWeight: FontWeight.bold)),
                    ...equity.map((e) => Text(
                      'id: ${e['id']}, date_id: ${e['date_id']}, expense_estimation: ${e['expense_estimation']}, income_estimation: ${e['income_estimation']}, estimation_saldo: ${e['estimation_saldo']}'
                    )).toList(),
                    const SizedBox(height: 16),
                    const Text('Tabel saldo', style: TextStyle(fontWeight: FontWeight.bold)),
                    ...saldo.map((s) => Text('id: ${s['id']}, date_id: ${s['date_id']}, saldo: ${s['saldo']}')).toList(),
                    const SizedBox(height: 32),
                    Center(
                      child: ElevatedButton.icon(
                        icon: const Icon(Icons.delete_forever),
                        label: const Text('Reset Data'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                        ),
                        onPressed: () async {
                          final confirm = await showDialog<bool>(
                            context: context,
                            builder: (ctx) => AlertDialog(
                              title: const Text('Konfirmasi Reset'),
                              content: const Text('Hapus semua data? Tindakan ini tidak bisa dibatalkan.'),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.of(ctx).pop(false),
                                  child: const Text('Batal'),
                                ),
                                ElevatedButton(
                                  onPressed: () => Navigator.of(ctx).pop(true),
                                  child: const Text('Hapus'),
                                ),
                              ],
                            ),
                          );
                          if (confirm == true) {
                            setState(() => loading = true);
                            await DbService.clearAll();
                            await _loadAllData();
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Semua data berhasil direset')),
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
