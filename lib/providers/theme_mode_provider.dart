import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ThemeModeProvider with ChangeNotifier {
  ThemeModeProvider() : mode = ThemeMode.system;
  ThemeMode mode;

  bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  void toggleTheme(BuildContext context) {
    if (isDarkMode(context)) {
      mode = ThemeMode.light;
    } else {
      mode = ThemeMode.dark;
    }
    notifyListeners();
  }
}

final themeModeProvider =
    ChangeNotifierProvider<ThemeModeProvider>((ref) => ThemeModeProvider());
