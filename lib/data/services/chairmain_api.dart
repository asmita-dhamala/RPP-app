import 'package:raparva_app/core/constants/api_constants.dart';
import 'package:raparva_app/data/models/chairman_model.dart';
import '../../core/utils/api_util.dart';

class StaticBannerService {
  static Future<StaticBanner?> fetchStaticBanner() async {
    try {
      // Assuming ApiConstants.homePage is a full URL
      final response = await ApiUtil.get(ApiConstants.homePage, useRawUrl: true);

      // ApiUtil.get() already returns decoded JSON (Map<String, dynamic>)
      if (response == null || response is! Map<String, dynamic>) {
        print('Invalid API response format');
        return null;
      }

      final List<dynamic>? dataList = response['data'];
      if (dataList == null) return null;

      // Find block with type 'staticbanner' or 'Staticbanner' (check exact API)
      final Map<String, dynamic> staticBannerJson = dataList
          .cast<Map<String, dynamic>>()
          .firstWhere(
            (item) => (item['type'] as String).toLowerCase() == 'staticbanner',
            orElse: () => {},
          );

      if (staticBannerJson.isNotEmpty) {
        return StaticBanner.fromJson(staticBannerJson);
      }
    } catch (e) {
      print('Error fetching StaticBanner: $e');
    }

    return null;
  }
}
