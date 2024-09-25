import 'package:flutter/material.dart';
import 'package:ruqayyah/src/core/extensions/rukia_extension.dart';
import 'package:ruqayyah/src/features/rukia_viewer/data/models/rukia.dart';
import 'package:ruqayyah/src/features/rukia_viewer/presentation/components/custom_text_formatter.dart';

class RukiaContentBuilder extends StatelessWidget {
  final Rukia rukia;
  final double fontSize;
  final bool enableDiacritics;
  final Color? color;
  const RukiaContentBuilder({
    super.key,
    required this.rukia,
    required this.fontSize,
    required this.enableDiacritics,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final containsQuranText = rukia.zikr.contains("QuranText");
    return containsQuranText
        ? ZikrContentTextWithQuran(
            rukia: rukia,
            enableDiacritics: enableDiacritics,
            fontSize: fontSize,
            color: color,
          )
        : ZikrContentPlainText(
            rukia: rukia,
            enableDiacritics: enableDiacritics,
            fontSize: fontSize,
            color: color,
          );
  }
}

class ZikrContentPlainText extends StatelessWidget {
  final Rukia rukia;
  final double fontSize;
  final bool enableDiacritics;
  final Color? color;
  const ZikrContentPlainText({
    super.key,
    required this.rukia,
    required this.fontSize,
    required this.enableDiacritics,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return StringFormatter(
      text: rukia.zikr,
      fontSize: fontSize,
      color: color,
      enableDiacritics: enableDiacritics,
    );
  }
}

class ZikrContentTextWithQuran extends StatelessWidget {
  final Rukia rukia;
  final double fontSize;
  final bool enableDiacritics;
  final Color? color;
  const ZikrContentTextWithQuran({
    super.key,
    required this.rukia,
    required this.fontSize,
    required this.enableDiacritics,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: rukia.getTextSpan(enableDiacritics: enableDiacritics),
      builder: (context, snap) {
        if (!snap.hasData) return const LinearProgressIndicator();

        return RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: snap.data ?? [],
            style: TextStyle(
              fontSize: fontSize,
              height: 2,
              fontFamily: "Kitab",
              color: color ?? Theme.of(context).textTheme.bodyMedium?.color,
            ),
          ),
        );
      },
    );
  }
}
