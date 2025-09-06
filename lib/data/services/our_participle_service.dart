// import 'package:dio/dio.dart';
// import 'package:raparva_app/data/models/our-participate-models.dart';

// class OurParticipleService {
//   final Dio _dio = Dio();

//   Future<OurParticipleModel> fetchOurParticiple() async {
//     try {
//       final response = await _dio.get('https://rpp.org.np/api/home-page');
//       final List<dynamic> dataList = response.data['data'];

//       // Filter for type == 'our_participle'
//       final ourParticipleJson = dataList.firstWhere(
//         (element) => element['type'] == 'our_participle',
//         orElse: () => throw Exception('No our_participle found'),
//       );

//       return OurParticipleModel.fromJson(ourParticipleJson);
//     } catch (e) {
//       throw Exception('Failed to fetch our_participle data: $e');
//     }
//   }
// }
