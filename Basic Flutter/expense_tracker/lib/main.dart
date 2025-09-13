import 'package:expense_tracker/anasayfa.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ColorScheme tema = ColorScheme.fromSeed(seedColor: Colors.blue);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: tema,
        appBarTheme: AppBarTheme(
          backgroundColor: tema.onPrimaryContainer,
          foregroundColor: tema.primaryContainer,
        ),
        cardTheme: CardThemeData(color: tema.secondaryContainer),
        useMaterial3: true,
      ),
      home: Anasayfa(),
    );
  }
}
