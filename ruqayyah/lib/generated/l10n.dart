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

  /// `al-Ruka`
  String get alruka {
    return Intl.message(
      'al-Ruka',
      name: 'alruka',
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

  /// `Azkar Filters`
  String get azkarFilters {
    return Intl.message(
      'Azkar Filters',
      name: 'azkarFilters',
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

  /// `Enable Azkar filters`
  String get enableAzkarFilters {
    return Intl.message(
      'Enable Azkar filters',
      name: 'enableAzkarFilters',
      desc: '',
      args: [],
    );
  }

  /// `Enable wake lock`
  String get enableWakeLock {
    return Intl.message(
      'Enable wake lock',
      name: 'enableWakeLock',
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

  /// `General`
  String get general {
    return Intl.message(
      'General',
      name: 'general',
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

  /// `Athar`
  String get hokmAthar {
    return Intl.message(
      'Athar',
      name: 'hokmAthar',
      desc: '',
      args: [],
    );
  }

  /// `Weak`
  String get hokmDaeif {
    return Intl.message(
      'Weak',
      name: 'hokmDaeif',
      desc: '',
      args: [],
    );
  }

  /// `Good`
  String get hokmHasan {
    return Intl.message(
      'Good',
      name: 'hokmHasan',
      desc: '',
      args: [],
    );
  }

  /// `Fabricated`
  String get hokmMawdue {
    return Intl.message(
      'Fabricated',
      name: 'hokmMawdue',
      desc: '',
      args: [],
    );
  }

  /// `Authentic`
  String get hokmSahih {
    return Intl.message(
      'Authentic',
      name: 'hokmSahih',
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

  /// `Next`
  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get no {
    return Intl.message(
      'No',
      name: 'no',
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

  /// `Praise with volume keys`
  String get prefPraiseWithVolumeKeys {
    return Intl.message(
      'Praise with volume keys',
      name: 'prefPraiseWithVolumeKeys',
      desc: '',
      args: [],
    );
  }

  /// `Previous`
  String get previous {
    return Intl.message(
      'Previous',
      name: 'previous',
      desc: '',
      args: [],
    );
  }

  /// `ResetAll`
  String get resetAll {
    return Intl.message(
      'ResetAll',
      name: 'resetAll',
      desc: '',
      args: [],
    );
  }

  /// `Resume last session?`
  String get resumeLastSession {
    return Intl.message(
      'Resume last session?',
      name: 'resumeLastSession',
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

  /// `Select hokm of Azakr`
  String get selectAzkarHokmFilters {
    return Intl.message(
      'Select hokm of Azakr',
      name: 'selectAzkarHokmFilters',
      desc: '',
      args: [],
    );
  }

  /// `Select source of Azkar`
  String get selectAzkarSource {
    return Intl.message(
      'Select source of Azkar',
      name: 'selectAzkarSource',
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

  /// `Sunan Abi Dawud`
  String get sourceAbuDawood {
    return Intl.message(
      'Sunan Abi Dawud',
      name: 'sourceAbuDawood',
      desc: '',
      args: [],
    );
  }

  /// `Sunan al-Darimi`
  String get sourceAdDarami {
    return Intl.message(
      'Sunan al-Darimi',
      name: 'sourceAdDarami',
      desc: '',
      args: [],
    );
  }

  /// `Musnad Ahmad ibn Hanbal`
  String get sourceAhmad {
    return Intl.message(
      'Musnad Ahmad ibn Hanbal',
      name: 'sourceAhmad',
      desc: '',
      args: [],
    );
  }

  /// `Al-Sunan al-Sughra by al-Nasa'i`
  String get sourceAnNasai {
    return Intl.message(
      'Al-Sunan al-Sughra by al-Nasa\'i',
      name: 'sourceAnNasai',
      desc: '',
      args: [],
    );
  }

  /// `Athr`
  String get sourceAthar {
    return Intl.message(
      'Athr',
      name: 'sourceAthar',
      desc: '',
      args: [],
    );
  }

  /// `Sunan al-Tirmidhi`
  String get sourceAtTirmidhi {
    return Intl.message(
      'Sunan al-Tirmidhi',
      name: 'sourceAtTirmidhi',
      desc: '',
      args: [],
    );
  }

  /// `Sunan al-Bayhaqi`
  String get sourceBayhaqi {
    return Intl.message(
      'Sunan al-Bayhaqi',
      name: 'sourceBayhaqi',
      desc: '',
      args: [],
    );
  }

  /// `Al-Mustadrak ala al-Sahihayn`
  String get sourceHakim {
    return Intl.message(
      'Al-Mustadrak ala al-Sahihayn',
      name: 'sourceHakim',
      desc: '',
      args: [],
    );
  }

  /// `Sunan IbnMajah`
  String get sourceIbnMajah {
    return Intl.message(
      'Sunan IbnMajah',
      name: 'sourceIbnMajah',
      desc: '',
      args: [],
    );
  }

  /// `IbnSunny`
  String get sourceIbnSunny {
    return Intl.message(
      'IbnSunny',
      name: 'sourceIbnSunny',
      desc: '',
      args: [],
    );
  }

  /// `Muwatta Imam Malik`
  String get sourceMalik {
    return Intl.message(
      'Muwatta Imam Malik',
      name: 'sourceMalik',
      desc: '',
      args: [],
    );
  }

  /// `Quran`
  String get sourceQuran {
    return Intl.message(
      'Quran',
      name: 'sourceQuran',
      desc: '',
      args: [],
    );
  }

  /// `Sahih al-Bukhari`
  String get sourceSahihBukhari {
    return Intl.message(
      'Sahih al-Bukhari',
      name: 'sourceSahihBukhari',
      desc: '',
      args: [],
    );
  }

  /// `Sahih Muslim`
  String get sourceSahihMuslim {
    return Intl.message(
      'Sahih Muslim',
      name: 'sourceSahihMuslim',
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

  /// `Yes`
  String get yes {
    return Intl.message(
      'Yes',
      name: 'yes',
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
