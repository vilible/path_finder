import "dart:io";

import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:flutter_gen/gen_l10n/app_localizations.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

import "package:way_finder/providers/settings_provider.dart";
import "package:way_finder/widgets/find_way_button.dart";

class SettingsTab extends ConsumerStatefulWidget {
  const SettingsTab({super.key});

  @override
  ConsumerState<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends ConsumerState<SettingsTab> {
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    final pointsQuantity = ref.read(settingsProvider)[Settings.pointsQuantity];

    // If the points amount is 0, there's no need to display it in the text field.
    _controller.text = pointsQuantity == 0 ? "" : pointsQuantity.toString();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final settings = ref.watch(settingsProvider);
    // The button should be enabled only if the points amount is enough (greater or equal to 3).
    final enabledButton = (settings[Settings.pointsQuantity] as int) >= 3;

    return Column(
      children: <Widget>[
        TextField(
          controller: _controller,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          keyboardType: TextInputType.number,
          cursorOpacityAnimates: true,
          decoration: InputDecoration(
            label: Text(AppLocalizations.of(context)!.pointsQuantity),
            border: const OutlineInputBorder(),
          ),
          onChanged: (value) {
            if (value.isNotEmpty) {
              ref
                  .read(settingsProvider.notifier)
                  .setPointsQuantity(int.parse(value));
            }
          },
        ),
        const SizedBox(height: 16),
        Text(
          AppLocalizations.of(context)!.pointsVisibility,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Slider(
          min: 0.25,
          max: 1.0,
          value: settings[Settings.opacity] as double,
          onChanged: (value) =>
              ref.read(settingsProvider.notifier).setOpacity(value),
        ),
        const Spacer(),
        if (Platform.isWindows) FindWayButton(enabled: enabledButton),
      ],
    );
  }
}
