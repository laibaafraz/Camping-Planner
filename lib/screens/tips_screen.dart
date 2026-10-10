import 'package:flutter/material.dart';
import '../data/tips_data.dart';

class TipsScreen extends StatelessWidget {
  const TipsScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('Survival tips')),
        body: ListView(
          children: tips.entries
              .map((e) => ExpansionTile(
                    title: Text(e.key),
                    childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
                    expandedCrossAxisAlignment: CrossAxisAlignment.start,
                    children: e.value.map((t) => Text('• $t')).toList(),
                  ))
              .toList(),
        ),
      );
}
