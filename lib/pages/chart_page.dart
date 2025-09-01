import 'package:flutter/material.dart';

class ChartPage extends StatefulWidget {
  const ChartPage({super.key});

  @override
  State<ChartPage> createState() => _ChartPageState();
}

class _ChartPageState extends State<ChartPage> {
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