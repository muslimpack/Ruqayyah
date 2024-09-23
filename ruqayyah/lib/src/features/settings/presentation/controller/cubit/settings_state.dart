part of 'settings_cubit.dart';

class SettingsState extends Equatable {
  final RukiaEffects zikrEffects;
  final bool enableWakeLock;
  final double fontSize;
  final bool showDiacritics;
  final bool praiseWithVolumeKeys;
  const SettingsState({
    required this.zikrEffects,
    required this.enableWakeLock,
    required this.fontSize,
    required this.showDiacritics,
    required this.praiseWithVolumeKeys,
  });

  @override
  List<Object> get props {
    return [
      zikrEffects,
      enableWakeLock,
      fontSize,
      showDiacritics,
      praiseWithVolumeKeys,
    ];
  }

  SettingsState copyWith({
    RukiaEffects? zikrEffects,
    bool? enableWakeLock,
    double? fontSize,
    bool? showDiacritics,
    bool? praiseWithVolumeKeys,
  }) {
    return SettingsState(
      zikrEffects: zikrEffects ?? this.zikrEffects,
      enableWakeLock: enableWakeLock ?? this.enableWakeLock,
      fontSize: fontSize ?? this.fontSize,
      showDiacritics: showDiacritics ?? this.showDiacritics,
      praiseWithVolumeKeys: praiseWithVolumeKeys ?? this.praiseWithVolumeKeys,
    );
  }
}
