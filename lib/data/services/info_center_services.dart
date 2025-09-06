// import 'package:raparva_app/core/constants/api_constants.dart';
// import 'package:raparva_app/core/utils/api_util.dart';
// import 'package:raparva_app/data/models/info_center_model.dart';

// class InfoCenterService {
//   static Future<InfoCenterModel?> fetchInfoCenter() async {
//     try {
//       final response = await ApiUtil.get(ApiConstants.homePage);

//       final contentList = response['content'] as List<dynamic>? ?? [];

//       final infoBlock = contentList.firstWhere(
//         (item) =>
//             item['type'] == 'box_featured' &&
//             item['name'] == 'Box Featured', // You can adjust condition as needed
//         orElse: () => null,
//       );

//       if (infoBlock != null) {
//         return InfoCenterModel.fromJson(infoBlock);
//       }
//       return null;
//     } catch (e) {
//       throw Exception('Failed to load InfoCenter: $e');
//     }
//   }
// }





import 'package:raparva_app/core/constants/api_constants.dart';
import 'package:raparva_app/core/utils/api_util.dart';
import 'package:raparva_app/data/models/info_center_model.dart';

class InfoCenterService {
  static Future<InfoCenterModel?> fetchInfoCenter() async {
    try {
      final response = await ApiUtil.get(ApiConstants.homePage); 

      final List<dynamic> contentList = response['content'] ?? [];

      final infoBlock = contentList.firstWhere(
        (item) =>
            item is Map<String, dynamic> &&
            item['type'] == 'box_featured' &&
            item['name'] == 'Box Featured', // Adjust this as needed
        orElse: () => null,
      );

      if (infoBlock != null && infoBlock is Map<String, dynamic>) {
        return InfoCenterModel.fromJson(infoBlock);
      }

      return null;
    } catch (e, stack) {
      print('❌ InfoCenterService.fetchInfoCenter error: $e');
      return null;
    }
  }
}
