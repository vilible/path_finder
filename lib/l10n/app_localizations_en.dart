// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get settings => 'Settings';

  @override
  String get pointsQuantity => 'Points quantity';

  @override
  String get pointsColor => 'Points color';

  @override
  String get pathColor => 'Path color';

  @override
  String get startPointColor => 'Start point color';

  @override
  String get endPointColor => 'End point color';

  @override
  String get pointsVisibility => 'Points visibility';

  @override
  String get findWay => 'Find way';

  @override
  String get trajectory => 'Trajectory';

  @override
  String get noTrajectory => 'Trajectory has not been determined yet';

  @override
  String trajectoryTime(int time) {
    return 'Trajectory found in ${time}ms';
  }

  @override
  String trajectoryLength(String length) {
    return 'Trajectory length is ${length}px';
  }
}
