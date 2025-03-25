import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

class LocalizationService {
  static final LocalizationService _instance = LocalizationService._internal();
  factory LocalizationService() => _instance;

  LocalizationService._internal();

  Map<String, dynamic> _localizedStrings = {};

  Future<void> loadLanguage(String langCode) async {
    String jsonString = await rootBundle.loadString('assets/lang/$langCode.json');
    _localizedStrings = jsonDecode(jsonString);
  }

  String translate(String key) {
    return _localizedStrings[key] ?? key;
  }
}

class LanguageProvider extends ChangeNotifier {
  String _currentLanguage = 'en';
  LocalizationService _localizationService = LocalizationService();

  String get currentLanguage => _currentLanguage;

  Future<void> changeLanguage(String langCode) async {
    _currentLanguage = langCode;
    await _localizationService.loadLanguage(langCode);
    notifyListeners();
  }

  String t(String key) {
    return _localizationService.translate(key);
  }
}
