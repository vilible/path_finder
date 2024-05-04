import 'package:flutter/material.dart';

class AppProvider extends ChangeNotifier {
  // SETTINGS
  int _pointsQuantity = 0;
  double _opacity = 1;
  Color _pointsColor = Colors.white;
  Color _pathColor = Colors.blue;
  Color _startColor = Colors.green;
  Color _endColor = Colors.red;

  // PATH
  int _trajectoryTime = 0;
  double _trajectoryDistance = 0;
  final _trajectoryPoints = <Offset>[];
  final isPathVisible = ValueNotifier<bool>(false);
  final newPathNotifier = ValueNotifier<bool>(false);

  int get pointsQuantity => _pointsQuantity;
  set pointsQuantity(int value) {
    if (value != _pointsQuantity) {
      _pointsQuantity = value;
      notifyListeners();
    }
  }

  double get opacity => _opacity;
  set opacity(double value) {
    _opacity = value;
    notifyListeners();
  }

  Color get pointsColor => _pointsColor;
  set pointsColor(Color value) {
    _pointsColor = value;
    notifyListeners();
  }

  Color get pathColor => _pathColor;
  set pathColor(Color value) {
    _pathColor = value;
    notifyListeners();
  }

  Color get startColor => _startColor;
  set startColor(Color value) {
    _startColor = value;
    notifyListeners();
  }

  Color get endColor => _endColor;
  set endColor(Color value) {
    _endColor = value;
    notifyListeners();
  }

  bool get isTrajectoryEmpty => _trajectoryPoints.isEmpty;
  List<Offset> get trajectory => List.unmodifiable(_trajectoryPoints);

  double get trajectoryDistance => _trajectoryDistance;
  void setTrajectoryDistance(double value) {
    _trajectoryDistance = value;
    notifyListeners();
  }

  int get trajectoryTime => _trajectoryTime;
  void setTrajctoryTime(int value) {
    _trajectoryTime = value;
    notifyListeners();
  }

  void setTrajectory(List<Offset> points) {
    _trajectoryPoints.clear();
    _trajectoryPoints.addAll(points);
    notifyListeners();
  }

  void clearTrajectory() {
    _trajectoryPoints.clear();
    notifyListeners();
  }
}
