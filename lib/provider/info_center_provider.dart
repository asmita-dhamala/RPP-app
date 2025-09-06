import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:raparva_app/data/models/info_center_model.dart';
import 'package:raparva_app/data/services/info_center_services.dart';

final infoCenterProvider = FutureProvider<InfoCenterModel?>((ref) async {
  return await InfoCenterService.fetchInfoCenter();
});
