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

  /// get Tally Sound mode
  bool get isTallySoundAllowed => box.read('tally_sound') ?? false;

  /// set Tally Sound mode
  void changeTallySoundStatus({required bool value}) =>
      box.write('tally_sound', value);

  /// get Tally Done Sound mode
  bool get isZikrDoneSoundAllowed => box.read('zikr_done_sound') ?? false;

  /// set Tally Done Sound mode
  void changeZikrDoneSoundStatus({required bool value}) =>
      box.write('zikr_done_sound', value);

  /// get Tally Transition Sound mode
  bool get isTransitionSoundAllowed =>
      box.read('tally_transition_sound') ?? false;

  /// set Tally  Transition Sound mode
  void changeTransitionSoundStatus({required bool value}) =>
      box.write('tally_transition_sound', value);

  /// get Tally Finished Sound mode
  bool get isAllAzkarFinishedSoundAllowed =>
      box.read('all_azkar_finished_sound') ?? false;

  /// set Tally Finished Sound mode
  void changeAllAzkarFinishedSoundStatus({required bool value}) =>
      box.write('all_azkar_finished_sound', value);

  ///********************
  /// Vibration
  ///********************

  /// get Sound Effect Volume
  double get soundEffectVolume => box.read('soundEffectVolume') ?? 1;

  /// set Tally Vibrate mode
  void changeSoundEffectVolume(double value) =>
      box.write('soundEffectVolume', value);

  /// get Tally Vibrate mode
  bool get isTallyVibrateAllowed => box.read('tally_vibrate') ?? false;

  /// set Tally Vibrate mode
  void changeTallyVibrateStatus({required bool value}) =>
      box.write('tally_vibrate', value);

  /// get Tally Done Vibrate mode
  bool get isZikrDoneVibrateAllowed => box.read('zikr_done_vibrate') ?? false;

  /// set Tally Done Vibrate mode
  void changeZikrDoneVibrateStatus({required bool value}) =>
      box.write('zikr_done_vibrate', value);

  /// get Tally Transition Vibrate mode
  bool get isTransitionVibrateAllowed =>
      box.read('tally_transition_vibrate') ?? false;

  /// set Tally  Transition Vibrate mode
  void changeTransitionVibrateStatus({required bool value}) =>
      box.write('tally_transition_vibrate', value);

  /// get Tally Finished Vibrate mode
  bool get isAllAzkarFinishedVibrateAllowed =>
      box.read('all_azkar_finished_vibrate') ?? false;

  /// set Tally Finished Vibrate mode
  void changeAllAzkarFinishedVibrateStatus({required bool value}) =>
      box.write('all_azkar_finished_vibrate', value);
}
