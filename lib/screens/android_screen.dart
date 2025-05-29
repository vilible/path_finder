import "package:dynamic_color/dynamic_color.dart";
import "package:flutter/material.dart";
import "package:way_finder/l10n/app_localizations.dart";

import "package:way_finder/widgets/bars/android_bar.dart";
import "package:way_finder/widgets/find_way_button.dart";
import "package:way_finder/widgets/painter/painter.dart";

class AndroidScreen extends StatelessWidget {
  const AndroidScreen({
    super.key,
    required this.fallbackLight,
    required this.fallbackDark,
  });

  final ColorScheme fallbackLight;
  final ColorScheme fallbackDark;

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
      builder: (lightDynamic, darkDynamic) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "WayFinder",
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          theme: ThemeData(
            colorScheme: lightDynamic?.harmonized() ?? fallbackLight,
          ),
          darkTheme: ThemeData(
            colorScheme: darkDynamic?.harmonized() ?? fallbackDark,
          ),
          home: Scaffold(
            appBar: const AndroidBar(),
            resizeToAvoidBottomInset: false,
            body: Column(
              children: [
                Painter(),
                const FindWayButton(),
              ],
            ),
          ),
        );
      },
    );
  }
}
