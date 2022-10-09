import 'package:flutter/material.dart';
import 'package:OnePay/generated/l10n.dart';

import 'hive_store.dart';

class Language {
  static const String EN = 'en';
  static const String ZH_CN = 'zh_CN';
  static const String KM_KH = 'km_KH';
  static const Locale EN_LOCALE = Locale.fromSubtags(languageCode: 'en');
  static const Locale ZH_CN_LOCALE =
      Locale.fromSubtags(languageCode: 'zh', countryCode: 'CN');
  static const Locale KM_KH_LOCALE =
      Locale.fromSubtags(languageCode: 'km', countryCode: 'KH');

  static Locale getLocaleByLanguage(String lang) {
    switch (lang) {
      case 'en':
        return const Locale.fromSubtags(languageCode: 'en');
      case 'km_KH':
        return const Locale.fromSubtags(languageCode: 'km', countryCode: 'KH');
      case 'zh_CN':
        return const Locale.fromSubtags(languageCode: 'zh', countryCode: 'CN');
      default:
        return const Locale.fromSubtags(languageCode: 'en');
    }
  }

  static saveSelectedLanguage(String language) {
    Boxes.appConfigBox.put(ConfigKey.LANGUAGE, language);
  }

  static getCountryCode(String language) {
    switch (language) {
      case Language.EN:
        return 'EN';
      case Language.ZH_CN:
        return 'CN';
      case Language.KM_KH:
        return 'KH';
      default:
        return 'EN';
    }
  }

  static String getSaveLanguage([bool countryCode = false]) {
    String language =
        Boxes.appConfigBox.get(ConfigKey.LANGUAGE, defaultValue: 'en');
    if (countryCode) {
      return getCountryCode(language);
    } else {
      return language;
    }
  }
}

class LanguageItemModel {
  String? title;
  Image? icon;
  String? value;

  LanguageItemModel({this.title, this.icon, this.value});
}
