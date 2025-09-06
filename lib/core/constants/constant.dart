
import 'package:raparva_app/core/languages/language_model.dart';

abstract class Constant {

  static List<LanguageModel> languages = [
    LanguageModel(
      imageUrl: "https://images.unsplash.com/photo-1746059876602-c9eb82b99332?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      languageName: 'English',
      countryCode: 'US',
      languageCode: 'en',
    ),
    LanguageModel(
      imageUrl: "https://images.unsplash.com/photo-1746059876602-c9eb82b99332?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      languageName: 'Nepali',
      countryCode: 'NP',
      languageCode: 'ne',
    ),
  ];
}