import 'package:raparva_app/core/constants/api_constants.dart';
import 'package:raparva_app/core/utils/api_util.dart';
import '../models/video_page_model.dart';

class VideoPageService {
  Future<VideoPageModel> fetchVideos() async {
    // Added useRawUrl true assuming ApiConstants.videoGallery is a full URL
    final response = await ApiUtil.get(ApiConstants.videoGallery, useRawUrl: true);

    // ApiUtil.get returns decoded JSON, so no response.statusCode or response.body
    if (response == null || response is! Map<String, dynamic>) {
      throw Exception('Invalid API response format');
    }

    return VideoPageModel.fromJson(response);
  }
}
