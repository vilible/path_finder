import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:way_finder/providers/trajectory_provider.dart';

class GraphPainter extends CustomPainter {
  GraphPainter({
    required this.ref,
    required this.points,
    required this.pointsQuantity,
    required this.opacity,
    required this.pointsColor,
  });

  final WidgetRef ref;
  final List<Offset> points;
  final int pointsQuantity;
  final double opacity;
  final Color pointsColor;

  final Random rand = Random();

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = pointsColor.withOpacity(opacity)
      ..strokeWidth = 2.5
      ..strokeCap = StrokeCap.round;

    if (points.isEmpty) {
      for (var i = 0; i < pointsQuantity; i++) {
        points.add(Offset(
          rand.nextDouble() * size.width,
          rand.nextDouble() * size.height,
        ));
      }
    }

    canvas.drawPoints(PointMode.points, points, paint);
  }

  @override
  bool shouldRepaint(GraphPainter oldDelegate) {
    bool isDifferentAmount = oldDelegate.pointsQuantity != pointsQuantity;
    bool isDifferentOpacity = oldDelegate.opacity != opacity;
    bool isDifferentColor = oldDelegate.pointsColor != pointsColor;

    if (isDifferentAmount) {
      points.clear();

      WidgetsBinding.instance.addPostFrameCallback((_) {
        final trajectory = ref.read(trajectoryProvider.notifier);
        trajectory.clearPoints();
        trajectory.setVisibility(false);
      });
    }

    return isDifferentAmount || isDifferentOpacity || isDifferentColor;
  }
}
