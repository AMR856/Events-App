import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode _currentTheme = ThemeMode.light;

  ThemeMode get currentTheme => _currentTheme;


  void changeTheme(ThemeMode newTheme) {
    if (_currentTheme == newTheme) return;
    _currentTheme = newTheme;
    notifyListeners();
  }
  void toggleTheme(){
    if (_currentTheme == ThemeMode.dark) {
      _currentTheme = ThemeMode.light;

    } else {
      _currentTheme = ThemeMode.dark;
    }
    notifyListeners();
  }
}