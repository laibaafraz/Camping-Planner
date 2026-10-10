import 'package:flutter/material.dart';
import '../data/location_data.dart';

class LocationsScreen extends StatefulWidget {
  const LocationsScreen({super.key});

  @override
  State<LocationsScreen> createState() => _LocationsScreenState();
}

class _LocationsScreenState extends State<LocationsScreen> {
  String selected = locations.keys.first;

  Widget block(String title, Widget child) => Card(
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(title, style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 6),
            child,
          ]),
        ),
      );

  @override
  Widget build(BuildContext context) {
    final l = locations[selected]!;
    return Scaffold(
      appBar: AppBar(title: const Text('Location information')),
      body: ListView(padding: const EdgeInsets.all(12), children: [
        DropdownButtonFormField<String>(
          value: selected,
          decoration: const InputDecoration(
              labelText: 'Terrain', border: OutlineInputBorder()),
          items: locations.keys
              .map((k) => DropdownMenuItem(value: k, child: Text(k)))
              .toList(),
          onChanged: (v) => setState(() => selected = v!),
        ),
        const SizedBox(height: 8),
        block('Best time', Text(l.best)),
        block('Water', Text(l.water)),
        block(
            'Watch out for',
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: l.watch.map((w) => Text('• $w')).toList())),
        block('Camp tip', Text(l.tip)),
      ]),
    );
  }
}
