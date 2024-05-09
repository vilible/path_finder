import "package:bitsdojo_window/bitsdojo_window.dart";
import "package:flutter/material.dart";
import "package:flutter_gen/gen_l10n/app_localizations.dart";

import "package:way_finder/widgets/menu/menu.dart";
import "package:way_finder/widgets/painter/painter.dart";

class WindowsScreen extends StatelessWidget {
  const WindowsScreen({
    super.key,
    required this.lightScheme,
    required this.darkScheme,
  });

  final ColorScheme darkScheme;
  final ColorScheme lightScheme;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      darkTheme: ThemeData(colorScheme: darkScheme),
      theme: ThemeData(colorScheme: lightScheme),
      home: WindowBorder(
        width: 1,
        color: Theme.of(context).colorScheme.primaryContainer,
        child: Scaffold(
          body: Row(
            children: [
              const Menu(),
              Painter(),
            ],
          ),
        ),
      ),
    );
  }
}
