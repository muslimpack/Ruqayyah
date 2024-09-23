import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ruqayyah/src/core/constants/text_const.dart';
import 'package:ruqayyah/src/core/di/dependency_injection.dart';
import 'package:ruqayyah/src/core/extensions/extension_rich_text.dart';
import 'package:ruqayyah/src/core/extensions/extension_string.dart';
import 'package:ruqayyah/src/core/utils/range_text_formatter.dart';
import 'package:ruqayyah/src/features/home/data/models/rukia.dart';
import 'package:ruqayyah/src/features/quran/data/models/verse_range.dart';
import 'package:ruqayyah/src/features/quran/data/repository/uthmani_db_helper.dart';

extension RukiaExt on Rukia {
  Future<String> toPlainText({bool enableDiacritics = true}) async {
    if (zikr.contains("QuranText")) {
      final spans = await getTextSpan(enableDiacritics: enableDiacritics);
      final RichText richText = RichText(
        text: TextSpan(
          children: spans,
        ),
      );

      return richText.toPlainText();
    } else {
      return zikr;
    }
  }

  Future<Map<VerseRange, String>> getQuranVersesTextFormSingleRange(
    String rangeText,
  ) async {
    final List<VerseRange> ranges = RangeTextFormatter.parse(rangeText);
    final Map<VerseRange, String> result = {};

    final List<String> verses = [];
    for (final range in ranges) {
      final text = await sl<UthmaniDBHelper>().getArabicText(
        sura: range.startSura,
        startAyah: range.startAyah,
        endAyah: range.endingAyah,
      );
      verses.add(text);
      result[range] = text;
    }

    return result;
  }

  Future<List<InlineSpan>> getTextSpan({bool enableDiacritics = true}) async {
    final List<String> lines = zikr.split("\n");

    lines.indexWhere((e) => e.contains("QuranText"));

    final List<InlineSpan> spans = [];

    for (var lineIndex = 0; lineIndex < lines.length; lineIndex++) {
      final line = lines[lineIndex];
      if (line.contains("QuranText")) {
        spans.addAll(
          _getTextSpanForSingleItem(
            await getQuranVersesTextFormSingleRange(line),
            lines.length,
            lineIndex,
            enableDiacritics,
          ),
        );
      } else {
        final containAyah = zikr.contains("﴿");
        spans.add(
          TextSpan(
            text: enableDiacritics ? line : line.removeDiacritics,
            style: containAyah
                ? TextStyle(
                    fontFamily: containAyah ? "Uthmanic2" : "Kitab",
                  )
                : null,
          ),
        );
      }
    }
    return spans;
  }

  List<InlineSpan> _getTextSpanForSingleItem(
    Map<VerseRange, String> verses,
    int linesLength,
    int lineIndex,
    bool enableDiacritics,
  ) {
    final List<InlineSpan> spans = [];
    if (lineIndex != 0) spans.add(const TextSpan(text: "\n\n"));
    for (var i = 0; i < verses.entries.length; i++) {
      final currentVerse = verses.entries.elementAt(i);

      final List<String> verse = [];

      final alhashrFinalAyah =
          currentVerse.key.startSura == 59 && currentVerse.key.startAyah == 22;

      final bool notHaveEstaaza = alhashrFinalAyah;
      if (i == 0 && !notHaveEstaaza) verse.addAll([kEstaaza, "\n\n"]);

      verse.add(kArBasmallah);

      verse.add(" ﴿ ${currentVerse.value.trim()} ﴾");

      if (i != verses.length - 1) verse.add("\n\n");

      spans.add(
        TextSpan(
          text: enableDiacritics ? verse.join() : verse.join().removeDiacritics,
          style: const TextStyle(
            fontFamily: "Uthmanic2",
          ),
        ),
      );
    }
    if (lineIndex != linesLength - 1) {
      spans.add(const TextSpan(text: "\n\n"));
    }

    return spans;
  }
}
