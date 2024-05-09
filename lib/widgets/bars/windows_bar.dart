import "package:bitsdojo_window/bitsdojo_window.dart";
import "package:flutter/material.dart";

class WindowsBar extends StatelessWidget {
  const WindowsBar({
    super.key,
    required this.buttonsEnabled,
  });

  final bool buttonsEnabled;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final buttonsColors = WindowButtonColors(
      iconNormal: theme.colorScheme.onSurface,
      iconMouseOver: theme.colorScheme.secondary,
      iconMouseDown: theme.colorScheme.onSurface,
      mouseOver: theme.colorScheme.primaryContainer,
      mouseDown: theme.colorScheme.secondaryContainer,
    );

    final closeButtonColors = WindowButtonColors(
      iconNormal: theme.colorScheme.onSurface,
      iconMouseOver: theme.colorScheme.primary,
      iconMouseDown: theme.colorScheme.onSurface,
      mouseOver: theme.colorScheme.inversePrimary,
      mouseDown: theme.colorScheme.primaryContainer,
    );

    if (!buttonsEnabled) return WindowTitleBarBox(child: MoveWindow());

    return WindowTitleBarBox(
      child: Row(
        children: [
          Expanded(child: MoveWindow()),
          MinimizeWindowButton(
            animate: true,
            colors: buttonsColors,
          ),
          MaximizeWindowButton(
            animate: true,
            colors: buttonsColors,
          ),
          CloseWindowButton(
            animate: true,
            colors: closeButtonColors,
          ),
        ],
      ),
    );
  }
}
