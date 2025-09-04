import 'package:flutter/material.dart';
import 'package:finance_tracker/widgets/cards/card_balance.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 24),
          Center(child: CardBalance()),
          // Widget lain bisa ditambahkan di bawah sini
        ],
      ),
    );
  }
}