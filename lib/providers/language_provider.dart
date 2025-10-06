import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier {
  Locale _currentLocale = Locale('en');

  Locale get currentLang => _currentLocale;

  void changeLang(Locale newLocale) {
    if (_currentLocale == newLocale) return;
    _currentLocale = newLocale;
    notifyListeners();
  }

  void toggleLang() {
    if (_currentLocale == Locale('en')) {
      _currentLocale = Locale('ar');
    } else {
      _currentLocale = Locale('en');
    }
    notifyListeners();
  }
}
