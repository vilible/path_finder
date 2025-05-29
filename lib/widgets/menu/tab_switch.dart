import "package:flutter/material.dart";
import "package:way_finder/l10n/app_localizations.dart";

class TabSwitch extends StatelessWidget {
  const TabSwitch({
    super.key,
    required this.onChange,
    required this.selectedTab,
  });

  final void Function(int) onChange;
  final int selectedTab;

  @override
  Widget build(BuildContext context) {
    return SegmentedButton(
      showSelectedIcon: false,
      selected: <int>{selectedTab},
      segments: <ButtonSegment>[
        ButtonSegment(
          value: 0,
          label: Text(AppLocalizations.of(context)!.settings),
          icon: const Icon(Icons.settings_outlined),
        ),
        ButtonSegment(
          value: 1,
          label: Text(AppLocalizations.of(context)!.trajectory),
          icon: const Icon(Icons.directions_outlined),
        ),
      ],
      onSelectionChanged: (newSelection) => onChange(newSelection.first),
    );
  }
}
