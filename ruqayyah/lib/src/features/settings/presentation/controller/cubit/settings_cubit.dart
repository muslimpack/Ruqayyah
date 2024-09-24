// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ruqayyah/src/core/constants/font_const.dart';
import 'package:ruqayyah/src/features/effects_manager/data/models/rukia_effects.dart';
import 'package:ruqayyah/src/features/effects_manager/data/repository/effects_repo.dart';
import 'package:ruqayyah/src/features/effects_manager/presentation/controller/effect_manager.dart';
import 'package:ruqayyah/src/features/settings/data/repository/app_settings_repo.dart';
import 'package:ruqayyah/src/features/settings/data/repository/rukia_text_repo.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  final EffectsManager effectsManager;
  final EffectsRepo effectsRepo;
  final AppSettingsRepo appSettingsRepo;
  final RukiaTextRepo rukiaTextRepo;
  SettingsCubit(
    this.effectsRepo,
    this.appSettingsRepo,
    this.effectsManager,
    this.rukiaTextRepo,
  ) : super(
          SettingsState(
            zikrEffects: RukiaEffects(
              soundEffectVolume: effectsRepo.soundEffectVolume,
              soundOnCount: effectsRepo.isOnCountSoundAllowed,
              soundEveryZikr: effectsRepo.isSingleDoneSoundAllowed,
              soundOnAllDone: effectsRepo.isAllDoneSoundAllowed,
              vibrateOnCount: effectsRepo.isOnCountVibrateAllowed,
              vibrateEveryZikr: effectsRepo.isSingleDoneVibrateAllowed,
              vibrateOnAllDone: effectsRepo.isAllDoneVibrateAllowed,
            ),
            enableWakeLock: appSettingsRepo.enableWakeLock,
            fontSize: rukiaTextRepo.fontSize,
            showDiacritics: rukiaTextRepo.showDiacritics,
            praiseWithVolumeKeys: appSettingsRepo.praiseWithVolumeKeys,
          ),
        );

  Future toggleWakeLock({required bool use}) async {
    await appSettingsRepo.changeEnableWakeLock(use: use);
    emit(state.copyWith(enableWakeLock: use));
  }

  ///MARK: praiseWithVolumeKeys
  Future togglePraiseWithVolumeKeys({required bool use}) async {
    await appSettingsRepo.changePraiseWithVolumeKeysStatus(value: use);
    emit(state.copyWith(praiseWithVolumeKeys: use));
  }

  ///MARK: Zikr Effects
  Future zikrEffectChangeVolume(double value) async {
    await effectsRepo.changeSoundEffectVolume(value);
    emit(
      state.copyWith(
        zikrEffects: state.zikrEffects.copyWith(soundEffectVolume: value),
      ),
    );
  }

  Future zikrEffectChangePlaySoundEveryPraise({required bool activate}) async {
    if (activate) {
      effectsManager.onCountSound();
    }
    await effectsRepo.changeOnCountStatus(value: activate);
    emit(
      state.copyWith(
        zikrEffects: state.zikrEffects.copyWith(soundOnCount: activate),
      ),
    );
  }

  Future zikrEffectChangePlaySoundEveryZikr({required bool activate}) async {
    if (activate) {
      effectsManager.onSingleDoneSound();
    }
    await effectsRepo.changeSingleDoneSoundStatus(value: activate);
    emit(
      state.copyWith(
        zikrEffects: state.zikrEffects.copyWith(soundEveryZikr: activate),
      ),
    );
  }

  Future zikrEffectChangePlaySoundEveryTitle({required bool activate}) async {
    if (activate) {
      effectsManager.onAllDoneSound();
    }
    await effectsRepo.changeAllDoneSoundStatus(value: activate);
    emit(
      state.copyWith(
        zikrEffects: state.zikrEffects.copyWith(soundOnAllDone: activate),
      ),
    );
  }

  /* Vibration */

  Future zikrEffectChangePlayVibrationEveryPraise({
    required bool activate,
  }) async {
    if (activate) {
      await effectsManager.onCountVibration();
    }
    await effectsRepo.changeOnCountVibrateStatus(value: activate);
    emit(
      state.copyWith(
        zikrEffects: state.zikrEffects.copyWith(vibrateOnCount: activate),
      ),
    );
  }

  Future zikrEffectChangePlayVibrationEveryZikr({
    required bool activate,
  }) async {
    if (activate) {
      await effectsManager.onSingleDoneVibration();
    }
    await effectsRepo.changeSingleDoneVibrateStatus(value: activate);
    emit(
      state.copyWith(
        zikrEffects: state.zikrEffects.copyWith(vibrateEveryZikr: activate),
      ),
    );
  }

  Future zikrEffectChangePlayVibrationEveryTitle({
    required bool activate,
  }) async {
    if (activate) {
      await effectsManager.onAllDoneVibration();
    }
    await effectsRepo.changeAllDoneVibrateStatus(value: activate);
    emit(
      state.copyWith(
        zikrEffects: state.zikrEffects.copyWith(vibrateOnAllDone: activate),
      ),
    );
  }

  ///MARK: Zikr Text

  Future<void> changFontSize(double value) async {
    final double tempValue = value.clamp(kFontMin, kFontMax);
    await rukiaTextRepo.changFontSize(tempValue);
    emit(state.copyWith(fontSize: tempValue));
  }

  Future resetFontSize() async {
    await changFontSize(kFontDefault);
  }

  Future increaseFontSize() async {
    await changFontSize(state.fontSize + kFontChangeBy);
  }

  Future decreaseFontSize() async {
    await changFontSize(state.fontSize - kFontChangeBy);
  }

  /* ******* Diacritics ******* */

  Future<void> changDiacriticsStatus({required bool value}) async {
    await rukiaTextRepo.changDiacriticsStatus(value: value);
    emit(state.copyWith(showDiacritics: value));
  }

  Future<void> toggleDiacriticsStatus() async {
    await changDiacriticsStatus(value: !state.showDiacritics);
  }
}
