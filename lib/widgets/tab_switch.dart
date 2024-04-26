import "package:flutter/material.dart";

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
      segments: const <ButtonSegment>[
        ButtonSegment(
          value: 0,
          label: Text("Ustawienia"),
          icon: Icon(Icons.settings_outlined),
        ),
        ButtonSegment(
          value: 1,
          label: Text("Trasa"),
          icon: Icon(Icons.directions_outlined),
        ),
      ],
      onSelectionChanged: (newSelection) => onChange(newSelection.first),
    );
  }
}
