import 'package:flutter/material.dart';

class BulletIndicator extends StatelessWidget {
  const BulletIndicator({
    super.key,
    required this.current,
    required this.total,
  })  : assert(current >= 0),
        assert(current < total),
        assert(total > 0);

  final int current;
  final int total;

  @override
  Widget build(BuildContext context) {
    final items = List<int>.generate(total, (i) => i + 1);

    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 1.0, vertical: 2.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: map<Widget>(items, (index, url) {
            return Container(
              width: current == index ? 7.0 : 5.0,
              height: current == index ? 7.0 : 5.0,
              margin: EdgeInsets.only(
                  left: index == 0 ? 0 : 3.5,
                  right: index + 1 == total ? 0 : 3.5),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: current == index ? Colors.black : Colors.grey),
            );
          }),
        ));
  }

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }

    return result;
  }
}
