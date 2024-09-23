import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/services.dart';
import 'package:ruqayyah/src/features/effects_manager/data/repository/effects_repo.dart';
import 'package:vibration/vibration.dart';

class EffectManager {
  factory EffectManager() {
    return instance;
  }
  EffectManager._();
  static EffectManager instance = EffectManager._();

  static Future<void> onCount() async {
    await onCountVibration();
    await onCountSound();
  }

  static Future<void> onSingleDone() async {
    await onSingleDoneVibration();
    await onSingleDoneSound();
  }

  static Future<void> onAllDone() async {
    await onAllDoneVibration();
    await onAllDoneSound();
  }

  ///**********************
  /// Sound
  ///**********************
  static final player = AudioPlayer();
  static Future<void> onCountSound() async {
    if (!effectsRepo.isOnCountSoundAllowed) return;
    await player.play(
      AssetSource('sounds/count.mp3'),
      volume: effectsRepo.soundEffectVolume,
    );
  }

  static Future<void> onSingleDoneSound() async {
    if (!effectsRepo.isSingleDoneSoundAllowed) return;
    await player.play(
      AssetSource('sounds/single_done.mp3'),
      volume: effectsRepo.soundEffectVolume,
    );
  }

  static Future<void> onAllDoneSound() async {
    if (!effectsRepo.isAllDoneSoundAllowed) return;
    await player.play(
      AssetSource('sounds/all_done.mp3'),
      volume: effectsRepo.soundEffectVolume,
    );
  }

  ///**********************
  /// Vibration
  ///**********************

  static Future<void> onCountVibration() async {
    if (!effectsRepo.isOnCountVibrateAllowed) return;
    await Vibration.hasCustomVibrationsSupport().then(
      (value) => {
        if (value!)
          {Vibration.vibrate(duration: 100)}
        else
          {HapticFeedback.lightImpact()},
      },
    );
  }

  static Future<void> onSingleDoneVibration() async {
    if (!effectsRepo.isSingleDoneVibrateAllowed) return;
    await Vibration.hasCustomVibrationsSupport().then(
      (value) => {
        if (value!)
          {Vibration.vibrate(duration: 300)}
        else
          {HapticFeedback.mediumImpact()},
      },
    );
  }

  static Future<void> onAllDoneVibration() async {
    if (!effectsRepo.isAllDoneVibrateAllowed) return;
    await Vibration.hasCustomVibrationsSupport().then(
      (value) => {
        if (value!) {Vibration.vibrate()} else {HapticFeedback.heavyImpact()},
      },
    );
  }
}
