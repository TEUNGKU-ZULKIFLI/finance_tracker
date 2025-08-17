import 'package:flutter/material.dart';

class TradePage extends StatefulWidget {
  const TradePage({super.key});

  @override
  State<TradePage> createState() => _TradePageState();
}

class _TradePageState extends State<TradePage> {
  @override
  Widget build(BuildContext context) {
    return Placeholder(
      fallbackHeight: 200.0,
      fallbackWidth: 200.0,
      color: Theme.of(context).colorScheme.secondary,
      strokeWidth: 2.0,
      child: Center(child: Text('Trade Page Placeholder')),
    );
  }
}