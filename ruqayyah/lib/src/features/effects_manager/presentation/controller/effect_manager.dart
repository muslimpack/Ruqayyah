import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/services.dart';
import 'package:ruqayyah/src/core/functions/app_print.dart';
import 'package:ruqayyah/src/features/effects_manager/data/repository/effects_repo.dart';
import 'package:vibration/vibration.dart';

class EffectsManager {
  final EffectsRepo _effectsRepo;

  EffectsManager(this._effectsRepo);

  Future<void> onCount() async {
    if (_effectsRepo.isOnCountVibrateAllowed) {
      await onCountVibration();
    }

    if (_effectsRepo.isOnCountSoundAllowed) {
      await onCountSound();
    }
  }

  Future<void> onSingleDone() async {
    if (_effectsRepo.isSingleDoneVibrateAllowed) {
      await onSingleDoneVibration();
    }

    if (_effectsRepo.isSingleDoneSoundAllowed) {
      await onSingleDoneSound();
    }
  }

  Future<void> onAllDone() async {
    if (_effectsRepo.isAllDoneVibrateAllowed) {
      await onAllDoneVibration();
    }
    if (_effectsRepo.isAllDoneSoundAllowed) {
      await onAllDoneSound();
    }
  }

  ///**********************
  /// Sound
  ///**********************
  final player = AudioPlayer();

  ///MARK: Play Sound

  Future _playSound(AssetSource source) async {
    try {
      await player.stop();
      await player.setSource(source);
      await player.setVolume(_effectsRepo.soundEffectVolume);
      await player.resume();
    } catch (e) {
      appPrint(e);
    }
  }

  Future<void> onCountSound() async {
    await _playSound(
      AssetSource('sounds/count.mp3'),
    );
  }

  Future<void> onSingleDoneSound() async {
    await _playSound(
      AssetSource('sounds/single_done.mp3'),
    );
  }

  Future<void> onAllDoneSound() async {
    await _playSound(
      AssetSource('sounds/all_done.mp3'),
    );
  }

  ///**********************
  /// Vibration
  ///**********************

  Future<void> onCountVibration() async {
    if (!_effectsRepo.isOnCountVibrateAllowed) return;
    await Vibration.hasCustomVibrationsSupport().then(
      (value) => {
        if (value) {Vibration.vibrate(duration: 100)} else {HapticFeedback.lightImpact()},
      },
    );
  }

  Future<void> onSingleDoneVibration() async {
    if (!_effectsRepo.isSingleDoneVibrateAllowed) return;
    await Vibration.hasCustomVibrationsSupport().then(
      (value) => {
        if (value) {Vibration.vibrate(duration: 300)} else {HapticFeedback.mediumImpact()},
      },
    );
  }

  Future<void> onAllDoneVibration() async {
    if (!_effectsRepo.isAllDoneVibrateAllowed) return;
    await Vibration.hasCustomVibrationsSupport().then(
      (value) => {
        if (value) {Vibration.vibrate()} else {HapticFeedback.heavyImpact()},
      },
    );
  }
}
