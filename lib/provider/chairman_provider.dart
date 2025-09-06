import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:raparva_app/data/models/chairman_model.dart';
import 'package:raparva_app/data/services/chairmain_api.dart';


final staticBannerProvider = FutureProvider<StaticBanner?>((ref) async {
  return await StaticBannerService.fetchStaticBanner();
});
