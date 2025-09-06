import 'package:flutter/material.dart';
import 'package:raparva_app/app/localization/localization.dart';

 class UiUtills {


  static void setContext(BuildContext context) {
  }

 static String translate(BuildContext context, String labelKey) {
    return (AppLocalization.of(context)!.getTranslatedValues(labelKey) ??
            labelKey)
        .trim();
  }
}