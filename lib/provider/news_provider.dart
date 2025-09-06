// // lib/provider/news_provider.dart

// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:raparva_app/data/models/news_list_model.dart';
// import '../data/services/news_service.dart';

// final newsListProvider = FutureProvider<ListNewsBlockModel?>((ref) async {
//   return await NewsService.fetchNewsList();
// });



// lib/provider/news_provider.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:raparva_app/data/models/news_list_model.dart';
import 'package:raparva_app/data/services/news_service.dart';

final newsListProvider = FutureProvider.autoDispose<ListNewsBlockModel?>((ref) async {
  return await NewsService.fetchNewsList();
});
