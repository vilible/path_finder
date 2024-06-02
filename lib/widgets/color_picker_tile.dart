import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';

class ColorPickerTile extends StatelessWidget {
  const ColorPickerTile({
    super.key,
    required this.title,
    required this.currentColor,
    required this.onColorChanged,
  });

  final String title;
  final Color currentColor;
  final void Function(Color) onColorChanged;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 10),
      title: Text(title),
      trailing: ColorIndicator(
        width: 35,
        height: 35,
        borderRadius: 6,
        color: currentColor,
        onSelectFocus: false,
        onSelect: () async => onColorChanged(await colorPickerDialog(context)),
      ),
    );
  }

  Future<Color> colorPickerDialog(BuildContext context) async {
    return showColorPickerDialog(
      context,
      currentColor,
      width: 35,
      height: 35,
      padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
      actionsPadding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
      backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
      columnSpacing: 14,
      wheelWidth: 12,
      enableShadesSelection: false,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      heading: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge,
      ),
      pickersEnabled: const {
        ColorPickerType.primary: false,
        ColorPickerType.accent: false,
        ColorPickerType.wheel: true,
      },
    );
  }
}
