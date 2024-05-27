import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

enum Settings {
  pointsQuantity,
  pointsColor,
  pathColor,
  startColor,
  endColor,
  opacity,
}

class SettingsNotifier extends Notifier<Map<Settings, Object>> {
  @override
  Map<Settings, Object> build() => {
        Settings.pointsQuantity: 0,
        Settings.pointsColor: Colors.white,
        Settings.pathColor: Colors.blue,
        Settings.startColor: Colors.green,
        Settings.endColor: Colors.red,
        Settings.opacity: 1.0,
      };

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
    }
  }

  void setPathColor(Color value) {
    if (value != state[Settings.pathColor]) {
      state = {
        ...state,
        Settings.pathColor: value,
      };
    }
  }

  void setStartColor(Color value) {
    if (value != state[Settings.startColor]) {
      state = {
        ...state,
        Settings.startColor: value,
      };
    }
  }

  void setEndColor(Color value) {
    if (value != state[Settings.endColor]) {
      state = {
        ...state,
        Settings.endColor: value,
      };
    }
  }

  void setOpacity(double value) {
    if (value != state[Settings.opacity]) {
      state = {
        ...state,
        Settings.opacity: value,
      };
    }
  }
}

final settingsProvider =
    NotifierProvider<SettingsNotifier, Map<Settings, Object>>(
        SettingsNotifier.new);
