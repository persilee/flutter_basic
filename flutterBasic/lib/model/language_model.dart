import 'package:flutter/material.dart';
import 'package:one_pay/generated/l10n.dart';
import 'package:one_pay/utils/language.dart';

class LanguageModel extends ChangeNotifier {
  String _language = Language.getSaveLanguage();
  String _languageCountryCode = Language.getSaveLanguage(true);

  String get language => _language;

  String get languageCountryCode => _languageCountryCode;

  void selectLanguage(String language) {
    _language = language;
    _languageCountryCode = Language.getCountryCode(language);
    S.load(Language.getLocaleByLanguage(language));
    Language.saveSelectedLanguage(language);
    notifyListeners();
  }
}
