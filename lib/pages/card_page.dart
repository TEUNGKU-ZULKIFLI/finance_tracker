import 'package:flutter/material.dart';
import 'package:finance_tracker/theme.dart';

class CardPage extends StatefulWidget {
  const CardPage({super.key});

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder(
      fallbackHeight: 200.0,
      fallbackWidth: 200.0,
      color: AppTheme.secondary,
      strokeWidth: 2.0,
      child: Center(child: Text('Card Page Placeholder')),
    );
  }
}