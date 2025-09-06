import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:raparva_app/data/models/video_container_model.dart';
import 'package:raparva_app/data/services/video_container_service.dart';

final apiServiceProvider = Provider<VideoApiService>((ref) => VideoApiService());

final videoContainerProvider = FutureProvider<VideoContainerModel>((ref) async {
  final apiService = ref.watch(apiServiceProvider);
  return await apiService.fetchVideoContainerV2();
});

final selectedVideoUrlProvider = StateProvider<String?>((ref) => null);