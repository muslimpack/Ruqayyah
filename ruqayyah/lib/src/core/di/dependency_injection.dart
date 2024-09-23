import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ruqayyah/src/core/constants/const.dart';
import 'package:ruqayyah/src/features/effects_manager/data/repository/effects_repo.dart';
import 'package:ruqayyah/src/features/effects_manager/presentation/controller/effect_manager.dart';
import 'package:ruqayyah/src/features/home/data/repository/book_helper.dart';
import 'package:ruqayyah/src/features/ui/data/repository/local_repo.dart';

final sl = GetIt.instance;

Future<void> initSL() async {
  ///MARK: Init storages
  sl.registerLazySingleton(() => GetStorage(kAppStorageKey));
  sl.registerLazySingleton(() => EffectsRepo(sl()));
  sl.registerLazySingleton(() => UIRepo(sl()));

  ///MARK: Init Repo
  sl.registerLazySingleton(() => RukiaDBHelper());

  ///MARK: Init Manager
  sl.registerFactory(() => EffectsManager(sl()));

  ///MARK: Init BLOC

  /// Singleton BLoC

  /// Factory BLoC
}
