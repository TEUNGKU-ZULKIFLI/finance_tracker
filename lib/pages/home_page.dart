import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Placeholder(
      fallbackHeight: 200.0,
      fallbackWidth: 200.0,
      color: Theme.of(context).colorScheme.secondary,
      strokeWidth: 2.0,
      child: Center(child: Text('Home Page Placeholder')),
    );
  }
}