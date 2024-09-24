// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `About Us`
  String get aboutUs {
    return Intl.message(
      'About Us',
      name: 'aboutUs',
      desc: '',
      args: [],
    );
  }

  /// `Rukia`
  String get appTitle {
    return Intl.message(
      'Rukia',
      name: 'appTitle',
      desc: '',
      args: [],
    );
  }

  /// `Effect Manager`
  String get effectManager {
    return Intl.message(
      'Effect Manager',
      name: 'effectManager',
      desc: '',
      args: [],
    );
  }

  /// `Decreae font size`
  String get fontDecreaeSize {
    return Intl.message(
      'Decreae font size',
      name: 'fontDecreaeSize',
      desc: '',
      args: [],
    );
  }

  /// `Increae font size`
  String get fontIncreaeSize {
    return Intl.message(
      'Increae font size',
      name: 'fontIncreaeSize',
      desc: '',
      args: [],
    );
  }

  /// `Reset font size`
  String get fontResetSize {
    return Intl.message(
      'Reset font size',
      name: 'fontResetSize',
      desc: '',
      args: [],
    );
  }

  /// `Font Settings`
  String get fontSettings {
    return Intl.message(
      'Font Settings',
      name: 'fontSettings',
      desc: '',
      args: [],
    );
  }

  /// `Font Type`
  String get fontType {
    return Intl.message(
      'Font Type',
      name: 'fontType',
      desc: '',
      args: [],
    );
  }

  /// `Free, ad-free and open source app`
  String get freeAdFreeAndOpenSourceApp {
    return Intl.message(
      'Free, ad-free and open source app',
      name: 'freeAdFreeAndOpenSourceApp',
      desc: '',
      args: [],
    );
  }

  /// `General guidelines for Ruqyah`
  String get generalGuidelinesForRuqyah {
    return Intl.message(
      'General guidelines for Ruqyah',
      name: 'generalGuidelinesForRuqyah',
      desc: '',
      args: [],
    );
  }

  /// `Github source code`
  String get github {
    return Intl.message(
      'Github source code',
      name: 'github',
      desc: '',
      args: [],
    );
  }

  /// `Long Rukia`
  String get longRukia {
    return Intl.message(
      'Long Rukia',
      name: 'longRukia',
      desc: '',
      args: [],
    );
  }

  /// `Long`
  String get longRukiaShort {
    return Intl.message(
      'Long',
      name: 'longRukiaShort',
      desc: '',
      args: [],
    );
  }

  /// `Medium Rukia`
  String get mediumRukia {
    return Intl.message(
      'Medium Rukia',
      name: 'mediumRukia',
      desc: '',
      args: [],
    );
  }

  /// `medium`
  String get mediumRukiaShort {
    return Intl.message(
      'medium',
      name: 'mediumRukiaShort',
      desc: '',
      args: [],
    );
  }

  /// `Phone vibration at every praise`
  String get phoneVibrationAtEveryPraise {
    return Intl.message(
      'Phone vibration at every praise',
      name: 'phoneVibrationAtEveryPraise',
      desc: '',
      args: [],
    );
  }

  /// `Phone vibration at single zikr end`
  String get phoneVibrationAtSingleZikrEnd {
    return Intl.message(
      'Phone vibration at single zikr end',
      name: 'phoneVibrationAtSingleZikrEnd',
      desc: '',
      args: [],
    );
  }

  /// `Phone vibration when all zikr end`
  String get phoneVibrationWhenAllZikrEnd {
    return Intl.message(
      'Phone vibration when all zikr end',
      name: 'phoneVibrationWhenAllZikrEnd',
      desc: '',
      args: [],
    );
  }

  /// `Pray for us and our parents.`
  String get prayForUsAndParents {
    return Intl.message(
      'Pray for us and our parents.',
      name: 'prayForUsAndParents',
      desc: '',
      args: [],
    );
  }

  /// `Dr. Khalid bin Abdulrahman Al-Juraisi`
  String get rukiaBookAuthor {
    return Intl.message(
      'Dr. Khalid bin Abdulrahman Al-Juraisi',
      name: 'rukiaBookAuthor',
      desc: '',
      args: [],
    );
  }

  /// `Al-Ruqyah Al-Shar'iyyah from the Quran Al-Kareem and the Sunnah Al-Nabawiyyah`
  String get rukiaBookTitle {
    return Intl.message(
      'Al-Ruqyah Al-Shar\'iyyah from the Quran Al-Kareem and the Sunnah Al-Nabawiyyah',
      name: 'rukiaBookTitle',
      desc: '',
      args: [],
    );
  }

  /// `Ruqyah Etiquette`
  String get ruqyahEtiquette {
    return Intl.message(
      'Ruqyah Etiquette',
      name: 'ruqyahEtiquette',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Short Rukia`
  String get shortRukia {
    return Intl.message(
      'Short Rukia',
      name: 'shortRukia',
      desc: '',
      args: [],
    );
  }

  /// `Short`
  String get shortRukiaShort {
    return Intl.message(
      'Short',
      name: 'shortRukiaShort',
      desc: '',
      args: [],
    );
  }

  /// `Show Diacritics`
  String get showDiacritics {
    return Intl.message(
      'Show Diacritics',
      name: 'showDiacritics',
      desc: '',
      args: [],
    );
  }

  /// `Sound effect at every praise`
  String get soundEffectAtEveryPraise {
    return Intl.message(
      'Sound effect at every praise',
      name: 'soundEffectAtEveryPraise',
      desc: '',
      args: [],
    );
  }

  /// `Sound effect at single zikr end`
  String get soundEffectAtSingleZikrEnd {
    return Intl.message(
      'Sound effect at single zikr end',
      name: 'soundEffectAtSingleZikrEnd',
      desc: '',
      args: [],
    );
  }

  /// `Sound Effect volume`
  String get soundEffectVolume {
    return Intl.message(
      'Sound Effect volume',
      name: 'soundEffectVolume',
      desc: '',
      args: [],
    );
  }

  /// `Sound effect when all zikr end`
  String get soundEffectWhenAllZikrEnd {
    return Intl.message(
      'Sound effect when all zikr end',
      name: 'soundEffectWhenAllZikrEnd',
      desc: '',
      args: [],
    );
  }

  /// `Version`
  String get version {
    return Intl.message(
      'Version',
      name: 'version',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
