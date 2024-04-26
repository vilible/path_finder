import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:way_finder/app_provider.dart";

class Trajectory extends StatelessWidget {
  const Trajectory({super.key});

  @override
  Widget build(BuildContext context) {
    final globalState = context.watch<AppProvider>();

    if (globalState.isTrajectoryEmpty) {
      return Text(
        "Trasa nie została jeszcze wyznaczona.",
        style: Theme.of(context).textTheme.titleMedium,
      );
    } else {
      return Column(
        children: <Widget>[
          Text(
            "Trasa znaleziona w czasie ${globalState.trajectoryTime}ms",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Text(
            "Długość trasy wynosi ${globalState.trajectoryDistance.toStringAsFixed(2)}px",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: globalState.trajectory.length,
              itemBuilder: (context, index) {
                final point = globalState.trajectory[index];

                //TODO: Style or replace with something more good-looking :)
                return Card(
                  shadowColor: Theme.of(context).colorScheme.primary,
                  child: Padding(
                    padding: const EdgeInsets.all(18),
                    child: Text(
                      "(${point.dx.toStringAsFixed(2)}; ${point.dy.toStringAsFixed(2)})",
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      );
    }
  }
}
