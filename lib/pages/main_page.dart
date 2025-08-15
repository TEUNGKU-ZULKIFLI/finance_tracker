import 'package:flutter/material.dart' hide NavigationBar;
import 'package:finance_tracker/widget/navbar.dart';
import 'package:finance_tracker/widget/appbar.dart';

// Import semua halaman
import 'home_page.dart';
import 'trade_page.dart';
import 'input_page.dart';
import 'card_page.dart';
import 'riwayat_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    HomePage(),
    TradePage(),
    InputPage(),
    CardPage(),
    RiwayatPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _onFabPressed() {
    setState(() {
      _currentIndex = 2; // langsung ke halaman Input
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Appbar(),
      body: _pages[_currentIndex],
      bottomNavigationBar: NavigationBar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        onFabPressed: _onFabPressed,
      ),
    );
  }
}
