import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

enum Trajectory {
  time,
  distance,
  points,
  isVisible,
  drawNew,
}

class TrajectoryNotifier extends Notifier<Map<Trajectory, Object>> {
  @override
  Map<Trajectory, Object> build() => {
        Trajectory.time: 0,
        Trajectory.distance: 0.0,
        Trajectory.points: <Offset>[],
        Trajectory.isVisible: false,
        Trajectory.drawNew: false,
      };

  void setTime(int value) {
    state = {
      ...state,
      Trajectory.time: value,
    };
  }

  void setDistance(double value) {
    state = {
      ...state,
      Trajectory.distance: value,
    };
  }

  void setPoints(List<Offset> value) {
    state = {
      ...state,
      Trajectory.points: value,
    };
  }

  void clearPoints() {
    state = {
      ...state,
      Trajectory.points: <Offset>[],
    };
  }

  void setVisibility(bool value) {
    state = {
      ...state,
      Trajectory.isVisible: value,
    };
  }

  void setDrawNew(bool value) {
    state = {
      ...state,
      Trajectory.drawNew: value,
    };
  }
}

final trajectoryProvider =
    NotifierProvider<TrajectoryNotifier, Map<Trajectory, Object>>(
        TrajectoryNotifier.new);
