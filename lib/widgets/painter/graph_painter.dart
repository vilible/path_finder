import 'dart:math';
import 'package:flutter/material.dart';

class GraphPainter extends CustomPainter {
  GraphPainter({
    required this.pointsQuantity,
    required this.opacity,
    required this.pointsColor,
    required this.points,
    required this.pathVisibleNotifier,
    required this.clearTrajectory,
  });

  final int pointsQuantity;
  final int opacity;
  final Color pointsColor;
  final List<Offset> points;
  final void Function() clearTrajectory;
  final ValueNotifier<bool> pathVisibleNotifier;

  final Random rand = Random();

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Color.fromARGB(
        opacity,
        pointsColor.red,
        pointsColor.blue,
        pointsColor.green,
      )
      ..strokeCap = StrokeCap.round;

    if (points.isEmpty) {
      for (var i = 0; i < pointsQuantity; i++) {
        final center = Offset(
          rand.nextDouble() * size.width,
          rand.nextDouble() * size.height,
        );

        points.add(center);
        canvas.drawCircle(center, 1.5, paint);
      }
    } else {
      for (final point in points) {
        canvas.drawCircle(point, 1.5, paint);
      }
    }
  }

  @override
  bool shouldRepaint(GraphPainter oldDelegate) {
    bool isDifferentAmount = oldDelegate.pointsQuantity != pointsQuantity;
    bool isDifferentOpacity = oldDelegate.opacity != opacity;
    bool isDifferentColor = oldDelegate.pointsColor != pointsColor;

    if (isDifferentAmount) {
      pathVisibleNotifier.value = false;
      points.clear();
      WidgetsBinding.instance.addPostFrameCallback((_) => clearTrajectory());
    }

    return isDifferentAmount || isDifferentOpacity || isDifferentColor;
  }
}
