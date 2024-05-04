import "package:flutter/material.dart";
import "package:flutter_gen/gen_l10n/app_localizations.dart";
import "package:provider/provider.dart";
import "package:way_finder/app_provider.dart";

class Trajectory extends StatelessWidget {
  const Trajectory({super.key});

  @override
  Widget build(BuildContext context) {
    final global = context.watch<AppProvider>();

    if (global.isTrajectoryEmpty) {
      return Text(
        AppLocalizations.of(context)!.noTrajectory,
        style: Theme.of(context).textTheme.titleMedium,
      );
    } else {
      return Column(
        children: <Widget>[
          Text(
            AppLocalizations.of(context)!.trajectoryTime(global.trajectoryTime),
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Text(
            AppLocalizations.of(context)!
                .trajectoryLength(global.trajectoryDistance.toStringAsFixed(2)),
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: global.trajectory.length,
              itemBuilder: (context, index) {
                final point = global.trajectory[index];

                //TODO: Style or replace with something better looking :)
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
