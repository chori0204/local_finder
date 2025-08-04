// lib/features/finder/widgets/finder_card.dart
import 'package:flutter/material.dart';
import '/data/models/location.dart';

class FinderCard extends StatelessWidget {
  final Location result;

  const FinderCard({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        title: Text(result.title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text('${result.roadAddress}\n${result.address}'),
        isThreeLine: true,
      ),
    );
  }
}
