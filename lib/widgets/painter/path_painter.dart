import "dart:math";
import "dart:ui";

import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:way_finder/providers/trajectory_provider.dart";

class PathPainter extends CustomPainter {
  PathPainter({
    required this.ref,
    required this.points,
    required this.trajectory,
    required this.pathColor,
    required this.startColor,
    required this.endColor,
    required this.isVisible,
    required this.drawNew,
  });

  final WidgetRef ref;
  final List<Offset> points;
  final List<Offset> trajectory;
  final Color pathColor;
  final Color startColor;
  final Color endColor;

  final bool isVisible;
  final bool drawNew;

  final Random rand = Random();

  @override
  void paint(Canvas canvas, Size size) {
    if (!isVisible) return;

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

    List<Offset> path = trajectory;
    Offset start, end;

    if (drawNew) {
      do {
        start = points[rand.nextInt(points.length)];
        end = points[rand.nextInt(points.length)];
      } while (start == end);

      double distance = 0;
      Offset current = start;
      path = <Offset>[start];

      final stopWatch = Stopwatch()..start();

      do {
        final (closest, closestDistance) = _getClosestPoint(current, end);
        if (closest == null) break;

        distance += closestDistance;
        path.add(closest);
        current = closest;
      } while (current != end);

      final duration = stopWatch.elapsedMilliseconds;

      WidgetsBinding.instance.addPostFrameCallback((_) {
        final provider = ref.read(trajectoryProvider.notifier);

        provider.setTime(duration);
        provider.setDistance(distance);
        provider.setPoints(path);
      });
    } else {
      start = path.first;
      end = path.last;
    }

    canvas.drawPoints(PointMode.polygon, path, pathPaint);
    canvas.drawCircle(start, 4, startPaint);
    canvas.drawCircle(end, 4, endPaint);

    WidgetsBinding.instance.addPostFrameCallback(
        (_) => ref.read(trajectoryProvider.notifier).setDrawNew(false));
  }

  @override
  bool shouldRepaint(PathPainter oldDelegate) {
    return drawNew || oldDelegate.isVisible != isVisible;
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
