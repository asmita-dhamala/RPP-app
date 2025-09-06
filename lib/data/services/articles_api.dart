import 'package:raparva_app/core/constants/api_constants.dart';
import 'package:raparva_app/core/utils/api_util.dart';
import 'package:raparva_app/data/models/articles.dart';

class AlekhV2Service {
  static Future<AlekhV2Model?> fetchAlekhV2() async {
    try {
      final response = await ApiUtil.get(ApiConstants.homePage, useRawUrl: true);
      
      if (response == null) {
        throw Exception('API response was null');
      }
      
      final Map<String, dynamic> data = response as Map<String, dynamic>;

      if (data.containsKey('data')) {
        final List<dynamic> blocks = data['data'];

        // Using where() + isNotEmpty instead of firstWhere with orElse returning null
        final filtered = blocks.where((block) => block['type'] == 'alekh_v2').toList();

        if (filtered.isNotEmpty) {
          final Map<String, dynamic> alekhBlock = filtered.first;
          return AlekhV2Model.fromJson(alekhBlock);
        }
      }

      return null;
    } catch (e) {
      rethrow;
    }
  }
}
