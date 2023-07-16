import 'package:flutter/services.dart';
import 'package:vibration/vibration.dart';

class EffectManager {
  factory EffectManager() {
    return instance;
  }
  EffectManager._();
  static EffectManager instance = EffectManager._();

  static Future<void> onCount() async {
    await onCountVibration();
  }

  static Future<void> onSingleDone() async {
    await onSingleDoneVibration();
  }

  static Future<void> onAllDone() async {
    await onSingleDoneVibration();
  }

  ///**********************
  /// Sound
  ///**********************
  static Future<void> onCountSound() async {}

  static Future<void> onSingleDoneSound() async {}

  static Future<void> onAllDoneSound() async {}

  ///**********************
  /// Vibration
  ///**********************

  static Future<void> onCountVibration() async {
    await Vibration.hasCustomVibrationsSupport().then(
      (value) => {
        if (value!)
          {Vibration.vibrate(duration: 100)}
        else
          {HapticFeedback.lightImpact()}
      },
    );
  }

  static Future<void> onSingleDoneVibration() async {
    await Vibration.hasCustomVibrationsSupport().then(
      (value) => {
        if (value!)
          {Vibration.vibrate(duration: 300)}
        else
          {HapticFeedback.mediumImpact()}
      },
    );
  }

  static Future<void> onAllDoneVibration() async {
    await Vibration.hasCustomVibrationsSupport().then(
      (value) => {
        if (value!) {Vibration.vibrate()} else {HapticFeedback.heavyImpact()}
      },
    );
  }
}
