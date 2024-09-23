import 'package:get_storage/get_storage.dart';

class EffectsRepo {
  final GetStorage box;

  const EffectsRepo(this.box);

  ///********************
  /// Sounds
  ///********************

  bool get isOnCountSoundAllowed => box.read('on_count_sound') ?? false;

  Future changeOnCountStatus({required bool value}) =>
      box.write('on_count_sound', value);

  bool get isSingleDoneSoundAllowed => box.read('single_done_sound') ?? false;

  Future changeSingleDoneSoundStatus({required bool value}) =>
      box.write('single_done_sound', value);

  bool get isAllDoneSoundAllowed => box.read('all_done_sound') ?? false;

  Future changeAllDoneSoundStatus({required bool value}) =>
      box.write('all_done_sound', value);

  ///********************
  /// Volume
  ///********************

  double get soundEffectVolume => box.read('soundEffectVolume') ?? 1;

  Future changeSoundEffectVolume(double value) =>
      box.write('soundEffectVolume', value);

  ///********************
  /// Vibration
  ///********************

  bool get isOnCountVibrateAllowed => box.read('on_count_vibrate') ?? false;

  Future changeOnCountVibrateStatus({required bool value}) =>
      box.write('on_count_vibrate', value);

  bool get isSingleDoneVibrateAllowed =>
      box.read('single_done_vibrate') ?? false;

  Future changeSingleDoneVibrateStatus({required bool value}) =>
      box.write('single_done_vibrate', value);

  bool get isAllDoneVibrateAllowed => box.read('all_done_vibrate') ?? false;

  Future changeAllDoneVibrateStatus({required bool value}) =>
      box.write('all_done_vibrate', value);
}
