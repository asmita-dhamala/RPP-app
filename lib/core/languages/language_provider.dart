import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:raparva_app/core/HiveStorage/hive_key.dart';

class LanguageState {
  final String languageCode;
  final bool isRTL;

  LanguageState({required this.languageCode, required this.isRTL});

  Locale get locale => Locale(languageCode);
}

class LanguageNotifier extends AsyncNotifier<LanguageState> {
  @override
  Future<LanguageState> build() async {
    final box = await Hive.openBox(HiveKeys.languageBox);
    final language = box.get(HiveKeys.currentLanguageKey);

    if (language != null && language is Map) {
      final code = language['code'] ?? 'ne';
      final isRTL = language['isRTL'] ?? false;
      return LanguageState(languageCode: code, isRTL: isRTL);
    }

    /// ✅ Save default value
    await box.put(HiveKeys.currentLanguageKey, {
      'code': 'ne',
      'isRTL': false,
    });

    return LanguageState(languageCode: 'ne', isRTL: false);
  }

  Future<void> setLanguage(String code, bool isRTL) async {
    final box = Hive.box(HiveKeys.languageBox);
    await box.put(HiveKeys.currentLanguageKey, {
      'code': code,
      'isRTL': isRTL,
    });

    state = AsyncData(LanguageState(languageCode: code, isRTL: isRTL));
  }
}

final languageProvider =
    AsyncNotifierProvider<LanguageNotifier, LanguageState>(
  LanguageNotifier.new,
);
