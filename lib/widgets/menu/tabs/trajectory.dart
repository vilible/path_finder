import "dart:io";

import "package:flutter/material.dart";
import "package:flutter_gen/gen_l10n/app_localizations.dart";
import "package:provider/provider.dart";
import "package:way_finder/providers/app_settings.dart";

class Trajectory extends StatelessWidget {
  const Trajectory({super.key});

  @override
  Widget build(BuildContext context) {
    final global = context.watch<AppSettings>();
    final theme = Theme.of(context);

    if (global.isTrajectoryEmpty) {
      final trajectoryInfo = Text(
        AppLocalizations.of(context)!.noTrajectory,
        style: theme.textTheme.titleMedium,
      );

      if (Platform.isAndroid) return Center(child: trajectoryInfo);

      return trajectoryInfo;
    } else {
      return Column(
        children: <Widget>[
          Text(
            AppLocalizations.of(context)!.trajectoryTime(global.trajectoryTime),
            style: theme.textTheme.titleMedium,
          ),
          Text(
            AppLocalizations.of(context)!
                .trajectoryLength(global.trajectoryDistance.toStringAsFixed(2)),
            style: theme.textTheme.titleMedium,
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: global.trajectory.length,
              itemBuilder: (context, index) {
                final point = global.trajectory[index];

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
            ),
          ),
        ],
      );
    }
  }
}
