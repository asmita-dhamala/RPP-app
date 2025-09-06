import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/models/press_model.dart';
import '../data/services/press_service.dart';


final pressReleaseProvider = FutureProvider<List<PressReleaseModel>>((ref) async {
  return await PressReleaseService.fetchPressReleases();
});
