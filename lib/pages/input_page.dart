import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Placeholder(
            fallbackHeight: 200.0,
            fallbackWidth: 200.0,
            color: Theme.of(context).colorScheme.secondary,
            strokeWidth: 2.0,
            child: Center(child: Text('Input Page Placeholder')),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  content: Text(
                    'Ini snackbar custom!',
                    style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
                  ),
                  action: SnackBarAction(
                    label: 'Tutup',
                    textColor: Theme.of(context).colorScheme.onPrimary,
                    onPressed: () {},
                  ),
                ),
              );
            },
            child: Text('Tampilkan Snackbar', style: TextStyle(color: Theme.of(context).colorScheme.primary)),
          ),
        ],
      ),
    );
  }
}