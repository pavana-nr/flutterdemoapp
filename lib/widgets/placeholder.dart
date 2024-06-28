// Placeholder widget for each tab
import 'package:flutter/material.dart';

class PlaceholderWidget extends StatelessWidget {
  final Color color;
  final String title;

  const PlaceholderWidget(this.color, this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: Column(children: [
        Text(
          title,
          style: const TextStyle(fontSize: 22),
        ),
        const Icon(Icons.add)
      ]),
    );
  }
}
