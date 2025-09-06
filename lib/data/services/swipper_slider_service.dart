import 'package:raparva_app/core/constants/api_constants.dart';
import 'package:raparva_app/core/utils/api_util.dart';
import 'package:raparva_app/data/models/SwipperSliderModel.dart';

class SwipperSliderService {
  static Future<SwipperSliderModel?> fetchSwipperSlider() async {
    try {
      final response = await ApiUtil.get(ApiConstants.homePage, useRawUrl: true);

      if (response == null || response is! Map<String, dynamic>) {
        print('❌ Invalid response format');
        return null;
      }

      final List<dynamic>? blocks = response['data'];
      if (blocks == null || blocks.isEmpty) return null;

      final swipperBlock = blocks
          .cast<Map<String, dynamic>>()
          .firstWhere(
            (block) => block['type']?.toString().toLowerCase() == 'swipperslider',
            orElse: () => {},
          );

      if (swipperBlock.isNotEmpty) {
        return SwipperSliderModel.fromJson(swipperBlock);
      }
    } catch (e) {
      print('🛑 SwipperSliderService error: $e');
    }

    return null;
  }
}
