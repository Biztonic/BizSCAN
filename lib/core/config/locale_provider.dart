import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../services/di_service.dart';

part 'locale_provider.g.dart';

@riverpod
class LocaleStateNotifier extends _$LocaleStateNotifier {
  late final SharedPreferences _prefs;

  @override
  Locale build() {
    _prefs = sl<SharedPreferences>();
    final code = _prefs.getString('selected_language') ?? 'en';
    return Locale(code);
  }

  Future<void> changeLocale(String languageCode) async {
    await _prefs.setString('selected_language', languageCode);
    state = Locale(languageCode);
  }
}
