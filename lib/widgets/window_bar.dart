import "package:bitsdojo_window/bitsdojo_window.dart";
import "package:flutter/material.dart";

class WindowBar extends StatelessWidget {
  const WindowBar({super.key});

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
