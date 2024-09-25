import 'package:ruqayyah/src/core/di/dependency_injection.dart';
import 'package:ruqayyah/src/features/azkar_filters/data/models/zikr_filter.dart';
import 'package:ruqayyah/src/features/azkar_filters/data/models/zikr_filter_enum.dart';
import 'package:ruqayyah/src/features/azkar_filters/data/repository/azakr_filters_repo.dart';
import 'package:ruqayyah/src/features/rukia_viewer/data/models/rukia.dart';

extension FilterListExt on List<Filter> {
  List<Rukia> getFilteredZikr(List<Rukia> azkar) {
    final filterBySource = sl<AzkarFiltersRepo>().getEnableFiltersStatus;
    final filterByHokm = sl<AzkarFiltersRepo>().getEnableHokmFiltersStatus;

    if (!filterBySource && !filterByHokm) {
      return azkar;
    }

    return azkar.where((zikr) {
      if (filterBySource && !validateSource(zikr.source)) {
        return false;
      }
      if (filterByHokm && !validateHokm(zikr.hokm)) {
        return false;
      }
      return true;
    }).toList();
  }

  bool validateSource(String source) {
    bool isValid = false;

    for (final e in this) {
      if (!e.isActivated || e.filter.isForHokm) continue;

      isValid = source.contains(e.filter.nameInDatabase);

      if (isValid) break;
    }

    return isValid;
  }

  bool validateHokm(String hokm) {
    bool isValid = false;

    for (final e in this) {
      if (!e.isActivated || !e.filter.isForHokm) continue;

      isValid = hokm == e.filter.nameInDatabase;

      if (isValid) break;
    }

    return isValid;
  }
}
