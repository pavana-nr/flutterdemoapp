import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PopularMeetupsEventItem extends StatelessWidget {
  PopularMeetupsEventItem({
    super.key,
    required this.url,
  });

  String url;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(6.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        image: DecorationImage(
          image: NetworkImage(url),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
