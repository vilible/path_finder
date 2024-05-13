import 'dart:io';

import 'package:flutter/material.dart';
import "package:flutter_gen/gen_l10n/app_localizations.dart";
import 'package:provider/provider.dart';
import 'package:way_finder/providers/app_settings.dart';
import 'package:way_finder/utils.dart';
import 'package:way_finder/widgets/menu/tabs/settings.dart';

class FindWayButton extends StatelessWidget {
  const FindWayButton({
    super.key,
    this.enabled = true,
  });

  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final global = context.watch<AppSettings>();
    final button = SizedBox(
      width: double.infinity,
      child: FilledButton.icon(
        icon: const Icon(Icons.search_rounded),
        label: Text(AppLocalizations.of(context)!.findWay),
        onPressed: enabled
            ? () {
                if (Platform.isAndroid && global.pointsQuantity < 3) {
                  showModal(context, const Settings());
                  return;
                }

                global.isPathVisible.value = true;
                global.newPathNotifier.value = true;
              }
            : null,
      ),
    );

    if (Platform.isWindows) {
      return button;
    }

    return Padding(
      padding: const EdgeInsets.all(5),
      child: button,
    );
  }
}
