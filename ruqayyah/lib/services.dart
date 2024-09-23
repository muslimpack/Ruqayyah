import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ruqayyah/src/core/di/dependency_injection.dart'
    as service_locator;
import 'package:ruqayyah/src/core/functions/app_print.dart';

Future initServices() async {
  await phoneBars();
  await service_locator.initSL();
  try {
    await GetStorage.init();
  } catch (e) {
    appPrint(e);
  }
}

Future phoneBars() async {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}
