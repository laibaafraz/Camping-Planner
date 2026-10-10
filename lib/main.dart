import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() => runApp(const CampingApp());

class CampingApp extends StatelessWidget {
  const CampingApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Camping Planner',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorSchemeSeed: const Color(0xFF2F5D3A),
          useMaterial3: true,
        ),
        home: const HomeScreen(),
      );
}
