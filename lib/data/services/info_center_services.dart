

import '../../core/constants/api_constants.dart';
import '../../core/utils/api_util.dart';
import '../models/info_center_model.dart';

class InfoCenterService {
  static Future<InfoCenterModel?> fetchInfoCenter() async {
    try {
      final rawResponse = await ApiUtil.get(ApiConstants.homePage, useRawUrl: true);

      // Safely cast response to Map<String, dynamic>
      if (rawResponse == null || rawResponse is! Map<String, dynamic>) {
        print('NewsService: Invalid API response format');
        return null;
      }
      final Map<String, dynamic> data = rawResponse;
      // response["type"] is a list
      if (data['data'] is List) {
        // Cast to List<Map<String, dynamic>> safely
        final List<Map<String, dynamic>> blocks =
        (data['data'] as List).cast<Map<String, dynamic>>();

        // Find the first block with type 'list_news'
        final infoBlock = blocks.firstWhere(
              (element) => (element['type']?.toString().toLowerCase() == 'box_featured'),
          orElse: () => {},
        );

        // Check if a non-empty block is found
        if (infoBlock.isNotEmpty) {
          return InfoCenterModel.fromJson(infoBlock);
        } else {
          print('InfoCenterService: No InfoCenter block found');
        }
      }
      else {
        print('InfoCenterService: "data" key missing or not a list');
      }

      print('⚠️ InfoBlock not found');
      return null;
    } catch (e) {
      print('❌ InfoCenterService.fetchInfoCenter error: $e');
      return null;
    }
  }
}
