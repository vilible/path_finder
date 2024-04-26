import "dart:math";

import "package:flutter/material.dart";

class PathPainter extends CustomPainter {
  PathPainter({
    required this.points,
    required this.pathColor,
    required this.startColor,
    required this.endColor,
    required this.newPathNotifier,
    required this.isPathVisible,
    required this.functions,
  }) : super(repaint: newPathNotifier);

  final ValueNotifier<bool> isPathVisible;
  final ValueNotifier<bool> newPathNotifier;

  final Color pathColor;
  final Color startColor;
  final Color endColor;
  final List<Offset> points;
  final Map<String, Function> functions;

  final Random rand = Random();

  @override
  void paint(Canvas canvas, Size size) {
    if (!isPathVisible.value) return;

    final pathPaint = Paint()
      ..color = pathColor
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 1.8;

    final startPaint = Paint()
      ..color = startColor
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 2;

    final endPaint = Paint()
      ..color = endColor
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 2;

    Offset start, end;

    if (newPathNotifier.value) {
      do {
        start = points[rand.nextInt(points.length)];
        end = points[rand.nextInt(points.length)];
      } while (start == end);

      double distance = 0;
      final path = <Offset>[start];
      final stopWatch = Stopwatch()..start();

      do {
        final (closest, closestDistance) = _getClosestPoint(start, end);
        if (closest == null) break;

        canvas.drawLine(path.last, closest, pathPaint);

        distance += closestDistance;
        path.add(closest);
        start = closest;
      } while (start != end);

      final duration = stopWatch.elapsedMilliseconds;

      WidgetsBinding.instance.addPostFrameCallback((_) {
        functions["setTrajectoryTime"]!(duration);
        functions["setTrajectoryDistance"]!(distance);
        functions["setTrajectoryPoints"]!(path);
      });
    } else {
      final List<Offset> path = functions["getTrajectory"]!();

      start = path.first;
      end = path.last;

      for (int i = 0; i < path.length - 1; i++) {
        canvas.drawLine(path[i], path[i + 1], pathPaint);
      }
    }

    canvas.drawCircle(start, 4, startPaint);
    canvas.drawCircle(end, 4, endPaint);

    WidgetsBinding.instance
        .addPostFrameCallback((_) => newPathNotifier.value = false);
  }

  @override
  bool shouldRepaint(PathPainter oldDelegate) {
    return isPathVisible.value || newPathNotifier.value;
  }

  /// Get the CLOSEST point to the CURRENT point that does not move away from the END point.
  (Offset?, double) _getClosestPoint(Offset current, Offset end) {
    var closestDst = double.infinity;
    Offset? closest;

    final currentEndDst = (end - current).distanceSquared;

    for (final point in points) {
      final pointEndDst = (end - point).distanceSquared;
      final pointCurrentDst = (current - point).distanceSquared;

      if (point == current || pointEndDst >= currentEndDst) continue;

      if (pointCurrentDst < closestDst) {
        closestDst = pointCurrentDst;
        closest = point;
      }
    }

    return (closest, sqrt(closestDst));
  }
}
