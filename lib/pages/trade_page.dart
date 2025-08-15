import 'package:flutter/material.dart';
import 'package:finance_tracker/theme.dart';

class TradePage extends StatefulWidget {
  const TradePage({super.key});

  @override
  State<TradePage> createState() => _TradePageState();
}

class _TradePageState extends State<TradePage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder(
      fallbackHeight: 200.0,
      fallbackWidth: 200.0,
      color: AppTheme.secondary,
      strokeWidth: 2.0,
      child: Center(child: Text('Trade Page Placeholder')),
    );
  }
}