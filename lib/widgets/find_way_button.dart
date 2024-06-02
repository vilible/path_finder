import 'dart:io';

import 'package:flutter/material.dart';
import "package:flutter_gen/gen_l10n/app_localizations.dart";
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:way_finder/providers/settings_provider.dart';
import 'package:way_finder/providers/trajectory_provider.dart';
import 'package:way_finder/utils.dart';
import 'package:way_finder/widgets/menu/tabs/settings.dart';

class FindWayButton extends ConsumerWidget {
  const FindWayButton({
    super.key,
    this.enabled = true,
  });

  final bool enabled;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final button = SizedBox(
      width: double.infinity,
      child: FilledButton.icon(
        icon: const Icon(Icons.search_rounded),
        label: Text(AppLocalizations.of(context)!.findWay),
        onPressed: enabled
            ? () {
                final pointsQuantity =
                    ref.read(settingsProvider)[Settings.pointsQuantity] as int;
                final trajectory = ref.read(trajectoryProvider.notifier);

                if (Platform.isAndroid && pointsQuantity < 3) {
                  showModal(context, const SettingsTab());
                  return;
                }

                trajectory.setDrawNew(true);
                trajectory.setVisibility(true);
              }
            : null,
      ),
    );

    if (Platform.isAndroid) {
      return Padding(
        padding: const EdgeInsets.all(5),
        child: button,
      );
    }

    return button;
  }
}
