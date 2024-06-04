import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:shared_preferences/shared_preferences.dart";

enum Settings {
  pointsQuantity,
  pointsColor,
  pathColor,
  startColor,
  endColor,
  opacity,
}

class SettingsNotifier extends Notifier<Map<Settings, dynamic>> {
  late final SharedPreferences _prefs;
  static const defaults = <Settings, dynamic>{
    Settings.pointsQuantity: 0,
    Settings.pointsColor: Colors.white,
    Settings.pathColor: Colors.blue,
    Settings.startColor: Colors.green,
    Settings.endColor: Colors.red,
    Settings.opacity: 1.0,
  };

  @override
  Map<Settings, dynamic> build() {
    _loadData();
    return {...defaults};
  }

  Future _loadData() {
    return Future(() async {
      _prefs = await SharedPreferences.getInstance();

      final pointsColor = Color(_prefs.getInt("pointsColor") ??
          defaults[Settings.pointsColor]!.value);
      final pathColor = Color(
          _prefs.getInt("pathColor") ?? defaults[Settings.pathColor]!.value);
      final startColor = Color(
          _prefs.getInt("startColor") ?? defaults[Settings.startColor]!.value);
      final endColor = Color(
          _prefs.getInt("endColor") ?? defaults[Settings.endColor]!.value);
      final opacity = _prefs.getDouble("opacity") ?? defaults[Settings.opacity];

      state = {
        ...state,
        Settings.pointsColor: pointsColor,
        Settings.pathColor: pathColor,
        Settings.startColor: startColor,
        Settings.endColor: endColor,
        Settings.opacity: opacity,
      };
    });
  }

  void setPointsQuantity(int value) {
    if (value != state[Settings.pointsQuantity]) {
      state = {
        ...state,
        Settings.pointsQuantity: value,
      };
    }
  }

  void setPointsColor(Color value) {
    if (value != state[Settings.pointsColor]) {
      state = {
        ...state,
        Settings.pointsColor: value,
      };

      _prefs.setInt("pointsColor", state[Settings.pointsColor]!.value);
    }
  }

  void setPathColor(Color value) {
    if (value != state[Settings.pathColor]) {
      state = {
        ...state,
        Settings.pathColor: value,
      };

      _prefs.setInt("pathColor", state[Settings.pathColor]!.value);
    }
  }

  void setStartColor(Color value) {
    if (value != state[Settings.startColor]) {
      state = {
        ...state,
        Settings.startColor: value,
      };

      _prefs.setInt("startColor", state[Settings.startColor]!.value);
    }
  }

  void setEndColor(Color value) {
    if (value != state[Settings.endColor]) {
      state = {
        ...state,
        Settings.endColor: value,
      };

      _prefs.setInt("endColor", state[Settings.endColor]!.value);
    }
  }

  void setOpacity(double value) {
    if (value != state[Settings.opacity]) {
      state = {
        ...state,
        Settings.opacity: value,
      };

      _prefs.setDouble("opacity", state[Settings.opacity]);
    }
  }
}

final settingsProvider =
    NotifierProvider<SettingsNotifier, Map<Settings, dynamic>>(
        SettingsNotifier.new);
