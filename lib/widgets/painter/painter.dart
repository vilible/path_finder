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
    final globalState = context.watch<AppProvider>();

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
                  pathColor: globalState.pathColor,
                  startColor: globalState.startColor,
                  endColor: globalState.endColor,
                  isPathVisible: globalState.isPathVisible,
                  newPathNotifier: globalState.newPathNotifier,
                  functions: <String, Function>{
                    "setTrajectoryTime": globalState.setTrajctoryTime,
                    "setTrajectoryDistance": globalState.setTrajectoryDistance,
                    "setTrajectoryPoints": globalState.setTrajectory,
                    "getTrajectory": () => globalState.trajectory,
                  },
                ),
                painter: GraphPainter(
                  points: points,
                  pointsQuantity: globalState.pointsQuantity,
                  pointsColor: Colors.white,
                  opacity: globalState.opacity,
                  clearTrajectory: globalState.clearTrajectory,
                  pathVisibleNotifier: globalState.isPathVisible,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
