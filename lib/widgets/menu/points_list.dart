import 'package:flutter/material.dart';

class PointsList extends StatelessWidget {
  const PointsList({
    super.key,
    required this.points,
  });

  final List<Offset> points;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListView.builder(
      shrinkWrap: true,
      itemCount: points.length,
      itemBuilder: (context, index) {
        final point = points[index];

        return Card(
          shadowColor: theme.colorScheme.primary,
          color: theme.colorScheme.onSecondary,
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Text(
              "(${point.dx.toStringAsFixed(2)}; ${point.dy.toStringAsFixed(2)})",
            ),
          ),
        );
      },
    );
  }
}
