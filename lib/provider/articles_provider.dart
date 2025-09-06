import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:raparva_app/data/models/articles.dart';
import 'package:raparva_app/data/services/articles_api.dart';

final alekhV2Provider = FutureProvider<AlekhV2Model?>((ref) async {
  return AlekhV2Service.fetchAlekhV2();
});
