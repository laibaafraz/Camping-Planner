import 'package:flutter/material.dart';
import '../data/packing_data.dart';
import '../services/storage.dart';

class PackingScreen extends StatefulWidget {
  const PackingScreen({super.key});

  @override
  State<PackingScreen> createState() => _PackingScreenState();
}

class _PackingScreenState extends State<PackingScreen> {
  Rows items = [];
  final input = TextEditingController();

  @override
  void initState() {
    super.initState();
    Storage.load('items', starterRows()).then((v) => setState(() => items = v));
  }

  void add() {
    final v = input.text.trim();
    if (v.isEmpty) return;
    setState(() => items.add({'t': v, 'd': false}));
    input.clear();
    Storage.save('items', items);
  }

  @override
  Widget build(BuildContext context) {
    final done = items.where((i) => i['d'] == true).length;
    return Scaffold(
      appBar: AppBar(title: const Text('Packing list'), actions: [
        IconButton(
          tooltip: 'Reset list',
          icon: const Icon(Icons.restart_alt),
          onPressed: () {
            setState(() => items = starterRows());
            Storage.save('items', items);
          },
        ),
      ]),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            LinearProgressIndicator(
                value: items.isEmpty ? 0 : done / items.length),
            const SizedBox(height: 4),
            Text('$done of ${items.length} packed'),
          ]),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(children: [
            Expanded(
              child: TextField(
                controller: input,
                onSubmitted: (_) => add(),
                decoration: const InputDecoration(
                    hintText: 'Add an item', border: OutlineInputBorder()),
              ),
            ),
            const SizedBox(width: 8),
            FilledButton(onPressed: add, child: const Text('Add')),
          ]),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (_, i) => Dismissible(
              key: ValueKey('${items[i]['t']}$i'),
              background: Container(color: Colors.red.shade200),
              onDismissed: (_) {
                setState(() => items.removeAt(i));
                Storage.save('items', items);
              },
              child: CheckboxListTile(
                value: items[i]['d'] == true,
                title: Text(
                  items[i]['t'],
                  style: TextStyle(
                      decoration: items[i]['d'] == true
                          ? TextDecoration.lineThrough
                          : null),
                ),
                onChanged: (v) {
                  setState(() => items[i]['d'] = v ?? false);
                  Storage.save('items', items);
                },
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
