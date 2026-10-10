import 'package:flutter/material.dart';
import '../services/storage.dart';

class TripsScreen extends StatefulWidget {
  const TripsScreen({super.key});

  @override
  State<TripsScreen> createState() => _TripsScreenState();
}

class _TripsScreenState extends State<TripsScreen> {
  Rows trips = [];

  @override
  void initState() {
    super.initState();
    Storage.load('trips', []).then((v) => setState(() => trips = v));
  }

  Future<void> addTrip() async {
    final name = TextEditingController();
    final place = TextEditingController();
    final days = TextEditingController(text: '2');
    final people = TextEditingController(text: '2');

    final ok = await showDialog<bool>(
      context: context,
      builder: (c) => AlertDialog(
        title: const Text('New trip'),
        content: SingleChildScrollView(
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            TextField(
                controller: name,
                decoration: const InputDecoration(labelText: 'Trip name')),
            TextField(
                controller: place,
                decoration: const InputDecoration(labelText: 'Place')),
            TextField(
                controller: days,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Days')),
            TextField(
                controller: people,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'People')),
          ]),
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(c, false),
              child: const Text('Cancel')),
          FilledButton(
              onPressed: () => Navigator.pop(c, true),
              child: const Text('Save trip')),
        ],
      ),
    );

    if (!mounted || ok != true || name.text.trim().isEmpty) return;
    setState(() => trips.insert(0, {
          'name': name.text.trim(),
          'place':
              place.text.trim().isEmpty ? 'Place not set' : place.text.trim(),
          'days': days.text,
          'people': people.text,
        }));
    Storage.save('trips', trips);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('My trips')),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: addTrip,
          icon: const Icon(Icons.add),
          label: const Text('New trip'),
        ),
        body: trips.isEmpty
            ? const Center(
                child: Text('No trips yet. Tap "New trip" to plan one.'))
            : ListView.builder(
                itemCount: trips.length,
                itemBuilder: (_, i) {
                  final t = trips[i];
                  return Card(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    child: ListTile(
                      leading: const Icon(Icons.cabin),
                      title: Text(t['name']),
                      subtitle: Text(
                          '${t['place']} · ${t['days']} days · ${t['people']} people'),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete_outline),
                        onPressed: () {
                          setState(() => trips.removeAt(i));
                          Storage.save('trips', trips);
                        },
                      ),
                    ),
                  );
                },
              ),
      );
}
