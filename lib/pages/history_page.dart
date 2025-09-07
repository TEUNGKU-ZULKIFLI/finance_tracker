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
  String sortBy = 'timestamp'; // default sort by date
  bool desc = true; // default descending

  @override
  void initState() {
    super.initState();
    _loadHistory();
  }

  Future<void> _loadHistory() async {
    historyList = await DbService().getHistorySorted(
      sortBy: sortBy,
      desc: desc,
    );
    setState(() {});
  }

  Future<void> _deleteAllHistory() async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete All History?'),
        content: const Text('History data will be permanently deleted.'),
        actions: [
          TextButton(
            child: const Text('Cancel'),
            onPressed: () => Navigator.pop(context, false),
          ),
          ElevatedButton(
            child: const Text('Delete'),
            onPressed: () => Navigator.pop(context, true),
          ),
        ],
      ),
    );
    if (confirm == true) {
      await DbService().clearHistory();
      _loadHistory();
      if (context.mounted) {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('History successfully deleted')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 24),
          Center(
            child: Text(
              'HISTORY',
              style: textTheme.titleLarge?.copyWith(
                color: colorScheme.primary,
                fontWeight: FontWeight.bold,
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
                    initialValue: sortBy,
                    decoration: const InputDecoration(
                      labelText: 'Sort By',
                      border: OutlineInputBorder(),
                    ),
                    items: [
                      DropdownMenuItem(value: 'timestamp', child: Text('Date')),
                      DropdownMenuItem(value: 'desc', child: Text('Name')),
                      DropdownMenuItem(value: 'action', child: Text('Type')),
                    ],
                    onChanged: (val) {
                      setState(() {
                        sortBy = val!;
                        _loadHistory();
                      });
                    },
                  ),
                ),
                const SizedBox(width: 12),
                DropdownButton<bool>(
                  value: desc,
                  items: [
                    DropdownMenuItem(value: true, child: Text('DESC')),
                    DropdownMenuItem(value: false, child: Text('ASC')),
                  ],
                  onChanged: (val) {
                    setState(() {
                      desc = val!;
                      _loadHistory();
                    });
                  },
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
            child: historyList.isEmpty
                ? Center(
                    child: Text(
                      'No history available',
                      style: textTheme.bodyLarge?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  )
                : ListView.builder(
                    itemCount: historyList.length,
                    itemBuilder: (context, index) {
                      final h = historyList[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        child: Card(
                          color: colorScheme.surface,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: ListTile(
                            leading: Icon(
                              _getIcon(h.action),
                              color: colorScheme.primary,
                            ),
                            title: Text(
                              h.desc,
                              style: textTheme.bodyLarge?.copyWith(
                                color: colorScheme.onSurface,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            subtitle: Text(
                              h.timestamp
                                  .replaceFirst('T', ' ')
                                  .substring(0, 19),
                              style: textTheme.labelMedium?.copyWith(
                                color: colorScheme.onSurfaceVariant,
                              ),
                            ),
                            trailing: Text(
                              h.action.replaceAll('_', ' '),
                              style: textTheme.labelMedium?.copyWith(
                                color: colorScheme.secondary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
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
      case 'CREATE_INPUT':
        return Icons.add_circle_outline;
      case 'DELETE_INPUT':
        return Icons.remove_circle_outline;
      case 'CREATE_CARD':
        return Icons.credit_card;
      case 'UPDATE_CARD':
        return Icons.edit;
      case 'DELETE_CARD':
        return Icons.delete;
      default:
        return Icons.history;
    }
  }
}
