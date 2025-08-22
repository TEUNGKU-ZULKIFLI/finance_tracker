import 'package:flutter/material.dart';
import 'package:finance_tracker/theme.dart';
import 'pages/main_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Finance Tracker',
      theme: MaterialTheme(const TextTheme()).light(),
      darkTheme: MaterialTheme(const TextTheme()).dark(),
      themeMode: ThemeMode.system,
      home: const MainPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
