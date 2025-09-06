import 'package:raparva_app/core/constants/api_constants.dart';
import 'package:raparva_app/core/utils/api_util.dart';
import 'package:raparva_app/data/models/news_list_model.dart';

class NewsService {
  /// Fetches the first "list_news" block from the homepage API and parses it.
  static Future<ListNewsBlockModel?> fetchNewsList() async {
    try {
      // Fetch raw decoded JSON from ApiUtil (which returns decoded JSON)
      final rawResponse = await ApiUtil.get(ApiConstants.homePage, useRawUrl: true);

      // Safely cast response to Map<String, dynamic>
      if (rawResponse == null || rawResponse is! Map<String, dynamic>) {
        print('NewsService: Invalid API response format');
        return null;
      }
      final Map<String, dynamic> data = rawResponse;

      // Check if 'data' key exists and is a List
      if (data['data'] is List) {
        // Cast to List<Map<String, dynamic>> safely
        final List<Map<String, dynamic>> blocks =
            (data['data'] as List).cast<Map<String, dynamic>>();

        // Find the first block with type 'list_news'
        final listNewsBlock = blocks.firstWhere(
          (element) => (element['type']?.toString().toLowerCase() == 'list_news'),
          orElse: () => {},
        );

        // Check if a non-empty block is found
        if (listNewsBlock.isNotEmpty) {
          return ListNewsBlockModel.fromJson(listNewsBlock);
        } else {
          print('NewsService: No list_news block found');
        }
      } else {
        print('NewsService: "data" key missing or not a list');
      }

      return null;
    } catch (e) {
      print('NewsService: Exception caught - $e');
      return null;
    }
  }
}
