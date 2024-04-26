import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import "package:way_finder/widgets/menu/menu.dart";
import "package:way_finder/widgets/painter/painter.dart";

class WayFinder extends StatelessWidget {
  const WayFinder({super.key});

  @override
  Widget build(BuildContext context) {
    return WindowBorder(
      width: 1,
      color: Theme.of(context).colorScheme.primary,
      child: Row(
        children: [
          const Menu(),
          Painter(),
        ],
      ),
    );
  }
}
