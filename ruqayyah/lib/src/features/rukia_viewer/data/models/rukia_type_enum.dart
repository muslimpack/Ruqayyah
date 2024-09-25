import 'package:flutter/material.dart';
import 'package:ruqayyah/generated/l10n.dart';

enum RukiaTypeEnum {
  short("almujaza", 0),
  medium("almutawasita", 1),
  long("almutawala", 2);

  const RukiaTypeEnum(this.nameInDB, this.id);

  final String nameInDB;
  final int id;
}

extension RukiaTypeEnumExt on RukiaTypeEnum {
  String localeName(BuildContext context) {
    switch (this) {
      case RukiaTypeEnum.short:
        return S.of(context).shortRukia;

      case RukiaTypeEnum.medium:
        return S.of(context).mediumRukia;

      case RukiaTypeEnum.long:
        return S.of(context).longRukia;
    }
  }

  String localeShortName(BuildContext context) {
    switch (this) {
      case RukiaTypeEnum.short:
        return S.of(context).shortRukiaShort;

      case RukiaTypeEnum.medium:
        return S.of(context).mediumRukiaShort;

      case RukiaTypeEnum.long:
        return S.of(context).longRukiaShort;
    }
  }
}
