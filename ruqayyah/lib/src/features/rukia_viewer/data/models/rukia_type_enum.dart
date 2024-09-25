import 'package:flutter/material.dart';
import 'package:ruqayyah/generated/l10n.dart';

enum RukiaTypeEnum {
  short("almujaza"),
  medium("almutawasita"),
  long("almutawala");

  const RukiaTypeEnum(this.nameInDB);

  final String nameInDB;
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
