import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:raparva_app/data/models/photo_gallery_model.dart';
import 'package:raparva_app/data/services/photo_gallary_api_services.dart';


final photoGalleryProvider = FutureProvider<PhotoGalleryResponse>((ref) async {
  return await PhotoGalleryService.fetchPhotoGallery();
});
