import "dart:io";

import "package:bitsdojo_window/bitsdojo_window.dart";
import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:google_fonts/google_fonts.dart";

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
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('google_fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });

  GoogleFonts.config.allowRuntimeFetching = false;

  runApp(const ProviderScope(child: App()));

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
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return Platform.isWindows
        ? WindowsScreen(
            lightScheme: kLightScheme,
            darkScheme: kDarkScheme,
          )
        : AndroidScreen(
            fallbackLight: kLightScheme,
            fallbackDark: kDarkScheme,
          );
  }
}
