import 'package:flutter/material.dart';

class AppProvider extends ChangeNotifier {
  // SETTINGS
  int _pointsQuantity = 0;
  int _opacity = 255;
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

  set pointsQuantity(int value) {
    if (value != _pointsQuantity) {
      _pointsQuantity = value;
      notifyListeners();
    }
  }

  set opacity(int value) {
    _opacity = value;
    notifyListeners();
  }

  set pointsColor(Color value) {
    _pointsColor = value;
    notifyListeners();
  }

  set pathColor(Color value) {
    _pathColor = value;
    notifyListeners();
  }

  set startColor(Color value) {
    _startColor = value;
    notifyListeners();
  }

  set endColor(Color value) {
    _endColor = value;
    notifyListeners();
  }

  int get pointsQuantity => _pointsQuantity;
  int get opacity => _opacity;
  bool get isTrajectoryEmpty => _trajectoryPoints.isEmpty;
  int get trajectoryTime => _trajectoryTime;
  double get trajectoryDistance => _trajectoryDistance;
  Color get pointsColor => _pointsColor;
  Color get pathColor => _pathColor;
  Color get startColor => _startColor;
  Color get endColor => _endColor;
  List<Offset> get trajectory => List.unmodifiable(_trajectoryPoints);

  void setTrajectoryDistance(double value) {
    _trajectoryDistance = value;
    notifyListeners();
  }

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
