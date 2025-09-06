// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:raparva_app/data/models/our-mission-model.dart';

// class ApiService {
//   static const String apiUrl = 'https://rpp.org.np/api/home-page';

//   Future<List<ContentBlock>> fetchContentBlocks() async {
//     final response = await http.get(Uri.parse(apiUrl));

//     if (response.statusCode == 200) {
//       final Map<String, dynamic> decoded = jsonDecode(response.body);
//       final List<dynamic> dataList = decoded['data'] ?? [];

//       return dataList.map((e) => ContentBlock.fromJson(e)).toList();
//     } else {
//       throw Exception(
//         'Failed to load content blocks. Status Code: ${response.statusCode}',
//       );
//     }
//   }
// }
