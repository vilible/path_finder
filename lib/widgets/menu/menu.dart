import "package:bitsdojo_window/bitsdojo_window.dart";
import 'package:flutter/material.dart';
import "package:way_finder/widgets/menu/settings.dart";
import "package:way_finder/widgets/menu/trajectory.dart";
import "package:way_finder/widgets/tab_switch.dart";

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  Widget _page = const Settings();
  int _selectedTab = 0;

  void _changePage(int index) {
    setState(() {
      _selectedTab = index;
      _page = switch (index) {
        0 => const Settings(),
        1 => const Trajectory(),
        _ => throw Exception("Nieznany indeks: $index"),
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 325,
      color: Theme.of(context).colorScheme.primaryContainer,
      child: Column(
        children: <Widget>[
          WindowTitleBarBox(child: MoveWindow()),
          TabSwitch(selectedTab: _selectedTab, onChange: _changePage),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: _page,
            ),
          ),
        ],
      ),
    );
  }
}
