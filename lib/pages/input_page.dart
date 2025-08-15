import 'package:flutter/material.dart';
import 'package:finance_tracker/theme.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder(
      fallbackHeight: 200.0,
      fallbackWidth: 200.0,
      color: AppTheme.secondary,
      strokeWidth: 2.0,
      child: Center(child: Text('Input Page Placeholder')),
    );
  }
}