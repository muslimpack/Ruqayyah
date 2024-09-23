import 'package:get_storage/get_storage.dart';

SettingsHelper settingsHelper = SettingsHelper();

class SettingsHelper {
  final box = GetStorage();

  ///********************
  /// Theme
  ///********************
  bool get isDark => box.read('isDark') ?? false;

  void changeIsDarkStatus({required bool value}) => box.write('isDark', value);

  ///********************
  /// Sounds
  ///********************

  bool get isOnCountSoundAllowed => box.read('on_count_sound') ?? false;

  void changeOnCountStatus({required bool value}) =>
      box.write('on_count_sound', value);

  bool get isSingleDoneSoundAllowed => box.read('single_done_sound') ?? false;

  void changeSingleDoneSoundStatus({required bool value}) =>
      box.write('single_done_sound', value);

  bool get isAllDoneSoundAllowed => box.read('all_done_sound') ?? false;

  void changeAllDoneSoundStatus({required bool value}) =>
      box.write('all_done_sound', value);

  ///********************
  /// Volume
  ///********************

  double get soundEffectVolume => box.read('soundEffectVolume') ?? 1;

  void changeSoundEffectVolume(double value) =>
      box.write('soundEffectVolume', value);

  ///********************
  /// Vibration
  ///********************

  bool get isOnCountVibrateAllowed => box.read('on_count_vibrate') ?? false;

  void changeOnCountVibrateStatus({required bool value}) =>
      box.write('on_count_vibrate', value);

  bool get isSingleDoneVibrateAllowed =>
      box.read('single_done_vibrate') ?? false;

  void changeSingleDoneVibrateStatus({required bool value}) =>
      box.write('single_done_vibrate', value);

  bool get isAllDoneVibrateAllowed => box.read('all_done_vibrate') ?? false;

  void changeAllDoneVibrateStatus({required bool value}) =>
      box.write('all_done_vibrate', value);
}
