import 'package:get_storage/get_storage.dart';
import 'package:ruqayyah/src/core/constants/font_const.dart';

class RukiaTextRepo {
  final GetStorage box;
  RukiaTextRepo(this.box);

  ///MARK: Font
  /* ******* Font Size ******* */
  static const String _fontSizeKey = "prefFontSize";
  double get fontSize => box.read<double>(_fontSizeKey) ?? kFontDefault;

  Future<void> changFontSize(double value) async {
    final double tempValue = value.clamp(kFontMin, kFontMax);
    await box.write(_fontSizeKey, tempValue);
  }

  /* ******* Diacritics ******* */

  static const String _showDiacriticsKey = "prefShowDiacritics";
  bool get showDiacritics => box.read(_showDiacriticsKey) ?? true;

  Future<void> changDiacriticsStatus({required bool value}) async =>
      box.write(_showDiacriticsKey, value);
}
