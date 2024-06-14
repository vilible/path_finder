import 'package:flutter/material.dart';
import "package:way_finder/widgets/bars/windows_bar.dart";

import "package:way_finder/widgets/menu/tab_switch.dart";
import "package:way_finder/widgets/menu/tabs/settings.dart";
import "package:way_finder/widgets/menu/tabs/trajectory.dart";

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  late PageController _controller;
  int _selectedTab = 0;

  @override
  void initState() {
    _controller = PageController(initialPage: _selectedTab);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _changePage(int index) {
    setState(() {
      _selectedTab = index;
      _controller.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOutSine,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 325,
      color: Theme.of(context).colorScheme.primaryContainer,
      child: Column(
        children: <Widget>[
          const WindowsBar(buttonsEnabled: false),
          TabSwitch(selectedTab: _selectedTab, onChange: _changePage),
          Expanded(
            child: PageView(
              controller: _controller,
              children: const <Widget>[
                Padding(
                  padding: EdgeInsets.all(15),
                  child: SettingsTab(),
                ),
                Padding(
                  padding: EdgeInsets.all(15),
                  child: TrajectoryTab(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// switchInCurve: Curves.easeOutSine,
// switchOutCurve: Curves.easeOutSine,