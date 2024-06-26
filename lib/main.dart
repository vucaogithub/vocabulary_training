import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:vocabulary_training/screens/home/home_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.light,
        ),
        cardTheme: CardTheme(
          color: Colors.grey.shade300
        ),
        appBarTheme: const AppBarTheme(
            color: Colors.blue,
            surfaceTintColor: Colors.white,
            foregroundColor: Colors.white),
      ),
      builder: FToastBuilder(),
      home: const HomeScreen(),
    );
  }
}
