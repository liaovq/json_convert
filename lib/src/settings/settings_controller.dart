import 'package:flutter/material.dart';
import 'settings_service.dart';

class SettingsController with ChangeNotifier {

  SettingsController(this._settingsService);

  final SettingsService _settingsService;
  late Locale _language;
  late ThemeMode _themeMode;

  Locale get language => _language;
  ThemeMode get themeMode => _themeMode;

  Future<void> loadSettings() async {
    _themeMode = await _settingsService.themeMode();
    _language = await _settingsService.language();
    notifyListeners();
  }

  Future<void> updateThemeMode(ThemeMode? newThemeMode) async {
    if (newThemeMode == null) return;
    if (newThemeMode == _themeMode) return;

    _themeMode = newThemeMode;
    notifyListeners();
    await _settingsService.updateThemeMode(newThemeMode);
  }

  Future<void> updateLanguage(Locale? newLanguage) async {
    if (newLanguage == null) return;
    if (newLanguage == _language) return;

    _language = newLanguage;
    notifyListeners();
    await _settingsService.updateLanguage(newLanguage);
  }
}
