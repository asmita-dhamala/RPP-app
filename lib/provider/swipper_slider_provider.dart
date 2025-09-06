import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:raparva_app/data/models/SwipperSliderModel.dart';
import 'package:raparva_app/data/services/swipper_slider_service.dart';


final swipperSliderProvider = FutureProvider<SwipperSliderModel?>((ref) async {
  return await SwipperSliderService.fetchSwipperSlider();
});
