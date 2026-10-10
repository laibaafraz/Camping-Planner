import 'package:flutter/material.dart';
import 'trips_screen.dart';
import 'packing_screen.dart';
import 'locations_screen.dart';
import 'tips_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;

  final pages = const [
    TripsScreen(),
    PackingScreen(),
    LocationsScreen(),
    TipsScreen(),
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
        body: IndexedStack(index: index, children: pages),
        bottomNavigationBar: NavigationBar(
          selectedIndex: index,
          onDestinationSelected: (i) => setState(() => index = i),
          destinations: const [
            NavigationDestination(icon: Icon(Icons.map_outlined), label: 'Trips'),
            NavigationDestination(icon: Icon(Icons.checklist), label: 'Packing'),
            NavigationDestination(icon: Icon(Icons.terrain), label: 'Locations'),
            NavigationDestination(
                icon: Icon(Icons.health_and_safety_outlined), label: 'Tips'),
          ],
        ),
      );
}
