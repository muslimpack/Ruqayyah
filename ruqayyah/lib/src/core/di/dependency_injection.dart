import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ruqayyah/src/core/constants/const.dart';
import 'package:ruqayyah/src/core/utils/volume_button_manager.dart';
import 'package:ruqayyah/src/features/azkar_filters/data/repository/azakr_filters_repo.dart';
import 'package:ruqayyah/src/features/azkar_filters/presentation/controller/cubit/azkar_filters_cubit.dart';
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
  sl.registerLazySingleton(() => AzkarFiltersRepo(sl()));

  ///MARK: Init Repo
  sl.registerLazySingleton(() => RukiaDBHelper());
  sl.registerLazySingleton(() => UthmaniDBHelper());

  ///MARK: Init Manager
  sl.registerFactory(() => EffectsManager(sl()));
  sl.registerFactory(() => VolumeButtonManager());

  ///MARK: Init BLOC

  /// Singleton BLoC
  sl.registerLazySingleton(() => SettingsCubit(sl(), sl(), sl(), sl()));
  sl.registerLazySingleton(() => AzkarFiltersCubit(sl()));

  /// Factory BLoC
}
