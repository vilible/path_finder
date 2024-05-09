import "dart:io";

import "package:bitsdojo_window/bitsdojo_window.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";

import "package:way_finder/providers/app_settings.dart";
import "package:way_finder/screens/android_screen.dart";
import "package:way_finder/screens/windows_screen.dart";

final kLightScheme = ColorScheme.fromSeed(
  seedColor: Colors.teal.shade900,
  brightness: Brightness.light,
);

final kDarkScheme = ColorScheme.fromSeed(
  seedColor: Colors.teal.shade900,
  brightness: Brightness.dark,
);

void main() {
  runApp(const App());

  if (Platform.isWindows) {
    doWhenWindowReady(() {
      appWindow.minSize = const Size(1100, 600);
      appWindow.alignment = Alignment.center;
      appWindow.show();
    });
  }
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppSettings(),
      child: Platform.isWindows
          ? WindowsScreen(
              lightScheme: kLightScheme,
              darkScheme: kDarkScheme,
            )
          : AndroidScreen(
              fallbackLight: kLightScheme,
              fallbackDark: kDarkScheme,
            ),
    );
  }
}
