import 'package:ruqayyah/src/core/utils/arabic_number.dart';

extension ObjectExtension on Object {
  /// Convert Object's non arabic number to arabic one
  String toArabicNumberString() {
    return ArabicNumbers.convert(toString());
  }
}
