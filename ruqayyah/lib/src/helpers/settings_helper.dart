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

  bool get isTallySoundAllowed => box.read('tally_sound') ?? false;

  void changeTallySoundStatus({required bool value}) =>
      box.write('tally_sound', value);

  bool get isZikrDoneSoundAllowed => box.read('zikr_done_sound') ?? false;

  void changeZikrDoneSoundStatus({required bool value}) =>
      box.write('zikr_done_sound', value);

  bool get isAllAzkarFinishedSoundAllowed =>
      box.read('all_azkar_finished_sound') ?? false;

  void changeAllAzkarFinishedSoundStatus({required bool value}) =>
      box.write('all_azkar_finished_sound', value);

  ///********************
  /// Vibration
  ///********************

  double get soundEffectVolume => box.read('soundEffectVolume') ?? 1;

  void changeSoundEffectVolume(double value) =>
      box.write('soundEffectVolume', value);

  bool get isTallyVibrateAllowed => box.read('tally_vibrate') ?? false;

  void changeTallyVibrateStatus({required bool value}) =>
      box.write('tally_vibrate', value);

  bool get isZikrDoneVibrateAllowed => box.read('zikr_done_vibrate') ?? false;

  void changeZikrDoneVibrateStatus({required bool value}) =>
      box.write('zikr_done_vibrate', value);

  bool get isAllAzkarFinishedVibrateAllowed =>
      box.read('all_azkar_finished_vibrate') ?? false;

  void changeAllAzkarFinishedVibrateStatus({required bool value}) =>
      box.write('all_azkar_finished_vibrate', value);
}
