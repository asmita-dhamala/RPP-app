import 'package:raparva_app/core/constants/api_constants.dart';
import 'package:raparva_app/core/utils/api_util.dart';
import 'package:raparva_app/data/models/video_container_model.dart';

class VideoApiService {
  Future<VideoContainerModel> fetchVideoContainerV2() async {
    // ✅ FIXED: Correct endpoint used — homePage
    final response = await ApiUtil.get(ApiConstants.homePage, useRawUrl: true);

    if (response == null || response is! Map<String, dynamic>) {
      throw Exception('Invalid API response format.');
    }

    final Map<String, dynamic> jsonData = response;

    final List<dynamic>? dataList = jsonData['data'];

    if (dataList == null || dataList.isEmpty) {
      throw Exception('No "data" found in API response or it is empty.');
    }

    Map<String, dynamic>? videoContainerJson;

    for (var block in dataList) {
      if (block is Map<String, dynamic>) {
        final type = block['type']?.toString().toLowerCase();
        print('🔎 Block type found: $type');

        if (type == 'videocontainerv2') {
          videoContainerJson = block;
          break;
        }
      }
    }

    if (videoContainerJson != null) {
      return VideoContainerModel.fromJson(videoContainerJson);
    } else {
      throw Exception('Video container block of type "videocontainerv2" not found.');
    }
  }
}
