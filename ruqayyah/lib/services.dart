import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ruqayyah/src/core/constants/const.dart';
import 'package:ruqayyah/src/core/di/dependency_injection.dart' as service_locator;
import 'package:ruqayyah/src/core/di/dependency_injection.dart';
import 'package:ruqayyah/src/core/extensions/extension_platform.dart';
import 'package:ruqayyah/src/core/functions/app_print.dart';
import 'package:ruqayyah/src/features/ui/data/repository/ui_repo.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:window_manager/window_manager.dart';

Future initServices() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Force portrait
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  await service_locator.initSL();

  if (PlatformExtension.isDesktopOrWeb) {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  }

  try {
    await GetStorage.init(kAppStorageKey);
  } catch (e) {
    appPrint(e);
  }

  await initWindowsManager();
}

Future initWindowsManager() async {
  if (!PlatformExtension.isDesktop) return;

  await windowManager.ensureInitialized();

  final WindowOptions windowOptions = WindowOptions(
    size: sl<UIRepo>().desktopWindowSize,
    center: true,
  );
  await windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.setTitleBarStyle(
      TitleBarStyle.hidden,
      windowButtonVisibility: false,
    );
    await windowManager.show();
    await windowManager.focus();
  });
}
