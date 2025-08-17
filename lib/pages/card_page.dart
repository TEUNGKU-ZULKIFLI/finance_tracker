import 'package:flutter/material.dart';

class CardPage extends StatefulWidget {
  const CardPage({super.key});

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  @override
  Widget build(BuildContext context) {
    return Placeholder(
      fallbackHeight: 200.0,
      fallbackWidth: 200.0,
      color: Theme.of(context).colorScheme.secondary,
      strokeWidth: 2.0,
      child: Center(child: Text('Card Page Placeholder')),
    );
  }
}