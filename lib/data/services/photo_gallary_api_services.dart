import 'package:raparva_app/core/constants/api_constants.dart';
import 'package:raparva_app/core/utils/api_util.dart';
import '../models/photo_gallery_model.dart';  // Adjust path accordingly

class PhotoGalleryService {
  static Future<PhotoGalleryResponse> fetchPhotoGallery() async {
    final response = await ApiUtil.get(ApiConstants.photoGallery, useRawUrl: true);

    if (response == null || response is! Map<String, dynamic>) {
      throw Exception('Invalid API response');
    }

    return PhotoGalleryResponse.fromJson(response);
  }
}
