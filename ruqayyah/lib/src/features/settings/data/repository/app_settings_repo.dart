import 'package:get_storage/get_storage.dart';

class AppSettingsRepo {
  final GetStorage box;

  AppSettingsRepo(this.box);

  ///MARK:Release First open
  /* ******* is first open to this release ******* */

  static const _currentVersion = "currentVersion";
  String get currentVersion => box.read(_currentVersion) ?? "";

  Future<void> changCurrentVersion({required String value}) async {
    await box.write(_currentVersion, value);
  }

  ///MARK:WakeLock
  /* ******* WakeLock ******* */

  static const String _enableWakeLockKey = "enableWakeLock";
  bool get enableWakeLock => box.read(_enableWakeLockKey) ?? false;

  Future<void> changeEnableWakeLock({required bool use}) => box.write(_enableWakeLockKey, use);

  void toggleEnableWakeLock() {
    changeEnableWakeLock(use: !enableWakeLock);
  }

  ///MARK: Praise With Volume Keys
  /* ******* Praise With Volume Keys ******* */
  static const praiseWithVolumeKeysKey = 'praiseWithVolumeKeys';

  bool get praiseWithVolumeKeys => box.read(praiseWithVolumeKeysKey) ?? true;

  Future<void> changePraiseWithVolumeKeysStatus({required bool value}) =>
      box.write(praiseWithVolumeKeysKey, value);
}
