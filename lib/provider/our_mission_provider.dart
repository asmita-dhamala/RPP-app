// // import 'dart:convert';
// // import 'package:flutter_riverpod/flutter_riverpod.dart';
// // import 'package:http/http.dart' as http;
// // import 'package:raparva_app/data/models/our-mission-model.dart';

// // const String apiUrl = 'https://rpp.org.np/api/home-page';

// // final ourMissionProvider = FutureProvider<List<ContentBlock>>((ref) async {
// //   final response = await http.get(Uri.parse(apiUrl));
// //   if (response.statusCode == 200) {
// //     final Map<String, dynamic> decoded = jsonDecode(response.body);
// //     final dataList = decoded['data'] as List<dynamic>? ?? [];
// //     return dataList.map((e) => ContentBlock.fromJson(e)).toList();
// //   } else {
// //     throw Exception('Failed to load content blocks from API: ${response.statusCode}');
// //   }
// // });



// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:raparva_app/data/models/our-mission-model.dart';
// import 'package:raparva_app/data/services/our-mission-service.dart';

// final apiServiceProvider = Provider<ApiService>((ref) => ApiService());

// final ourMissionProvider = FutureProvider<List<ContentBlock>>((ref) async {
//   final apiService = ref.read(apiServiceProvider);
//   return apiService.fetchContentBlocks();
// });


