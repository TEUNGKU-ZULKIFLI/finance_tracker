import 'package:flutter/material.dart';
import 'package:finance_tracker/services/db_service.dart';
import 'package:finance_tracker/models/user_history_model.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  List<UserHistoryModel> historyList = [];
  String? filterAction;

  @override
  void initState() {
    super.initState();
    _loadHistory();
  }

  Future<void> _loadHistory() async {
    historyList = await DbService().getHistory();
    setState(() {});
  }

  Future<void> _deleteAllHistory() async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Hapus Semua History?'),
        content: const Text('Data history akan dihapus permanen.'),
        actions: [
          TextButton(
            child: const Text('Batal'),
            onPressed: () => Navigator.pop(context, false),
          ),
          ElevatedButton(
            child: const Text('Hapus'),
            onPressed: () => Navigator.pop(context, true),
          ),
        ],
      ),
    );
    if (confirm == true) {
      await DbService().clearHistory();
      _loadHistory();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('History berhasil dihapus')),
      );
    }
  }

  List<UserHistoryModel> get filteredHistory {
    if (filterAction == null || filterAction == 'ALL') return historyList;
    return historyList.where((h) => h.action == filterAction).toList();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final actions = [
      'ALL',
      'create_input',
      'delete_input',
      'create_card',
      'update_card',
      'delete_card',
    ];
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 24),
          Center(
            child: Text(
              'HISTORY',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: colorScheme.primary,
                letterSpacing: 1.2,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: filterAction ?? 'ALL',
                    decoration: const InputDecoration(
                      labelText: 'Filter Aksi',
                      border: OutlineInputBorder(),
                    ),
                    items: actions.map((act) {
                      return DropdownMenuItem(
                        value: act,
                        child: Text(act == 'ALL' ? 'Semua' : act),
                      );
                    }).toList(),
                    onChanged: (val) {
                      setState(() {
                        filterAction = val;
                      });
                    },
                  ),
                ),
                const SizedBox(width: 12),
                IconButton(
                  icon: Icon(Icons.delete_forever, color: colorScheme.error),
                  tooltip: 'Delete All History',
                  onPressed: _deleteAllHistory,
                ),
              ],
            ),
          ),
          Expanded(
            child: filteredHistory.isEmpty
                ? const Center(child: Text('Belum ada history'))
                : ListView.builder(
                    itemCount: filteredHistory.length,
                    itemBuilder: (context, index) {
                      final h = filteredHistory[index];
                      return ListTile(
                        leading: Icon(
                          _getIcon(h.action),
                          color: colorScheme.primary,
                        ),
                        title: Text(h.desc),
                        subtitle: Text(
                          h.timestamp.replaceFirst('T', ' ').substring(0, 19),
                          style: const TextStyle(fontSize: 12),
                        ),
                        trailing: Text(
                          h.action.replaceAll('_', ' '),
                          style: TextStyle(
                            color: colorScheme.secondary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  IconData _getIcon(String action) {
    switch (action) {
      case 'create_input':
        return Icons.add_circle_outline;
      case 'delete_input':
        return Icons.remove_circle_outline;
      case 'create_card':
        return Icons.credit_card;
      case 'update_card':
        return Icons.edit;
      case 'delete_card':
        return Icons.delete;
      default:
        return Icons.history;
    }
  }
}