import "dart:io";

import "package:flutter/material.dart";
import "package:flutter_gen/gen_l10n/app_localizations.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

import "package:way_finder/providers/trajectory_provider.dart";
import "package:way_finder/widgets/menu/points_list.dart";

class TrajectoryTab extends ConsumerWidget {
  const TrajectoryTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final trajectory = ref.watch(trajectoryProvider);
    final points = trajectory[Trajectory.points] as List<Offset>;

    if (points.isEmpty) {
      final trajectoryInfo = Text(
        AppLocalizations.of(context)!.noTrajectory,
        style: theme.textTheme.titleMedium,
      );

      if (Platform.isAndroid) {
        return Center(child: trajectoryInfo);
      } else {
        return trajectoryInfo;
      }
    }

    return Column(
      children: <Widget>[
        Text(
          AppLocalizations.of(context)!.trajectoryTime(
            trajectory[Trajectory.time],
          ),
          style: theme.textTheme.titleMedium,
        ),
        Text(
          AppLocalizations.of(context)!.trajectoryLength(
            (trajectory[Trajectory.distance]).toStringAsFixed(2),
          ),
          style: theme.textTheme.titleMedium,
        ),
        const SizedBox(height: 16),
        Expanded(child: PointsList(points: points)),
      ],
    );
  }
}
