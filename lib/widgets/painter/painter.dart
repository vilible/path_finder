import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:way_finder/app_provider.dart";
import "package:way_finder/widgets/painter/graph_painter.dart";
import "package:way_finder/widgets/painter/path_painter.dart";
import "package:way_finder/widgets/window_bar.dart";

class Painter extends StatelessWidget {
  Painter({super.key});

  final points = <Offset>[];

  @override
  Widget build(BuildContext context) {
    final global = context.watch<AppProvider>();

    WidgetsBinding.instance.addPostFrameCallback(
        (_) => global.pointsColor = Theme.of(context).colorScheme.onSurface);

    return Expanded(
      child: Column(
        children: <Widget>[
          const WindowBar(),
          Expanded(
            child: RepaintBoundary(
              child: CustomPaint(
                size: const Size(double.infinity, double.infinity),
                foregroundPainter: PathPainter(
                  points: points,
                  pathColor: global.pathColor,
                  startColor: global.startColor,
                  endColor: global.endColor,
                  isPathVisible: global.isPathVisible,
                  newPathNotifier: global.newPathNotifier,
                  functions: <String, Function>{
                    "setTrajectoryTime": global.setTrajctoryTime,
                    "setTrajectoryDistance": global.setTrajectoryDistance,
                    "setTrajectoryPoints": global.setTrajectory,
                    "getTrajectory": () => global.trajectory,
                  },
                ),
                painter: GraphPainter(
                  points: points,
                  pointsQuantity: global.pointsQuantity,
                  pointsColor: global.pointsColor,
                  opacity: global.opacity,
                  clearTrajectory: global.clearTrajectory,
                  pathVisibleNotifier: global.isPathVisible,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
