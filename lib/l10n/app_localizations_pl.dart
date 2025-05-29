// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Polish (`pl`).
class AppLocalizationsPl extends AppLocalizations {
  AppLocalizationsPl([String locale = 'pl']) : super(locale);

  @override
  String get settings => 'Ustawienia';

  @override
  String get pointsQuantity => 'Liczba punktów';

  @override
  String get pointsColor => 'Kolor punktów';

  @override
  String get pathColor => 'Kolor trasy';

  @override
  String get startPointColor => 'Kolor punktu startowego';

  @override
  String get endPointColor => 'Kolor punktu końcowego';

  @override
  String get pointsVisibility => 'Widoczność punktów';

  @override
  String get findWay => 'Znajdź trasę';

  @override
  String get trajectory => 'Trasa';

  @override
  String get noTrajectory => 'Trasa nie została jeszcze znaleziona';

  @override
  String trajectoryTime(int time) {
    return 'Trasa znaleziona w czasie ${time}ms';
  }

  @override
  String trajectoryLength(String length) {
    return 'Długosć trasy wynosi ${length}px';
  }
}
