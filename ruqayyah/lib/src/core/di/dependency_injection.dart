import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ruqayyah/src/core/constants/const.dart';
import 'package:ruqayyah/src/features/effects_manager/data/repository/effects_repo.dart';
import 'package:ruqayyah/src/features/effects_manager/presentation/controller/effect_manager.dart';
import 'package:ruqayyah/src/features/home/data/repository/ruki_db_helper.dart';
import 'package:ruqayyah/src/features/quran/data/repository/uthmani_db_helper.dart';
import 'package:ruqayyah/src/features/settings/data/repository/app_settings_repo.dart';
import 'package:ruqayyah/src/features/settings/data/repository/rukia_text_repo.dart';
import 'package:ruqayyah/src/features/settings/presentation/controller/cubit/settings_cubit.dart';
import 'package:ruqayyah/src/features/ui/data/repository/ui_repo.dart';

final sl = GetIt.instance;

Future<void> initSL() async {
  ///MARK: Init storages
  sl.registerLazySingleton(() => GetStorage(kAppStorageKey));
  sl.registerLazySingleton(() => EffectsRepo(sl()));
  sl.registerLazySingleton(() => UIRepo(sl()));
  sl.registerLazySingleton(() => RukiaTextRepo(sl()));
  sl.registerLazySingleton(() => AppSettingsRepo(sl()));

  ///MARK: Init Repo
  sl.registerLazySingleton(() => RukiaDBHelper());
  sl.registerLazySingleton(() => UthmaniDBHelper());

  ///MARK: Init Manager
  sl.registerFactory(() => EffectsManager(sl()));

  ///MARK: Init BLOC

  /// Singleton BLoC
  sl.registerLazySingleton(() => SettingsCubit(sl(), sl(), sl(), sl()));

  /// Factory BLoC
}
