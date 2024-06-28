import 'package:flutter/material.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: Divider(
            color: Colors.black,
            height: 1,
            indent: 20,
            endIndent: 20,
          ),
        ),
        Text('or'),
        Expanded(
          child: Divider(
            color: Colors.black,
            height: 1,
            indent: 20,
            endIndent: 20,
          ),
        ),
      ],
    );
  }
}
