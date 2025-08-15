import 'package:flutter/material.dart';
import 'package:finance_tracker/theme.dart';

class RiwayatPage extends StatefulWidget {
  const RiwayatPage({super.key});

  @override
  State<RiwayatPage> createState() => _RiwayatPageState();
}

class _RiwayatPageState extends State<RiwayatPage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder(
      fallbackHeight: 200.0,
      fallbackWidth: 200.0,
      color: AppTheme.secondary,
      strokeWidth: 2.0,
      child: Center(child: Text('Riwayat Page Placeholder')),
    );
  }
}