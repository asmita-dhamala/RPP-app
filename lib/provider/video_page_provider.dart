import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:raparva_app/data/models/video_page_model.dart';
import 'package:raparva_app/data/services/video_page_api.dart';


final VideoPageProvider = FutureProvider<VideoPageModel>((ref) async {
  final service = VideoPageService();
  return service.fetchVideos();
});
