import 'package:flutter/material.dart';

class TodoProvider extends ChangeNotifier {
  
  String language = "English";

  void changeLanguage(String newLanguage) {
    if (language == newLanguage) {
      return;
    }
    language = newLanguage;
    notifyListeners();
  }

  String themeMode = "light";

  void changeThemeMode(String newThemeMode) {
    if (themeMode == newThemeMode) {
      return;
    }
    themeMode = newThemeMode;
    notifyListeners();
  }

}