import 'package:ruqayyah/src/core/functions/app_print.dart';
import 'package:ruqayyah/src/features/quran/data/models/verse_range.dart';

class RangeTextFormatter {
  static List<VerseRange> parse(String text) {
    final RegExp exp = RegExp(r'QuranText\[(\([^)]+\)(?:,\([^)]+\))*)\]');
    final Match? match = exp.firstMatch(text);
    if (match != null) {
      final List<String> ranges = match.group(1)!.split(',');
      final List<VerseRange> parsedRanges = [];
      for (final String range in ranges) {
        final RegExp rangeExp = RegExp(r'\((\d+):(\d+):(\d+)\)');
        final Match? rangeMatch = rangeExp.firstMatch(range);
        if (rangeMatch != null) {
          final int suraStart = int.parse(rangeMatch.group(1)!);
          final int ayaStart = int.parse(rangeMatch.group(2)!);
          final int ayaEnd = int.parse(rangeMatch.group(3)!);
          parsedRanges.add(VerseRange(suraStart, ayaStart, suraStart, ayaEnd));
        }
      }
      return parsedRanges;
    } else {
      appPrint("no match");
      return [];
    }
  }
}
