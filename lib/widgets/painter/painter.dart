import "dart:io";

import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

import "package:way_finder/providers/settings_provider.dart";
import "package:way_finder/providers/trajectory_provider.dart";
import "package:way_finder/widgets/bars/windows_bar.dart";
import "package:way_finder/widgets/painter/graph_painter.dart";
import "package:way_finder/widgets/painter/path_painter.dart";

class Painter extends ConsumerWidget {
  Painter({super.key});

  final points = <Offset>[];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingsProvider);
    final trajectory = ref.watch(trajectoryProvider);

    return Expanded(
      child: Column(
        children: [
          if (Platform.isWindows) const WindowsBar(buttonsEnabled: true),
          Expanded(
            child: RepaintBoundary(
              child: CustomPaint(
                size: const Size(double.infinity, double.infinity),
                foregroundPainter: PathPainter(
                  ref: ref,
                  points: points,
                  trajectory: trajectory[Trajectory.points],
                  pathColor: settings[Settings.pathColor],
                  startColor: settings[Settings.startColor],
                  endColor: settings[Settings.endColor],
                  isVisible: trajectory[Trajectory.isVisible],
                  drawNew: trajectory[Trajectory.drawNew],
                ),
                painter: GraphPainter(
                  ref: ref,
                  points: points,
                  pointsQuantity: settings[Settings.pointsQuantity],
                  pointsColor: settings[Settings.pointsColor],
                  opacity: settings[Settings.opacity],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
